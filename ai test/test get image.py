from google.oauth2 import service_account
import base64
import requests
import google.cloud.storage as gs
import os
from PIL import Image
from io import BytesIO

apiKey='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
urlBase='https://pixabay.com/api'
os.environ['http_proxy'] = 'http://localhost:3129'
os.environ['https_proxy'] = 'http://localhost:3129'

svc_credentials = service_account.Credentials.from_service_account_file('c:\\code\\gcp\\ai-image-test-key.json', scopes=["https://www.googleapis.com/auth/cloud-platform"])

def get_image():
    #Search for an image in Pixabay
    response = requests.get(urlBase, params={'key':apiKey, 'safesearch':'true', 'q':'people'})
    jsonData=response.json()
    imageUrl=jsonData['hits'][0]['largeImageURL']
    #Now get the actual image from its URL
    imageResponse=requests.get(imageUrl)
    image = Image.open(BytesIO(imageResponse.content))
    image.save(imageUrl.split('/')[-1])
    #write to cloud storage
    gsClient = gs.Client(credentials=svc_credentials)
    bucket = gsClient.get_bucket('ai-test-images')
    blob = bucket.blob(imageUrl.split('/')[-1])
    blob.metadata={'search term':'people'}
    imageFile=open(imageUrl.split('/')[-1], 'r+b')
    blob.upload_from_file(imageFile)
    
get_image()
