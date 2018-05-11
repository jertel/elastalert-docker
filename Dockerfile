FROM alpine

LABEL description="ElastAlert suitable for Kubernetes and Helm"
LABEL maintainer="Jason Ertel (jertel at codesim.com)"

RUN apk --update upgrade && \
    apk add ca-certificates gcc libffi-dev musl-dev python2 python2-dev py2-pip py2-yaml openssl openssl-dev && \
    rm -rf /var/cache/apk/* && \
    wget https://github.com/Yelp/elastalert/archive/v0.1.30.zip -O /tmp/elastalert.zip && \
    mkdir /opt && \
    unzip /tmp/elastalert.zip -d /opt && \
    rm -f /tmp/elastalert.zip && \
    mv /opt/elastalert-0.1.30 /opt/elastalert && \
    cd /opt/elastalert && \
    sed -i 's/jira>=1.0.10/jira>=1.0.10,<1.0.15/g' setup.py && \
    python setup.py install && \
    pip install -e . && \
    apk del gcc libffi-dev musl-dev openssl-dev python2-dev && \
    mkdir -p /opt/elastalert/config && \
    mkdir -p /opt/elastalert/rules && \
    echo "#!/bin/sh" >> /opt/elastalert/run.sh && \
    echo "elastalert-create-index --config /opt/config/elastalert_config.yaml" >> /opt/elastalert/run.sh && \
    echo "elastalert --config /opt/config/elastalert_config.yaml \"\$@\"" >> /opt/elastalert/run.sh && \
    chmod +x /opt/elastalert/run.sh

VOLUME [ "/opt/config", "/opt/rules" ]
WORKDIR /opt/elastalert
ENTRYPOINT ["/opt/elastalert/run.sh"]
