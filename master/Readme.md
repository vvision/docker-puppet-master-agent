# Master

Create a docker container with a puppetmaster.

Build:
````
docker build --rm=true -t master .
```

Launch:
```
docker run -d -P --name master master
```

Check:
```
docker ps
```
Remember port to connect to: ```0.0.0.0:49165->22/tcp```

Connect with ssh:
```
ssh root@localhost -p 49165
```

Password to log in is *root*.
