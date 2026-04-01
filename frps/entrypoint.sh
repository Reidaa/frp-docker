#!/bin/sh
set -e

# Substitute environment variables in frp's server config
envsubst '$FRP_TOKEN $FRP_BIND_PORT $FRP_VHOST_HTTP_PORT' < /etc/frp/frps.toml.template > /etc/frp/frps.toml

# Start frps
exec frps -c /etc/frp/frps.toml
