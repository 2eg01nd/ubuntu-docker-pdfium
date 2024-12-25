FROM ubuntu:22.04

RUN apt-get update && apt-get -y install \
 build-essential \
 git \
 nano \
 sudo \
 curl \
 wget \
 python3 \
 lsb-release \
 file

RUN useradd -m -g users -G sudo -s /bin/bash user && echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/user

USER user

WORKDIR /home/user

COPY build.sh build.sh
COPY steps steps
COPY patches patches
COPY example example

ENTRYPOINT [ "bash" ]
