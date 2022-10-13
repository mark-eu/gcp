#!/bin/bash
/bin/netcat -l 8080 &
python3 /home/user/stream_client.py