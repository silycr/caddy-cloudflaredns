ARG CADDY_VERSION=2.7.5

FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare
    --with github.com/greenpau/caddy-security
    --with github.com/lucaslorentz/caddy-docker-proxy/v2
    

FROM caddy:2.8.4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
