# Product 3 — Advanced Configs
# Title: fu75ch1 Advanced Configs — Ollama, n8n, WireGuard (Ready-to-Deploy)
# Price: €12
# Slug: advanced-configs
# STATUS: HELD — files not yet built. Do not publish until configs are ready.

---

## SUMMARY

Production-ready configuration files for three core local AI stack components. Copy, adjust two variables, deploy.

---

## DESCRIPTION

Setting up a local AI stack means dealing with configuration files that are either underdocumented, full of placeholders, or built for a different environment than yours.

These configs are different. Every non-obvious setting has an inline comment explaining what it does and why. There are at most two variables to adapt per file — marked clearly. Everything else is ready to deploy.

Built and tested on Windows 11 + Docker Desktop as part of a 15-phase AI operating system.

---

## DETAILS

**Ollama (local LLMs):**
- Model routing config (task-based: small / medium / large)
- Memory and context window settings
- API endpoint setup for local access
- Open WebUI integration

**n8n (self-hosted workflow automation):**
- Production Docker Compose (environment variables structured)
- Webhook templates for AI pipelines
- AI node configurations (prompt → API → response)

**WireGuard (VPN client, Windows):**
- Client config template with line-by-line explanation
- Kill-Switch rules via Windows Firewall
- DNS leak prevention settings
- IPv6 disable config

**Format:** `.yml`, `.conf`, `.json` — ready to use, not templates with empty blanks.
**Requirements:** Docker Desktop, Windows 11, PowerShell 7+

© fu75ch1 — CC BY-NC 4.0
