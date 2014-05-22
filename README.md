docker-puppet-master-agent
==========================

A puppet master and its agent living their life inside their docker container.

## Init

## Puppet Operations

Once you have a master and a slave running.

Connect to master with ssh and list certificates:
```
puppet cert --list
```

You should see your agent, so sign its certificate.
```
puppet cert --sign agent
```

Your agent should now be able to get its catalog from the master and apply the configuration.


## Debugging

Debugging puppet agent :
```
puppet agent --verbose --no-daemonize
```

## Docker Limitation

It's not possible to edit /etc/hosts in a container. Discussed [here](https://github.com/dotcloud/docker/issues/2267).

You cannot modify ulimit from within a container.
