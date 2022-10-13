from google import pubsub_v1
from google.oauth2 import service_account
import websockets
import asyncio

project='test-01'
topic='data-test'
uri= 'wss://ws.coincap.io/trades/binance'

svc_credentials = service_account.Credentials.from_service_account_file('./data-account.json', scopes=["https://www.googleapis.com/auth/cloud-platform"])

def publish(data, project, pubsubTopic):
    publisher = pubsub_v1.PublisherClient(credentials=svc_credentials)
    topicPath=publisher.topic_path(project, pubsubTopic)
    pubsubMsg=pubsub_v1.types.PubsubMessage(data=data.encode('utf-8'))
    publisher.publish(topic=topicPath, messages=[pubsubMsg]) 

async def main(uri, project,topic):
    count=0
    async with websockets.connect(uri) as websocket:
        while(True):
            msg = await websocket.recv()
            count+=1
            if count ==500:
                publish(msg, project, topic)
                count=0
            else:
                continue

asyncio.run(main(uri, project, topic))

