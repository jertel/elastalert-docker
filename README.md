# ElastAlert-Docker

This Dockerfile will build a Docker image that works with the existing elastalert chart, hosted in the Kubernetes chart repository: https://github.com/kubernetes/charts/tree/master/stable/elastalert.

The chart currently (as of Feb, 2018) references and outdated elastalert image that is incompatible with ElasticSearch 6.0+.

To build:
```
docker build . -t elastalert
```

