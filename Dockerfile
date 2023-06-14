FROM ubuntu:22.04

COPY /scripts /scripts

RUN chmod +x /scripts/*.sh

RUN apt update

RUN apt install -y rsync

CMD sleep 50
