# PoC for using the GCP Client Libraries 
#
# N.B. this code uses a locally installed proxy that takes care of the NTLM auth to the NTLM proxy servers.

from google.cloud import storage # from "pip install google-cloud"
import uuid
import os

# Set the proxy so that GCP calls go to local CNTLM service -> proxy -> internet
os.environ['http_proxy'] = 'http://localhost:3129'
os.environ['https_proxy'] = 'http://localhost:3129'

# Setup the new bucket. Note that the Service Account used must have the "Storage Admin" IAM Role (which includes the Storage Create Bucket permission)
name=str(uuid.uuid4()) # Generate a unique name for the bucket
storageClient = storage.Client.from_service_account_json('./storage-client.json')
bucket = storageClient.bucket(name)
bucket.storage_class = "STANDARD"

# Create the new bucket
new_bucket = storageClient.create_bucket(bucket, location="EUROPE-WEST1")
print("Bucket {0} created.".format(bucket.name))
print('Finished') 
