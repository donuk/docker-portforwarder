Also on dockerhub:

https://hub.docker.com/r/donuk/portforwarding

Run as a reverse proxy to hub.docker.com:

```
docker run -p 80:80 -p 443:443 -e PORT_80=hub.docker.com -e PORT_443=hub.docker.com --rm donuk/portforwarding 
```

Serve hub.docker.com over http locally on port 2000:

```
docker run -p 2000:2000 -e PORT_2000=hub.docker.com:80 --rm donuk/portforwarding 
```

## IP restriction

Set `ALLOWED_IPS` to a comma-separated list of allowed IPv4/IPv6 addresses or CIDR ranges. Connections from other client IPs are denied.

```
docker run -p 443:443 -e PORT_443=hub.docker.com -e ALLOWED_IPS="203.0.113.10,2001:db8::/32,10.0.0.0/8" --rm donuk/portforwarding
```
