# Master
#
# VERSION               0.0.1

FROM     debian:wheezy
MAINTAINER vvision "vvision@sfr.fr"

# Make sure the package repository is up to date
RUN apt-get update

RUN apt-get install -y openssh-server
RUN apt-get install -y puppetmaster
RUN apt-get install -y nano
RUN mkdir /var/run/sshd 
RUN echo 'root:root' |chpasswd

# Install some puppet modules.
# Installing apache as an example
RUN puppet module install puppetlabs-apache

ADD ./site.pp /etc/puppet/manifests/
RUN chmod +r /etc/puppet/manifests/site.pp

ADD ./start.sh /root/

EXPOSE 22
CMD ["/bin/bash", "/root/start.sh"]
