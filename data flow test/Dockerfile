FROM python:3.10.6-bullseye
RUN apt update
RUN apt upgrade -y
RUN apt install -y netcat
RUN mkdir /home/user
COPY requirements.txt /home/user/
COPY stream_client.py /home/user/
COPY data-account.json /home/user/
COPY run.sh /home/user/
RUN chmod 777 /home/user/run.sh
RUN pip3 install -r /home/user/requirements.txt
CMD ["/home/user/run.sh"]