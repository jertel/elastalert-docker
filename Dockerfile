FROM python:3.6-alpine

LABEL description="ElastAlert suitable for Kubernetes and Helm"
LABEL maintainer="Jason Ertel (jertel at codesim.com)"

ARG ELASTALERT_VERSION=0.2.1

RUN apk --update upgrade && \
    apk add gcc libffi-dev musl-dev python-dev openssl-dev tzdata libmagic && \
    rm -rf /var/cache/apk/*

RUN pip install elastalert==${ELASTALERT_VERSION} certifi && \
    apk del gcc libffi-dev musl-dev python-dev openssl-dev

RUN mkdir -p /opt/elastalert/config && \
    mkdir -p /opt/elastalert/rules && \
    echo "#!/bin/sh" >> /opt/elastalert/run.sh && \
    echo "elastalert-create-index --config /opt/config/elastalert_config.yaml" >> /opt/elastalert/run.sh && \
    echo "exec elastalert --config /opt/config/elastalert_config.yaml \"\$@\"" >> /opt/elastalert/run.sh && \
    chmod +x /opt/elastalert/run.sh

ENV TZ "UTC"

VOLUME [ "/opt/config", "/opt/rules" ]
WORKDIR /opt/elastalert
ENTRYPOINT ["/opt/elastalert/run.sh"]
