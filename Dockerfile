from caddy:2.10.2-alpine

arg CADDYFILE=Caddyfile_dev

copy caddy/${CADDYFILE} /etc/caddy/Caddyfile

copy public /app/public

entrypoint ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
