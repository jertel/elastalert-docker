# ElastAlert-Docker

This Dockerfile will build a Docker image that works with the existing elastalert chart, hosted in the Kubernetes chart repository: https://github.com/helm/charts/tree/master/stable/elastalert

## Staleness
This image is certainly going to become stale over time. If you notice it has gone stale and needs rebuilt, you are welcome to send me a quick note at jertel at codesim.com and I'll trigger the automated build over at Docker Hub.

## Docker Hub

The official pre-built image is available at https://hub.docker.com/r/jertel/elastalert-docker.

## Building Locally

To build, install Docker and then run the following command:
```
docker build . -t elastalert
```

