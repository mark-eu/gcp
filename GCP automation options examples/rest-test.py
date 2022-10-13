# PoC for accessing the GCP REST interface
#
# N.B. this code uses a locally installed proxy that takes care of the NTLM auth to the NTLM proxy servers. This means this
# code does not include the NTLM auth, so if you don't use CNTLM then you will need to do one of:
# - use an alternative local NTLM auth capable proxy
# - implement proxy access and NTLM authentication in the code and provide a secure way for users to use it
# - use a proxy server that does not require authentication

import time
import json
import jwt # from "pip install pyjwt" (*not* "pip install jwt")
import requests # from "pip install requests"

# Create the proxy list for the requests module so that GCP calls go to local CNTLM service -> DTAG proxy -> internet
proxyList={'http': 'http://localhost:3129', 'https': 'http://localhost:3129'}

# Info for this REST call.
project = 'test-project-01'
region = 'europe-west1'
zone = 'europe-west1-b'
servername = 'test-ce-test-01'
vpc = 'test-vpc-1'

#Define the URL to send the REST request to
url='https://www.googleapis.com/compute/v1/projects/{0}/zones/{1}/instances'.format(project,zone)

# Define a small Compute Engine instance that we want to create
jsonDict={'canIpForward': False,
          'confidentialInstanceConfig': {'enableConfidentialCompute': False},
          'deletionProtection': False,
          'description': '',
          'disks': [{'autoDelete': True,
                     'boot': True,
                     'deviceName': servername,
                     'initializeParams': {'diskSizeGb': '10',
                                          'diskType': 'projects/{0}/zones/{1}/diskTypes/pd-balanced'.format(project,zone),
                                          'labels': {},
                                          'sourceImage': 'projects/debian-cloud/global/images/debian-11-bullseye-v20220519'},
                     'mode': 'READ_WRITE',
                     'type': 'PERSISTENT'}],
          'displayDevice': {'enableDisplay': False},
          'guestAccelerators': [],
          'keyRevocationActionType': 'NONE',
          'labels': {},
          'machineType': 'projects/{0}/zones/{1}/machineTypes/e2-micro'.format(project,zone),
          'metadata': {'items': []},
          'name': servername,
          'networkInterfaces': [{'accessConfigs': [{'name': 'External NAT', 'networkTier': 'PREMIUM'}],'stackType': 'IPV4_ONLY', 'subnetwork': 'projects/{0}/regions/{1}/subnetworks/{2}'.format(project,region,vpc)}],
          'reservationAffinity': {'consumeReservationType': 'ANY_RESERVATION'},
          'scheduling': {'automaticRestart': True, 'onHostMaintenance': 'MIGRATE', 'provisioningModel': 'STANDARD'},
          'serviceAccounts': [{'email': '867891218872-compute@developer.gserviceaccount.com', 'scopes': ['https://www.googleapis.com/auth/devstorage.read_only', 'https://www.googleapis.com/auth/logging.write', 'https://www.googleapis.com/auth/monitoring.write', 'https://www.googleapis.com/auth/servicecontrol', 'https://www.googleapis.com/auth/service.management.readonly', 'https://www.googleapis.com/auth/trace.append']}],\
          'shieldedInstanceConfig': {'enableIntegrityMonitoring': True, 'enableSecureBoot': False, 'enableVtpm': True},
          'tags': {'items': []},
          'zone': 'projects/{0}/zones/{1}'.format(project,zone)}

# Service Account credentials in JSON format - obviously this account has to have permissions to do what you want to do on GCP
# which *must* inlcude the iam.serviceAccountUser role or the request will be rejected. 
credentials_filename = './svc-account.json'

# Define the oAuth access token that we want to have
scope = "https://www.googleapis.com/auth/cloud-platform"
lifetime = 3600	# i.e. 1 hour
gcpAuthUrl = "https://www.googleapis.com/oauth2/v4/token" # Google endpoint for creating OAuth 2.0 access tokens from a signed JWT

def create_signed_jwt(credFileName, authUrl, scope, expiry):
    ''' Create a Signed JWT from a service account JSON credentials file. '''
    #Get the private key info from the JSON format Service Account credentials file
    with open(credFileName, 'r') as f:
        data = f.read()
        credentials = json.loads(data)
        pKey = credentials['private_key']
        pKeyID = credentials['private_key_id']
        pKeyEmail = credentials['client_email']
    
    issued = int(time.time())
    expires = issued + expiry
    
    # JWT Headers
    jwtHeaders = {
        'kid': pKeyID,
        "alg": "RS256", # Google uses SHA256withRSA
        "typ": "JWT"
    }

    # JWT Payload
    payload = {
        "iss": pKeyEmail,   # Issuer claim
        "sub": pKeyEmail,   # Issuer claim
        "aud": authUrl,	    # Audience claim
        "iat": issued,	    # Issued at claim
        "exp": expires,	    # Expire time
        "scope": scope	    # Permissions
    }

    # Encode the headers and payload and sign, creating a signed JWT
    jwtSigned = jwt.encode(payload, pKey, algorithm="RS256", headers=jwtHeaders)

    return jwtSigned

def get_access_token(signedJwt, authUrl):
    '''
    This function takes a signed JWT and exchanges it for a GCP OAuth access token.
    '''
    params = {
        "grant_type": "urn:ietf:params:oauth:grant-type:jwt-bearer",
        "assertion": signedJwt
    }

    response = requests.post(authUrl, data=params, proxies = proxyList)
    print("Token request return status code is -> " + str(response.status_code))
    print(response.text)
    if response.ok:
        #return(r.json()['access_token'], '')
        return(response.json()['access_token'])
    raise Exception ('Error creating access token - '+str(response))

# Now we run the program
# Get the oAuth access token for GCP
signedJwt = create_signed_jwt(credentials_filename, gcpAuthUrl, scope, lifetime)
accessToken = get_access_token(signedJwt, gcpAuthUrl)

# Define REST request headers, including the access token
headerList = {
    "Host": "www.googleapis.com",
    "Authorization": "Bearer " + accessToken,
    "Content-Type": "application/json"
}

#Make the REST call and print the result
response=requests.post(url, json=jsonDict, headers = headerList, proxies=proxyList)
print('REST request return status code is -> ' + str(response.status_code))
print(response.text)

