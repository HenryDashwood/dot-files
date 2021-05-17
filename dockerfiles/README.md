# DOCKER_FILES

Dockerfiles that I use for stuff

To build an image:

```shell
docker build -f Dockerfile -t henrydashwood:[NAME] .
```

To run an image as a container:

```shell
docker run -ti henrydashwood:[NAME] /bin/zsh
```

IF you stop the container but would like to restart it:

```shell
docker start -ai [CONTAINER_ID]
```

If you want to use the image in other images you will need to tag it

```shell
docker tag [IMAGE_ID] henrydashwood/[NAME]
```

And possibly push it to Dockerhub:

```shell
docker push henrydashwood/[NAME]
```
