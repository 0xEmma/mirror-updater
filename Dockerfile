FROM ubuntu:22.04

COPY /clone.sh /clone.sh

RUN chmod +x /clone.sh

RUN apt update

RUN apt install -y rsync

CMD ./clone.sh
