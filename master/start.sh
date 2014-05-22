#!/bin/bash
IP=$(hostname -i)

hasConf=$(cat /etc/puppet/puppet.conf | grep -c certname)

#Configure master
if (($hasConf == 0)); then
  echo "[master]" >> /etc/puppet/puppet.conf
  echo "dns_alt_names=puppet, master, "$IP >> /etc/puppet/puppet.conf
  echo "certname=master" >> /etc/puppet/puppet.conf

  service puppetmaster restart
fi

/usr/sbin/sshd -D
