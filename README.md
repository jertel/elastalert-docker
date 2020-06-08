# ElastAlert-Docker

This Dockerfile will build a Docker image for Elastalert. This image is compatible with the accompanying Helm chart for Kubernetes.

## Docker Hub

The official pre-built image is available at https://hub.docker.com/r/jertel/elastalert-docker.

## Building Locally

To build, install Docker and then run the following command:
```
docker build . -t elastalert
```

## Running Elastalert

A properly configured elastalert_config.json file must be mounted into the container during startup of the container. Use the [example file](https://github.com/Yelp/elastalert/blob/master/config.yaml.example) provided by Elastalert as a template, and once saved locally to a file such as `/tmp/elastalert.json`, run the container as follows:

```bash
docker run -d -v /tmp/elastalert.json:/opt/config/elastalert_config.json jertel/elastalert-docker
```

## Kubernetes

See the Helm chart [README.md](chart/elastalert/README.md) for information on installing this application into an existing Kubernetes cluster.
