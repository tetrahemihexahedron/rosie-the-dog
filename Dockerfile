arg CADDY_VERSION=2.11.4

from alpine:3 as assets

workdir /app

copy public /app/public
copy src /app/src
copy --chmod=755 scripts /app/scripts

run /app/scripts/prepare-css.sh

from caddy:${CADDY_VERSION}-alpine

workdir /app

arg CADDYFILE=Caddyfile_dev

copy caddy/${CADDYFILE} /etc/caddy/Caddyfile

copy --from=assets /app/public /app/public

entrypoint ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
