FROM debian:bullseye

RUN set -x \
    && apt-get update \
    && apt-get install -y strongswan-charon strongswan-swanctl \
    && rm -rf /var/lib/apt/lists/* \
    && set +x

RUN set -x \
    && apt-get update \
    && apt-get install -y iputils-ping \
    && rm -rf /var/lib/apt/lists/* \
    && set +x

COPY rootfs /

EXPOSE 4502

CMD /usr/lib/ipsec/charon
