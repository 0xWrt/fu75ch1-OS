# AI Red-Teaming track - setup

Reproducible, isolated environment for garak, Promptfoo and PyRIT. Everything runs in
a container; teardown is `docker compose down` and the host stays clean.

## Prerequisites
- Docker Desktop (or Docker Engine + Compose v2)
- An API key for the provider you'll test against (Anthropic used in the examples)

## Secret handling (important)
The key is **never** written into any file here. You export it in your shell; Compose
passes it through as an environment variable at run time:

```bash
export ANTHROPIC_API_KEY=sk-ant-...      # your shell session only
```

If you ever feel the urge to paste the key into `docker-compose.yml`, re-read error
chronicle #113 and #115. Keys in config files is the exact mistake this project logged
twice.

## Build + verify

```bash
cd provision/ai-redteam
docker compose build
docker compose run --rm airt        # prints tool versions on entry, drops to shell
```

Expected on first entry: garak `0.15.1`, Promptfoo `0.121.17`, PyRIT `0.14.0`, Node 20.
If any version differs, the image drifted - rebuild with `--no-cache`.

## What's mounted
`./work` on your host maps to `/home/lab/work` in the container. Put your prompt files,
garak configs and Promptfoo configs there so results land back on your machine under
your own version control - not inside a throwaway image.

## Teardown
```bash
docker compose down
docker image rm fu75ch1-airt:1.0     # optional, full clean
```

Proceed to `modules/Module-4-AI-RedTeaming.md`.
