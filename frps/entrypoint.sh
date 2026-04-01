#!/bin/sh
set -e

# Substitute environment variables in nginx config
# envsubst '$PORT $POSTHOG_CLOUD_REGION' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
envsubst '$FRP_TOKEN $FRP_BIND_PORT $FRP_VHOST_HTTP_PORT' < /etc/frp/frps.toml.template > /etc/frp/frps.toml

# Start frps
exec frps -c /etc/frp/frps.toml
