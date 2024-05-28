![image](https://github.com/FriendUPCloud/friendos-docker/blob/main/friendos.jpg?raw=true "Friend OS v1.3 Helium")

# friendos-docker
A clean and simple Docker image for Friend OS. You need the following additional docker images in order to run this.

 * [friendos-mysql-docker](https://github.com/friendupCloud/friendos-mysql-docker) - run this first
 * ... then run this docker image

In order to make everything working, you need to set up a docker network so that all three docker images (friendcore, mysql, file server) can reach each other.

 * docker network create friendos-network

Once these images are running, you can find FriendOS in a browser at:

 * http://localhost:16502/webclient/index.html

Websocket will not be working. In order to fix that, you should set up a basic reverse proxy from port 16500 to 6500. Additionally, you should set up a reverse proxy from port 16502 to 443 (with SSL) or 80 (without SSL).

**Good luck!**


## Building and running

```bash
docker-compose up --build
```

## If you want to enter the docker container

```bash
docker exec -it friendos-docker-container bash
```

## If you want to re-build the image for some reason, do this:

```bash
docker rmi friendos-docker
```

