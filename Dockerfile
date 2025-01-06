FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/desec
    
# building an auto updating image requires latest, so we ignore that warning    
# hadolint ignore=DL3007
FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
