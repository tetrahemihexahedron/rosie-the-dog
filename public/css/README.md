# CSS

The CSS for this project is still quite modest, so I'm holding off on adding a bundler to prepare it. Instead, the CSS is loaded in a single file, which is renamed when deployed for cache-busting purposes.

## Production

When the image is built, the script `scripts/prepare-css.sh` is run. It saves a copy of the source CSS file `src/css/style.css` in `public/css` with a cache-busting suffix, like

```
style.b9ceab81.css
```

It also records the path to this file in `public/asset-manifest.json`:

```json
{
  "css": "/css/style.b9ceab81.css"
}
```

The template `public/templates/head.html` then reads the manifest:

```go
  {{ $assets := readFile "asset-manifest.json" | fromJson }}
  <link rel="stylesheet" href="{{ index $assets "css" }}">
```

## Development

For development, the file `public/css/style.dev.css` should be symlinked to `src/css/style.css` and its path given in the manifest `public/asset-manifest.json`:

```json
{
  "css": "/css/style.dev.css"
}
```

Then, a new copy of `style.css` won't need to be made when it changes.

You shouldn't have to think about this: The symlink is created and `asset-manifest.json` is written when the dev server is run with `just dev`.
