Also on dockerhub:

https://hub.docker.com/r/donuk/portforwarding

Run as a reverse proxy to hub.docker.com:

```
docker run -e PORT_80=hub.docker.com -e PORT_443=hub.docker.com --rm donuk/portforwarding 
```

Serve hub.docker.com over http locally on port 2000:

```
docker run -e PORT_2000=hub.docker.com:80 --rm donuk/portforwarding 
```


