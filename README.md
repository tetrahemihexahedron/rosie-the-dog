# Rosie the Dog

This repository contains the files for a personal website celebrating Rosie the Dog and serving as a playground for experimentation and practice while I work to strengthen my front-end skills and expand my knowledge of contemporary CSS.

When I began this project, I installed Tailwind and Stimulus, and esbuild to bundle those assets and others that I expected to add. I wanted to use some of the same tools that I was using at work, so that I could gain more experience with them.

My goals have changed, and I have ripped out the dependencies, deciding to first focus on modern vanilla CSS.

## Development

Currently, there is no build step, and all you need to do is bring the container up:

```sh
docker compose -f compose.yml -f compose.dev.yml up
```

Then visit **http://localhost:8000/index.html**.
