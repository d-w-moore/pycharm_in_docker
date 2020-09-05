FROM ubuntu:18.04
RUN apt update
RUN apt install -y wget x11-common python2.7-dev openjdk-11-jre
RUN wget \
    https://download.jetbrains.com/python/pycharm-community-2020.2.1.tar.gz
