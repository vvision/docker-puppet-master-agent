# Agent
#
# VERSION               0.0.1

FROM     debian:wheezy
MAINTAINER vvision "vvision@sfr.fr"

# make sure the package repository is up to date
RUN apt-get update

RUN apt-get install -y openssh-server
RUN apt-get install -y puppet
RUN apt-get install -y nano
RUN mkdir /var/run/sshd 
RUN echo 'root:root' |chpasswd

ADD ./start.sh /root/

EXPOSE 22
CMD ["/bin/bash", "/root/start.sh"]
