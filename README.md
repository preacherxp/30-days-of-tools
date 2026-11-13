# 30 tools in 30 days

<p align="center"><a href="https://buymeacoffee.com/michal.hachula"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me a Coffee" height="41"></a></p>

A tool building challenge: one new open source tool every day of November 2026, tracked on a calendar at **[preacherxp.github.io/30-days-of-tools](https://preacherxp.github.io/30-days-of-tools/)**.

<p align="center"><img src="assets/og.png" width="800" alt="The challenge calendar for November 2026, with the first four days showing their tools"></p>

## Shipped

| Day | Tool | What it does |
|---|---|---|
| 1 | [OpenCode Answer](https://github.com/preacherxp/opencode-answer) | A macOS menu bar app for answering OpenCode's questions without switching to the terminal |
| 2 | [Flokque Aloft](https://github.com/preacherxp/flokque-aloft) | Keeps your computer working with the lid closed |
| 3 | [Element Snap](https://github.com/preacherxp/element-snap) | A Chrome extension that saves any element on a web page as a pixel-exact image |
| 4 | [Sieve](https://github.com/preacherxp/sieve) | Runs only the JVM tests a change can affect |
| 5 | [Archigraph](https://github.com/preacherxp/archigraph) | An architecture diagram editor that ships as one self-contained HTML file |
| 6 | [groove](https://github.com/preacherxp/groove) | A Chrome extension that copies the component path of any element from React, Vue, Angular and Svelte apps |
| 7 | [super-docker](https://github.com/preacherxp/super-docker) | A keyboard-first terminal UI for Docker containers, Compose projects, images, volumes and networks |
| 8 | [Mucha](https://github.com/preacherxp/mucha) | A local web UI for kubeseal that catches trailing newlines, double base64 and wrong-cluster mistakes before they are sealed |
| 9 | [Thermal](https://github.com/preacherxp/thermal) | Benchmarks your CPU and GPU under monitored load and compares temperature runs before and after a fix |
| 10 | [portkill](https://github.com/preacherxp/portkill) | A macOS menu bar app that shows every listening port, which project or Docker container owns it, and stops it with one click |
| 11 | [envdiff](https://github.com/preacherxp/envdiff) | Compares .env files, Kubernetes ConfigMaps and Secrets, and Compose services, and names near-misses like trailing newlines, quotes and double base64 |
| 12 | [The Gauntlet](https://github.com/preacherxp/the-gauntlet) | A relief day: a chess roguelite in the browser with spells, small boards and named pawns, every asset made by code. [Play it](https://preacherxp.github.io/the-gauntlet/) |
| 13 | [sheaf](https://github.com/preacherxp/sheaf) | One link for the same pull request across many repositories, with each one's state, checks and review, and who has marked it seen. [Open it](https://preacherxp.github.io/sheaf/) |

## Adding a day

1. Put a full resolution screenshot of the tool in `thumbs/src/<slug>.png`
2. Add `{ "slug", "src", "x", "y", "w" }` to [`thumbs/thumbs.json`](thumbs/thumbs.json): the crop's top left corner and width in source pixels
3. Run `thumbs/make.sh <slug>` and check `assets/thumbs/<slug>.png`
4. Add an entry to [`tools.js`](tools.js) and a row to the table above
5. Push to `main`; GitHub Pages redeploys the site

The page is plain HTML with no build step. Open `index.html` in a browser to preview it.

## Thumbnails

Every day uses the same 800×600 tile so the calendar reads as one set: a flat `#2B2B2B` ground with a `#3D3D3D` dot grid, and a tight crop of the tool's real UI in a window frame 64px from the top and left, running off the right and bottom edges. [`thumbs/template.html`](thumbs/template.html) draws it; [`thumbs/make.sh`](thumbs/make.sh) renders it with headless Chrome (set `CHROME=` to use another binary; needs `jq`).

Use a dark mode capture of the tool when it has one, so every tile reads as one set. Crop to the one part that says what the tool does, tight enough to read at 130px wide: the panel, the highlighted element, the result. Never a whole window or a logo.

Each entry can also have a `hero` crop (`x`, `y`, `w`, `h`, optional `src`) for the tool's README: the same branding, but the whole UI framed with an even margin, written to `assets/heroes/<slug>.png`.
