import base64
import requests
from google.cloud import storage
from google.cloud import secretmanager_v1
from PIL import Image
from io import BytesIO
import os
from google.oauth2 import service_account

urlBase='https://pixabay.com/api'
secretKeyName='pixabay-key-1'
svc_credentials = service_account.Credentials.from_service_account_file('../../keys/ai-test-key.json', scopes=["https://www.googleapis.com/auth/cloud-platform"])
projectName=svc_credentials.project_id
#os.environ['http_proxy'] = 'http://localhost:3129'
#os.environ['https_proxy'] = 'http://localhost:3129'

def get_secret(projectName, keyName):
    client = secretmanager_v1.SecretManagerServiceClient(credentials=svc_credentials)
    keyPathName = 'projects/{0}/secrets/{1}/versions/latest'.format(projectName, keyName)
    request = secretmanager_v1.AccessSecretVersionRequest(name=keyPathName)
    response = client.access_secret_version(request=request)
    secret = response.payload.data.decode('utf-8')
    return(secret)

def get_image ():
    #find an image based on the message content
    #- TESTING - IN THE REAL CODE THE QUERY 'ships' COMES FROM THE EVENT FROM THE PUB/SUB TOPIC
    response = requests.get(urlBase, params={'key':get_secret(projectName,secretKeyName), 'safesearch':'true', 'q':'ships'})
    jsonData=response.json()
    imageUrl=jsonData['hits'][0]['largeImageURL']
    #Now get the actual image using ts URL
    imageResponse=requests.get(imageUrl)
    image = Image.open(BytesIO(imageResponse.content))
    image.save(imageUrl.split('/')[-1])
    #write to cloud storage
    gsClient = storage.Client(credentials=svc_credentials)
    bucket = gsClient.get_bucket('ai-test-images')
    blob = bucket.blob(imageUrl.split('/')[-1])
    #- TESTING - IN THE REAL CODE THE QUERY 'ships' COMES FROM THE EVENT FROM THE PUB/SUB TOPIC
    blob.metadata={'search term':'ships'}
    imageFile=open(imageUrl.split('/')[-1], 'r+b')
    blob.upload_from_file(imageFile)
    
get_image()
