arg CADDY_VERSION=2.11.4

from caddy:${CADDY_VERSION}-alpine

arg CADDYFILE=Caddyfile_dev

copy caddy/${CADDYFILE} /etc/caddy/Caddyfile

copy public /app/public

entrypoint ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
