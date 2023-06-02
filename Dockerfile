FROM ubuntu:22.04
COPY arch-clone.sh /arch-clone.sh
COPY parrot-clone.sh /parrot-clone.sh
RUN chmod +x /*.sh
RUN apt update
RUN apt install -y rsync

CMD sleep 50
