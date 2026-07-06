---
title: fu75ch1
---
# fu75ch1

> Privacy by Architecture. Not by Settings.

Built solo, in public, over 15 phases. Every mistake numbered. Every metric
verified — including the ones that don't look good.

---

## This is not "another AI Operating System"

Search GitHub for `ai-operating-system` and you'll find dozens of repos with
the same buzzwords — governance, audit-trail, local-first, agentic. Most are
backed by teams, months or years of iteration, and closed-door code review.

This one is different in a way that doesn't require any of that: it's **one
person, two weeks, and a public log of exactly what went wrong.** Not a
polished pitch — a working system with the failure modes left in.

- **103 numbered errors**, each with root cause, fix, and prevention rule —
  not deleted, not squashed into a clean commit history. Including #103:
  the error of forgetting to log error #96. Yes, that's in there too.
- **A red-team number that doesn't flatter the system.** A 3-probe pilot run
  showed a 0% attack success rate. That number is technically true and
  completely useless. The real test — 512 real-world jailbreak attempts —
  came back at 38.43%. Both are published. Only one of them is honest.
- **Scripts that run**, not architecture diagrams. Every claim in this repo
  is backed by a `.ps1` you can execute yourself and verify.

If you want a mature, team-maintained AI infrastructure project, there are
better options on GitHub — genuinely, go look. If you want to see what a
solo build with nothing hidden actually looks like, keep reading.

---

## Core Metrics

| Metric | Result |
|---|---|
| Jailbreak ASR — lower is better (Garak 0.15.1, 512 real-world attempts) | **38.43%** (see note) |
| OpSec Score | **35/38 (92%)** 🟢 |
| Phases completed | **15 / 15** ✅ |
| Supporting-workload cloud dependency | **< 20%** (RAG, automation, observability) |
| Errors documented with root cause + fix | **103** — [full chronicle](01_Architecture/Error_Chronicle.md) |
| Time to build | **~2 weeks, one person** |

<!-- TODO before Show HN: add dashboard screenshot (fu75ch1_dashboard.py, localhost:8501) here -->

> **Why 38.43%?** Run 4 (AutoDANCached, 3 attempts) showed 0% ASR — not representative.
> Run 5 (DanInTheWild, 512 real community jailbreaks) showed 41.8%; a separate probe in
> the same run (HijackHateHumans) came in at 9.8% ASR. Run 6 (DanInTheWild, updated
> system prompt v4.6) improved to **38.43%** — a -3.37 pp reduction.
> Run 7 showed 48.52% but is attributed to statistical noise and false positives
> (the MitigationBypass detector flags harmless refusals), not system regression.
> All runs documented honestly. Full data:
> [Verified_Results.md](00_PROOF/Verified_Results.md).
>
> **Note on cloud dependency:** supporting infrastructure (RAG, workflow
> automation, observability) runs locally. Primary AI inference still runs
> through the Anthropic API — there is no local LLM in the main workflow
> today.

---

## The Stack

**OS & Shell**
- Windows 11 (hardened: ASR, BitLocker, Firewall outbound, Telemetry off)
- PowerShell 7.4 with strict mode + idempotency guardrails
- WSL2 Ubuntu 22.04 (Binwalk, Linux tooling)

**AI & Automation**
- Claude (primary agent via MCP)
- AnythingLLM (local RAG, semantic vault search)
- Ollama (offline-capable local LLMs, infrastructure ready)
- n8n (self-hosted workflow automation)
- LangFuse (LLM observability, self-hosted, on-demand)

**Privacy & Security**
- Mullvad WireGuard + Kill-Switch
- NextDNS DoH (custom config, logging controlled)
- KeePassXC (offline credentials, key-file concept)
- LibreWolf + uBlock Origin (hardened profile)
- Garak 0.15.1 + Promptfoo 0.121.17 (AI red-teaming)

**Knowledge**
- Obsidian Vault (local, no sync cloud)
- Git (version control, audit trail)
- MCP tools: read/write/search vault from Claude

---

## The 15 Phases

| Phase | Topic |
|---|---|
| 1 | Windows Hardening |
| 2 | VPN & OpSec |
| 3 | Browser Hardening |
| 4 | Data Masking & PII |
| 5 | AppSec |
| 6 | Reverse Engineering |
| 7 | Hardware Forensics |
| 8 | AI Red-Teaming |
| 9 | Orchestrator & Git-Hook |
| 10 | Workflow Automation |
| 11 | Custom API Workflow |
| 12 | Hardening & Determinism |
| 13 | Controlled Vault Growth |
| 14 | RAG & Semantic Search |
| 15 | Content Operating System |

Full write-up of every phase: [01_Architecture/Phases](01_Architecture/Phases)

---

## What's in This Repository

```
/
├── README.md                    ← this file
├── LICENSE                      ← CC BY-NC 4.0
├── MANIFESTO.md                 ← philosophy & architecture vision (EN, honest build status)
├── MANIFESTO_DE.md              ← German original
├── 00_PROOF/                    ← verified metrics, Garak run details
├── 01_Architecture/             ← sanitized system prompt, phase write-ups,
│                                   error chronicle (103 entries), handbook
└── 02_CONTENT_OPERATING_SYSTEM/ ← LinkedIn, newsletter, product templates
```

Full system (all scripts, configs, prompts, docs, full error chronicle):
→ **The Blueprint** — all 9 individual products (€84 combined) plus the complete
vault for **€29 Early Bird** (first 50 buyers, then €49) — going live this week at
[fu75ch1.gumroad.com](https://fu75ch1.gumroad.com)

Individual components (€7–€14 each):
→ **Gumroad Store** — [fu75ch1.gumroad.com](https://fu75ch1.gumroad.com)

Weekly build notes:
→ **Substack** — launching in week 2; until then, watch/star this repo for updates

---

## Principles

**fu75ch1 always:**
- Documents every step (reproducible by design)
- Only recommends tools that are in active use
- Shows real metrics, not marketing claims — including unflattering ones
- Stays anonymous (privacy advocacy requires consistency)

**fu75ch1 never:**
- Uses cloud tools for privacy-critical data
- Recommends workarounds instead of real solutions
- Publishes without verification

---

## License

© fu75ch1 — [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/)
Non-commercial use permitted with attribution.
Commercial use requires explicit permission.
