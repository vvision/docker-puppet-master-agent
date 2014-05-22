#!/bin/bash
IP=$(hostname -i)
#To be used in puppet file definition in node
name="agent"
#Name of your puppetmaster container
puppetmaster="master"

hasConf=$(cat /etc/puppet/puppet.conf | grep -c certname)
hasPluginSync=$(cat /etc/puppet/puppet.conf | grep -c pluginsync)
startOnBoot=$(cat /etc/default/puppet | grep -c START=yes)

#Configuration to reach the master
if (($hasConf == 0)); then
  echo "[agent]" >> /etc/puppet/puppet.conf
  echo "server="$puppetmaster >> /etc/puppet/puppet.conf
  echo "certname=agent" >> /etc/puppet/puppet.conf
fi

#pluginsync=true is needed to install puppetlabs-apache
#At least on the agent
if (($hasPluginSync == 0)); then
  echo "[main]" >> /etc/puppet/puppet.conf
  echo "pluginsync=true" >> /etc/puppet/puppet.conf
fi

#Changed to START=yes
#Enable starting puppet with service
if (($startOnBoot == 0)); then
  sed -i.bak s/START=no/START=yes/g /etc/default/puppet
fi

#Start puppet agent
service puppet start

/usr/sbin/sshd -D
