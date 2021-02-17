ARG BUILD_FROM
ARG BUILD_ARCH

FROM ${BUILD_FROM}

RUN apk add --no-cache curl

RUN if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
    && if [ "${BUILD_ARCH}" = "armhf" ]; then ARCH="arm"; fi \
    && if [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="arm"; fi \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then ARCH="amd64"; fi \
    && curl -L -s "https://github.com/portainer/portainer/releases/download/2.1.1/portainer-2.1.1-linux-${ARCH}.tar.gz" | tar zxvf - -C /opt/

COPY /init.sh /

RUN chmod +x /init.sh

ENTRYPOINT ["sh", "/init.sh"]
