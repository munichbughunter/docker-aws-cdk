ARG ALPINE_VERSION=3.17
ARG AWS_CDK_VERSION=2.65.0
FROM alpine:${ALPINE_VERSION}

RUN apk -v --no-cache --update add \
    nodejs \
    npm \
    python3 \
    ca-certificates \
    groff \
    less \
    bash \
    make \
    curl \
    wget \
    zip \
    git \
    go \
    && \
    update-ca-certificates && \
    npm install -g aws-cdk@${AWS_CDK_VERSION}

VOLUME [ "/root/.aws" ]
VOLUME [ "/opt/app" ]

# Allow for caching python modules
VOLUME ["/usr/lib/python3.8/site-packages/"]

WORKDIR /opt/app

CMD ["cdk", "--version"]
