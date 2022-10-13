#import base64
from google.oauth2 import service_account
from google.cloud import vision_v1
from google.cloud import firestore
from google.cloud import storage

import os

os.environ['http_proxy'] = 'http://localhost:3129'
os.environ['https_proxy'] = 'http://localhost:3129'

svc_credentials = service_account.Credentials.from_service_account_file('./ai-image-test-key.json', scopes=["https://www.googleapis.com/auth/cloud-platform"])

def analyze_image ():
    #Create the Cloud Vision client and have it analyze the new image in the GCS bucket
    file = {'name':'g948ad59f22242d38a39b0f823f16b3fe0c353c11495635233657fb13cb274060e6113aa591600915aa678bcc899c9cb6fa6bb4d2b456b486049cbb96a1578c2f_1280.jpg'}
    vClient=vision_v1.ImageAnnotatorClient(credentials=svc_credentials)
    #Create the image source object and add the URL as a property of that object
    imgSrc=vision_v1.ImageSource()
    imgSrc.image_uri='https://storage.googleapis.com/ai-test-images/'+file['name']
    #Create the image object and add the image source object to it
    image=vision_v1.Image()
    image.source=imgSrc
    #Create the annotate image request object and add the image object to it
    request=vision_v1.AnnotateImageRequest()
    featuresA=vision_v1.Feature()
    featuresA.max_results=10
    featuresA.type=vision_v1.Feature.Type['LABEL_DETECTION']
    request.features=[featuresA]
    request.image=image
    #Call the batch annotte images method with a single annotate image request
    response = vClient.batch_annotate_images(requests=[request])
    labels=[]
    for item in response.responses[0].label_annotations:
        if item.score >= 0.9:
            labels.insert(0, [item.description, item.score])
    labels.reverse()
    print(str(labels)[1:-1])
    # Now get the original search term from the GCS object metadata
    gcsClient = storage.Client(credentials=svc_credentials)
    bucket = gcsClient.get_bucket('ai-test-images')
    blob = bucket.blob(file['name'])
    origQuery=blob.metadata['search term']
    # Now update the firestore DB with the data
    dbClient = firestore.Client(project='test-01', credentials=svc_credentials)
    collectionRef = dbClient.collection(u'ai-test-collection')
    documentId = file['name']
    docData = {}
    docData['Original query']=origQuery
    itemCount=1
    for item in labels:
        docData['Annotation '+str(itemCount)]=item[0]
        docData['Annotation '+str(itemCount)+' probability']=item[1]
        itemCount+=1
    collectionRef.add(document_id= documentId, document_data = docData)  
    
analyze_image()
