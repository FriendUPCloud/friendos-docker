# friendos-docker
A clean and simple Docker image for Friend OS. You need the following additional
docker images in order to run this.

 * friendos-mysql-docker - run this first
 * friendos-file-server-docker - run this second
 * ... then run this docker image

## Building

docker build -t friendos-docker ./

## Run the Docker

```bash
docker run -d -p 6502:6502 --name friendos-docker-container friendos-docker
```

## If you want to enter the docker container

```bash
docker exec -it friendos-docker-container bash
```

## If you want to re-build the image for some reason, do this:

```bash
docker rmi friendos-docker
```

