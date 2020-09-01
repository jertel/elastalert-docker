FROM python:alpine

LABEL description="ElastAlert suitable for Kubernetes and Helm"
LABEL maintainer="Jason Ertel (jertel at codesim.com)"

RUN apk --update upgrade && \
    apk add gcc libffi-dev musl-dev python3-dev openssl-dev tzdata libmagic git && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /opt/elastalert && \
    git clone https://github.com/jertel/elastalert /opt/elastalert && \
    cd /opt/elastalert && \
	pip install -r requirements.txt && \
    apk del gcc libffi-dev musl-dev python3-dev openssl-dev git

RUN echo "#!/bin/sh" >> /opt/elastalert/run.sh && \
    echo "set -e" >> /opt/elastalert/run.sh && \
    echo "python -m elastalert.create_index --config /opt/config/elastalert_config.yaml" >> /opt/elastalert/run.sh && \
    echo "python -m elastalert.elastalert.py --config /opt/config/elastalert_config.yaml \"\$@\"" >> /opt/elastalert/run.sh && \
    chmod +x /opt/elastalert/run.sh

ENV TZ "UTC"

WORKDIR /opt/elastalert
ENTRYPOINT ["/opt/elastalert/run.sh"]
