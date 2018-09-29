# ElastAlert-Docker

This Dockerfile will build a Docker image that works with the existing elastalert chart, hosted in the Kubernetes chart repository: https://github.com/helm/charts/tree/master/stable/elastalert

## ElasticSearch 6.0+
The existing elastalert chart currently (as of Feb, 2018) references and outdated elastalert image that is incompatible with ElasticSearch 6.0+. This image resolves the issue as it is built from the latest elastalert image. 

## Staleness
This image is certainly going to become stale over time. If you notice it has gone stale and needs rebuilt, you are welcome to send me a quick note at jertel at codesim.com and I'll trigger the automated build over at Docker Hub.

## Docker Hub

An image exists at https://hub.docker.com/r/jertel/elastalert-docker. To use this image, specify `jertel/elastalert-docker` in your elastalert chart override yaml file. Ex:

```
image:
  repository: jertel/elastalert-docker
  tag: latest
```

## Building Locally

To build, install Docker and then run the following command:
```
docker build . -t elastalert
```

