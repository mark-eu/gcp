from google.cloud import firestore
from google.oauth2 import service_account
import random
import os

# Trigger this code with the command line 'gcloud pubsub topics publish test-topic-01 --message "Hello 01"'

os.environ['http_proxy'] = 'http://localhost:3129'
os.environ['https_proxy'] = 'http://localhost:3129'
projectName='test-project-01'

key_path='./firestore-key.json'
credentials = service_account.Credentials.from_service_account_file(key_path, scopes=["https://www.googleapis.com/auth/cloud-platform"])
dbClient = firestore.Client(projectName', credentials=credentials)
collectionRef = dbClient.collection(u'test-collection')
docsList=collectionRef.list_documents()
docNum=0
for docRef in docsList:
    snapshot = docRef.get()
    print(snapshot.id)
    date = snapshot.get('date')
    dataId = snapshot.get('id')
    testValue = snapshot.get('test')
    print(date)
    print(dataId)
    print(testValue+'\n')
    num=snapshot.id.split('-')[3]
    if docNum <= int(num):
        docNum = int(num)+1
print(str(docNum))

documentId = 'mbw-test-doc-' + str(docNum)
nodeId = str(random.randint(1000000, 9999999))
docData = {'date': '2022-08-05', 'id':nodeId, 'test':'test value '+ str(docNum)}

collectionRef.add(document_id= documentId, document_data = docData)