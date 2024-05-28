![image](friendos.png "Friend OS v1.3 Helium")

# friendos-docker
A clean and simple Docker image for Friend OS. You need the following additional
docker images in order to run this.

 * [friendos-mysql-docker](https://github.com/friendupCloud/friendos-mysql-docker) - run this first
 * friendos-file-server-docker - run this second
 * ... then run this docker image

In order to make everything working, you need to set up a docker network so that all three docker images (friendcore, mysql, file server) can reach each other.

 * docker network create friendos-network

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

