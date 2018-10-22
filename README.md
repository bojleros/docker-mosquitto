# mosquitto

Docker image for Mosquitto mqtt

## Description

This image uses alpine mqtt packages. Default configuration contains:

- logging to stdout
- auth enabled , require passwd file


## How to start

Create your own password file for client auhentication:

```
mkdir -p /docker/mosquitto/secrets
mosquitto_passwd -c passwd your_username
```

Start up docker container:

```
docker run -d --name mosquitto -p 1833:1833 -v /docker/mosquitto/secrets:/mosquitto/secrets:ro bojleros/mosquitto
```
