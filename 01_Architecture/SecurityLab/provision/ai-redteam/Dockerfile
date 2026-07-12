# fu75ch1 Security Lab - AI Red-Teaming environment
# Pinned, reproducible image for garak + Promptfoo + PyRIT.
#
# SECRET POLICY: no API key is ever baked into this image. You pass it at RUN time
# via an environment variable (see docker-compose.yml / README.md). If you find
# yourself writing a key into this file, stop - that is exactly error #113/#115.
#
# Build:  docker build -t fu75ch1-airt:1.0 .
# Run:    see docker-compose.yml

FROM python:3.11-slim-bookworm

# --- pinned tool versions (single source of truth for this image) ---
ARG GARAK_VERSION=0.15.1
ARG PYRIT_VERSION=0.14.0
ARG PROMPTFOO_VERSION=0.121.17
ARG NODE_MAJOR=20

LABEL org.opencontainers.image.title="fu75ch1 Security Lab - AI Red-Teaming" \
      org.opencontainers.image.version="1.0" \
      org.opencontainers.image.licenses="CC-BY-NC-4.0" \
      fu75ch1.garak="${GARAK_VERSION}" \
      fu75ch1.pyrit="${PYRIT_VERSION}" \
      fu75ch1.promptfoo="${PROMPTFOO_VERSION}"

ENV DEBIAN_FRONTEND=noninteractive \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# --- OS deps + Node (for Promptfoo) at a pinned major version ---
RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates curl gnupg git jq \
    && mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
        | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" \
        > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update && apt-get install -y --no-install-recommends nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# --- Python red-team tooling, pinned ---
RUN pip install \
        "garak==${GARAK_VERSION}" \
        "pyrit==${PYRIT_VERSION}"

# --- Promptfoo, pinned ---
RUN npm install -g "promptfoo@${PROMPTFOO_VERSION}"

# --- non-root user; the lab never needs root inside the container ---
RUN useradd -m -u 10001 lab
USER lab
WORKDIR /home/lab/work

# Lab configs are mounted at runtime (see compose), not copied in, so the image
# stays generic and the configs stay under your version control, not the image's.
VOLUME ["/home/lab/work"]

# Sanity default: print versions so `docker run --rm fu75ch1-airt:1.0` self-verifies.
CMD ["sh", "-lc", "echo '--- fu75ch1 AI Red-Team lab ---'; \
     echo -n 'garak     '; python -c 'import garak; print(garak.__version__)'; \
     echo -n 'pyrit     '; python -c 'import pyrit; print(pyrit.__version__)' 2>/dev/null || echo '(import name may differ, see module 4)'; \
     echo -n 'promptfoo '; promptfoo --version; \
     echo -n 'node      '; node --version"]
