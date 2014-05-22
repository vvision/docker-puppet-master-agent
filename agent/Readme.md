# Agent

Create a docker container with a puppet agent.

Build :
````
docker build --rm=true -t agent .
```

Launch and link to a container named *master* running a puppetmaster:
```
docker run -d -P --link master:master --name agent agent
```

Check :
```
docker ps
```
Remember port to connect : ```0.0.0.0:49166->22/tcp```

Connect with ssh :
```
ssh root@localhost -p 49165
```

Password to log in is *root*.
