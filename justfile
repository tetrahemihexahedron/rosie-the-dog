compose := "docker compose -f compose.yml -f compose.dev.yml"

# Show available commands
default:
    just --list

# Start dev server
dev:
    {{compose}} up --build

# Build the dev CSS file inside the running Caddy container
css:
    {{compose}} exec caddy /app/scripts/prepare-css.sh dev

# Rebuild prod image locally
build:
    docker compose build
