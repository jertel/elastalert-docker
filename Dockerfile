FROM python:3.6-alpine3.13

LABEL description="ElastAlert suitable for Kubernetes and Helm"
LABEL maintainer="Jason Ertel (jertel at codesim.com)"

ARG ELASTALERT_VERSION=0.2.4

RUN apk --update upgrade && \
    apk add gcc libffi-dev musl-dev python3-dev openssl-dev tzdata libmagic cargo && \
    rm -rf /var/cache/apk/*

RUN pip install --upgrade pip && \
    pip install cryptography && \
    pip install elastalert==${ELASTALERT_VERSION} && \
    apk del gcc libffi-dev musl-dev python3-dev openssl-dev cargo

RUN mkdir -p /opt/elastalert && \
    echo "#!/bin/sh" >> /opt/elastalert/run.sh && \
    echo "set -e" >> /opt/elastalert/run.sh && \
    echo "elastalert-create-index --config /opt/config/elastalert_config.yaml" >> /opt/elastalert/run.sh && \
    echo "exec elastalert --config /opt/config/elastalert_config.yaml \"\$@\"" >> /opt/elastalert/run.sh && \
    chmod +x /opt/elastalert/run.sh

ENV TZ "UTC"

WORKDIR /opt/elastalert
ENTRYPOINT ["/opt/elastalert/run.sh"]
