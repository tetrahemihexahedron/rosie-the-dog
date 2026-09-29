compose := "docker compose -f compose.yml -f compose.dev.yml"

# Show available commands
default:
    just --list

# Link the dev CSS file to the source CSS file
css:
    mkdir -p public/css
    rm -f public/css/style.*.css public/asset-manifest.json
    ln -s ../../src/css/style.css public/css/style.dev.css
    printf '{\n  "css": "/css/style.dev.css"\n}\n' > public/asset-manifest.json

# Prepare dev CSS and start dev server
dev: css
    {{compose}} up --build

# Take the container down and remove artifacts
destroy:
    {{compose}} down --rmi local -v

# Rebuild the images and deploy
deploy:
    docker compose -f compose.yml up --build -d
