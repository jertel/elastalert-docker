# ElastAlert-Docker

This Dockerfile will build a Docker image that works with the existing elastalert chart, hosted in the Kubernetes chart repository: https://github.com/kubernetes/charts/tree/master/stable/elastalert.

The existing elastalert chart currently (as of Feb, 2018) references and outdated elastalert image that is incompatible with ElasticSearch 6.0+.

To build:
```
docker build . -t elastalert
```

## Docker Hub

An image exists at https://hub.docker.com/r/jertel/elastalert-docker. To use this image, specify `jertel/elastalert-docker` in your elastalert chart override yaml file. Ex:

```
image:
  repository: jertel/elastalert-docker
  tag: latest
```
