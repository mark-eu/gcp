import base64
import requests
from google.cloud import storage
from google.cloud import secretmanager_v1
from PIL import Image
from io import BytesIO

urlBase='https://pixabay.com/api'
secretKeyName='pixabay-key-1'

def get_secret (keyName, projectName=''):
    if not projectName:
        headers = {'Metadata-Flavor':'Google'}
        response = requests.get('http://metadata.google.internal/computeMetadata/v1/project/project-id', headers=headers)
        projectName=response.text
    client = secretmanager_v1.SecretManagerServiceClient()
    keyPathName = 'projects/{0}/secrets/{1}/versions/latest'.format(projectName, keyName)
    request = secretmanager_v1.AccessSecretVersionRequest(name=keyPathName)
    response = client.access_secret_version(request=request)
    secret = response.payload.data.decode('utf-8')
    return(secret)

def get_image (event, context):
    #find an image based on the message content
    imageQuery = base64.b64decode(event['data']).decode('utf-8')
    response = requests.get(urlBase, params={'key':get_secret(secretKeyName), 'safesearch':'true', 'q':imageQuery})
    jsonData=response.json()
    imageUrl=jsonData['hits'][0]['largeImageURL']
    #Now get the actual image using its URL
    imageResponse=requests.get(imageUrl)
    image = Image.open(BytesIO(imageResponse.content))
    image.save('/tmp/'+imageUrl.split('/')[-1])
    #write to cloud storage
    gsClient = storage.Client()
    bucket = gsClient.get_bucket('ai-test-images')
    blob = bucket.blob(imageUrl.split('/')[-1])
    blob.metadata={'search term':imageQuery}
    imageFile=open('/tmp/'+imageUrl.split('/')[-1], 'r+b')
    blob.upload_from_file(imageFile)