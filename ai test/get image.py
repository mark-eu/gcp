import base64
import requests
from google.cloud import storage
from PIL import Image
from io import BytesIO

# Replace API key below with the Pixabay API key
apiKey='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
urlBase='https://pixabay.com/api'

def get_image (event, context):
    #find an image based on the message content
    imageQuery = base64.b64decode(event['data']).decode('utf-8')
    response = requests.get(urlBase, params={'key':apiKey, 'safesearch':'true', 'q':imageQuery})
    jsonData=response.json()
    imageUrl=jsonData['hits'][0]['largeImageURL']
    #Now get the actual image from its URL
    imageResponse=requests.get(imageUrl)
    image = Image.open(BytesIO(imageResponse.content))
    image.save('/tmp/'+imageUrl.split('/')[-1])
    #write to cloud storage
    gcsClient = storage.Client()
    bucket = gcsClient.get_bucket('ai-test-images')
    blob = bucket.blob(imageUrl.split('/')[-1])
    blob.metadata={'search term':imageQuery}
    imageFile=open('/tmp/'+imageUrl.split('/')[-1], 'r+b')
    blob.upload_from_file(imageFile)