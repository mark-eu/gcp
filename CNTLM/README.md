## What is CNTLM?

If you have to use Windows for development work, and have an outgoing internet
proxy server that uses NTLM authentication, then this can be a problem when
running terminal commands or running code on your local machine. CNTLM is an
additional proxy server that you install on your desktop/laptop Windows 
machine, it does the NTLM auth to the internet proxy for outgoing internet
traffic and listens on the loopback address of your desktop/laptop (as
configured in the ini file). Point your code/terminal commands/GUI applications
at the CNTLM service port.


## Pre Requisites

- Enhanced User Rights to install additional software and Windows services on your desktop/laptop

## Installation

- Run cntlm-0.94beta1-win64.exe to install cntlm as a Windows service
- Use the default settings during installation
- Default directory: "C:\Program Files (x86)\Cntlm"

## Configuration

Copy the pre-configured cntlm.ini into the default directory replacing the existing file.

Open a cmd window as administrator and edit the cntlm.ini file:

 - Search and replace “XXXXXXXXX” with your AD domain UID.
 - Search and replace "YYYYYYYYY" with your AD domain name

Save the result but keep the file open.

Run the script "get_PW_hash.cmd" in the cmd window (enter your AD domain password).

Copy the NTLMv2 hash displayed and replace “ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ” in the cntlm.ini with the hash.

**When your AD domain password changes, re-run the above steps to update the cntlm.ini file (obviously :-)).**

Now save the cntlm.ini file and restart the CNTLM service with "net stop cntlm" -> "net start cntlm" (N.B. don't use "net restart cntlm", it doesn't work - I don't know why not) 

## How to tell applications to use the local proxy
 - Specify the proxy URI in your code, if the libraries you are using and/or your code supports using a proxy server
 - In a cmd.exe session, some tools will look for the HTTP_PROXY and HTTPS_PROXY environment variables and if they are set the tools will use the proxy defined in them. (use the "setp.cmd" script each time you open a cmd.exe session window)
 - Many command line tools have the option to specify a proxy as an argument to the command (e.g. somecommand -p http://localhost:3129)
 - GUI applications and persistently setting the environment variables for cmd.exe sessions needs to have the Windows environment variables HTTP_PROXY and HTTPS_PROXY set to "http://localhost:3129" (for both HTTP_PROXY and HTTPS_PROXY - this is not a mistake).
