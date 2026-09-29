#!/usr/bin/env sh
set -eu

MODE="${1:-prod}"

SRC="/app/src/css/style.css"
OUT_DIR="/app/public/css"
MANIFEST="/app/public/asset-manifest.json"

mkdir -p "$OUT_DIR"

# Remove old files
rm -f "$OUT_DIR"/style.*.css "$MANIFEST"

if [ "$MODE" = "dev" ]; then
  FINAL="style.dev.css"
else
  DATE="$(date +%F)"
  HASH="$(sha256sum "$SRC" | awk '{print substr($1,1,8)}')"
  FINAL="style.$DATE.$HASH.css"
fi

cp "$SRC" "$OUT_DIR/$FINAL"

cat > "$MANIFEST" <<EOF
{
  "css": "/css/$FINAL"
}
EOF

echo "CSS: /css/$FINAL"
