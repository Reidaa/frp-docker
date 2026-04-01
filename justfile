frps-build:
    docker build -t frps:latest -f frps/Dockerfile frps/

frps-run:
    docker run --name frps \
        --rm \
        -p 7000:7000 \
        -p 8071:8071 \
        -e FRP_TOKEN=your_secret_token_here \
        -e FRP_BIND_PORT=7000 \
        -e FRP_VHOST_HTTP_PORT=8071 \
        frps:latest
