########################
FROM alpine:3.10 as base
########################

RUN apk --no-cache update && \
    apk --no-cache add \
    ca-certificates bash python py-pip py-setuptools ca-certificates curl wget zip unzip openssl less && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*

RUN [ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf

ENV DOCKER_CHANNEL stable
ENV DOCKER_VERSION 19.03.0

RUN set -eux; \
    \
    # this "case" statement is generated via "update.sh"
    apkArch="$(apk --print-arch)"; \
    case "$apkArch" in \
    # amd64
    x86_64) dockerArch='x86_64' ;; \
    # arm32v6
    armhf) dockerArch='armel' ;; \
    # arm32v7
    armv7) dockerArch='armhf' ;; \
    # arm64v8
    aarch64) dockerArch='aarch64' ;; \
    *) echo >&2 "error: unsupported architecture ($apkArch)"; exit 1 ;;\
    esac; \
    \
    if ! wget -O docker.tgz "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/${dockerArch}/docker-${DOCKER_VERSION}.tgz"; then \
    echo >&2 "error: failed to download 'docker-${DOCKER_VERSION}' from '${DOCKER_CHANNEL}' for '${dockerArch}'"; \
    exit 1; \
    fi; \
    \
    tar --extract \
    --file docker.tgz \
    --strip-components 1 \
    --directory /usr/local/bin/ \
    ; \
    rm docker.tgz; \
    \
    dockerd --version; \
    docker --version

COPY docker-entrypoint.sh /usr/local/bin/

ENV DOCKER_TLS_CERTDIR=/certs

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]
