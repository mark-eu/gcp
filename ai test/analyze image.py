import base64
from google.cloud import vision_v1
from google.cloud import firestore
from google.cloud import storage

def analyze_image (event, context):
    # Create an image source object and add the URL as a property of that object (file name from the GCS new object event triggering the cloud function)
    file = event
    imgSrc=vision_v1.ImageSource()
    imgSrc.image_uri='gs://ai-test-images/'+file['name']
    #Create an image object and add the image source object to it
    image=vision_v1.Image()
    image.source=imgSrc
    # Create and configure a feature object
    feature=vision_v1.Feature()
    feature.max_results=30
    feature.type=vision_v1.Feature.Type['LABEL_DETECTION']
    # Create an annotate image request object and add the image and feature objects to it
    request=vision_v1.AnnotateImageRequest()
    request.features=[feature]
    request.image=image
    # Create an Image Annotator object Call the batch annotate images method with a single annotate image request
    vClient=vision_v1.ImageAnnotatorClient()
    response = vClient.batch_annotate_images(requests=[request])
    labels=[]
    for item in response.responses[0].label_annotations:
        if item.score >= 0.9:
            labels.insert(0, [item.description, item.score])
    labels.reverse()     
    # Now get the original search term from the GCS object metadata
    gcsClient = storage.Client()
    bucket = gcsClient.get_bucket('ai-test-images')
    blob = bucket.blob(file['name'])
    blob.patch()
    origQuery=blob.metadata['search term']
    # Now update the firestore DB with the data
    dbClient = firestore.Client(project='test-01')
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