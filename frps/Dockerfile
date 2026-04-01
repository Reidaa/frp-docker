FROM alpine:3.19

COPY frps.toml /etc/frp/frps.toml.template

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ARG FRP_VERSION=0.61.1
ARG TARGETOS=linux
ARG TARGETARCH=amd64

ENV FRP_BIND_PORT=7000
ENV FRP_VHOST_HTTP_PORT=8080

RUN apk add --no-cache gettext-envsubst

RUN case "${TARGETARCH}" in \
        amd64) frp_arch="amd64" ;; \
        arm64) frp_arch="arm64" ;; \
        *) echo "Unsupported target architecture: ${TARGETARCH}" >&2; exit 1 ;; \
    esac \
    && wget -qO- "https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_${TARGETOS}_${frp_arch}.tar.gz" \
    | tar xz --strip-components=1 -C /usr/local/bin/ "frp_${FRP_VERSION}_${TARGETOS}_${frp_arch}/frps"

ENTRYPOINT [ "/entrypoint.sh" ]
