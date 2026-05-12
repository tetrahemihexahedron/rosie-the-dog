# Rosie the Dog

This repository contains the files for a personal website celebrating Rosie the Dog and serving as a playground for experimentation and practice while I work to strengthen my front-end skills and expand my knowledge of contemporary CSS.

## About the code

When I began working on a website for Rosie, I wanted to use some of the same tools that I was using at work, so that I could gain more experience with them. I installed Tailwind and Stimulus, amongst other dependencies, and spent most of my energy talking to Cursor's AI agents. I wanted to experiment with different models, modes, and prompting techniques, with an eye toward improving the quality of the code produced. I discovered that, even with Tailwind, I didn't really have enough experience with modern CSS to guide AI to produce CSS that was easily maintained and extended.

I've since left that job, and my goals have changed: My first objective is to learn more CSS, so that I can be a more informed judge of code quality and give more detailed instructions to AI. Hence, I put my previous code aside and started afresh using, for the moment, only vanilla CSS and HTML.

## Development

Currently, there is no build step, and all you need to do is bring the container up:

```sh
docker compose -f compose.yml -f compose.dev.yml up
```

Then visit **http://localhost:8000/index.html**.
