# ElastAlert-Docker

This Dockerfile will build a Docker image for Elastalert. This image is compatible with the accompanying Helm chart for Kubernetes.

## Fork of yelp/elastalert

The original [yelp/elastalert](https://github.com/yelp/elastalert) repository has become mostly stale, with hundreds of open PRs and over 1000 open issues. The yelp team has acknowledged that they are winding down support of Elastalert (https://github.com/Yelp/elastalert/issues/2947). Consequently, it is difficult to merge fixes, dependency upgrades, and new features into Elastalert. Because of this, a fork of elastalert has been created as a sibling to this repository. [jertel/elastalert](https://github.com/jertel/elastalert) will be an alternate repository for updates, until a new maintainer is appointed by the Yelp team and it's clear that the new maintainers are responding to PRs and issues. 

If you want to use the jertel/elastalert fork (specifically, the 'alt' branch), then use the `jertel/elastalert-docker:latest-alt` docker container. Kubernetes helm chart users will need to override the image tag appropriately in order to utilize the newer elastalert forked image.

This `-alt` suffix may become the master/latest tag at some point in the future, if the original repository does not gain a maintainer.

## Docker Hub

The official pre-built image is available at https://hub.docker.com/r/jertel/elastalert-docker.

## Building Locally

To build, install Docker and then run the following command:
```
docker build . -t elastalert
```

## Running Elastalert

A properly configured elastalert_config.json file must be mounted into the container during startup of the container. Use the [example file](https://github.com/Yelp/elastalert/blob/master/config.yaml.example) provided by Elastalert as a template, and once saved locally to a file such as `/tmp/elastalert.yaml`, run the container as follows:

```bash
docker run -d -v /tmp/elastalert.yaml:/opt/config/elastalert_config.yaml jertel/elastalert-docker
```

## Kubernetes

See the Helm chart [README.md](chart/elastalert/README.md) for information on installing this application into an existing Kubernetes cluster.
