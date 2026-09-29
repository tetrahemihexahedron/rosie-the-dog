#!/usr/bin/env sh
set -eu

SRC="/app/src/css/style.css"
OUT_DIR="/app/public/css"
MANIFEST="/app/public/asset-manifest.json"

mkdir -p "$OUT_DIR"

# Remove old files
rm -f "$OUT_DIR"/style.*.css "$MANIFEST"

DATE="$(date +%F)"
HASH="$(sha256sum "$SRC" | awk '{print substr($1,1,8)}')"
FINAL="style.$DATE.$HASH.css"

cp "$SRC" "$OUT_DIR/$FINAL"

cat > "$MANIFEST" <<EOF
{
  "css": "/css/$FINAL"
}
EOF

echo "CSS: /css/$FINAL"
