# Product 9 — Tool Stack Guide
# Title: fu75ch1 Tool Stack Guide — Every Tool, Every Decision, Every Config
# Price: €12
# Slug: tool-stack-guide

---

## SUMMARY

The complete approved tool stack behind a 15-phase AI operating system — what each tool does, why it made the cut over alternatives, privacy status, and setup notes.

---

## DESCRIPTION

Most tool lists are marketing. This one is an audit trail.

Every tool in the fu75ch1 stack has a defined purpose, has been evaluated against at least one alternative, and is documented with setup notes, known issues, version pinning rationale, and a privacy assessment.

Equally important: what was rejected and why. Cloud sync credential managers, cloud-based code assistants, proprietary note-taking apps — all evaluated, all rejected for documented reasons.

If you are building a local-first AI stack and want to skip the evaluation phase, this is the shortcut — built from 15 phases and 101 documented mistakes.

---

## DETAILS

**AI & Automation (6 tools):**

| Tool | Purpose | Privacy |
|---|---|---|
| Claude via Anthropic API | Primary agent, complex reasoning | Zero-data-retention endpoint |
| AnythingLLM (self-hosted) | Local RAG, semantic search | Fully local |
| Ollama | Local LLM inference | Fully local |
| n8n (self-hosted) | Workflow automation | Fully local |
| LangFuse (self-hosted) | LLM observability, cost tracking | Fully local, on-demand |
| Memos (self-hosted) | Quick capture, agentic loop input | Fully local |

**System & Security (5 tools):**

| Tool | Purpose | Notes |
|---|---|---|
| KeePassXC | Offline credential management | Key-file concept |
| gitleaks | Secret scanning | Pre-commit hook |
| PSScriptAnalyzer | PowerShell static analysis | CI integration |
| Wireshark | Network traffic analysis | Sandboxed |
| Obsidian | Local knowledge vault | Git sync only, no cloud |

**Dev & Reverse Engineering (5 tools):**

| Tool | Purpose | Notes |
|---|---|---|
| JADX-GUI 1.5.5 | Android APK decompilation | Sandboxed |
| Ghidra 12.1.2 | Binary analysis | Sandboxed |
| Docker Desktop | Container runtime | WSL2 backend |
| repomix | Repo-to-prompt packing | Token optimization |
| PowerShell 7 | Primary shell | Strict mode enforced |

**Browser & OpSec (4 tools):**

| Tool | Purpose | Notes |
|---|---|---|
| LibreWolf | Primary browser | user.js hardened |
| uBlock Origin | Tracker blocking | Aggressive mode |
| Mullvad VPN | Network privacy | WireGuard, Kill-Switch |
| NextDNS | Encrypted DNS | DoH, custom config |

**AI Security (4 tools):**

| Tool | Purpose | Notes |
|---|---|---|
| Garak 0.15.1 | LLM red-teaming | DanInTheWild probe set |
| Promptfoo 0.121.17 | Structured eval framework | Next after Garak |
| Llama Guard | Input/output classification | Safety layer |
| PyRIT 0.14.0 | Microsoft red-team framework | Separate venv |

**Rejected tools and why:**
- 1Password / Bitwarden → cloud sync = credential server dependency
- GitHub Copilot → code sent to external server by default
- Notion → proprietary cloud, no real offline mode
- Zapier / Make → cloud automation, data leaves the system
- ChatGPT web → no zero-data-retention on consumer tier

**For each tool the guide includes:**
purpose, evaluated alternatives, why it made the cut, privacy status, version pinning rationale, setup notes, known issues.

© fu75ch1 — CC BY-NC 4.0
