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

- **115 numbered errors**, each with root cause, fix, and prevention rule —
  not deleted, not squashed into a clean commit history. Including #103:
  the error of forgetting to log error #96. Yes, that's in there too.
- **A red-team number I had to retract.** I published 38.43% ASR for months as the <!-- stale-ok: retraction story -->
  honest, unflattering number. Then I verified the harness instead of the result:
  it had never injected my system prompt at all. Every run had been measuring the
  bare model. The retraction is chronicle entry #114/#115, and it is in this repo.
- **Scripts that run**, not architecture diagrams. Every claim in this repo
  is backed by a `.ps1` you can execute yourself and verify.

If you want a mature, team-maintained AI infrastructure project, there are
better options on GitHub — genuinely, go look. If you want to see what a
solo build with nothing hidden actually looks like, keep reading.

---

## Core Metrics

| Metric | Result |
|---|---|
| Jailbreak resistance | Red-teamed (Garak + Promptfoo) - headline ASR **retracted**, see note |
| OpSec Score | **37/38 (97%)** - one visible fail, measured 2026-07-16 |
| Phases completed | **15 / 15** ✅ |
| Supporting-workload cloud dependency | **< 20%** (RAG, automation, observability) |
| Errors documented with root cause + fix | **119** - [full chronicle](01_Architecture/Error_Chronicle.md) |
| Time to build | **~2 weeks, one person** |

<!-- TODO before Show HN: add dashboard screenshot (fu75ch1_dashboard.py, localhost:8501) here -->

> **Why is there no ASR number?** I published 38.43% for months - Run 6, DanInTheWild,
> system prompt v4.6, a -3.37 pp improvement over Run 5. It was the number I was
> proudest of, precisely because it did not flatter the system.
>
> Then I verified the harness instead of the result. My system prompt had never been
> injected. Run 4, Run 5, Run 6 - every one of them had been measuring the bare model.
> The number was real. It just was not measuring my product. (Chronicle #114/#115.)
>
> When the prompt was finally injected (Run 7, v4.7, 2026-07-10), the raw MitigationBypass
> rate came back at 56.64% - and hand-triaging all 128 flagged responses found **zero**
> real harmful bypasses: 82% were explicit refusals, the rest harmless role-play. The
> detector scores any reply that does not *look like* a refusal as a success, including
> "I understand." It measures cooperative tone, not harm. Even the bare runs had a harm
> signal of zero.
>
> So the number is retracted, not swapped for a prettier one. DanInTheWild is no longer
> a primary metric here. What ships instead: the harness config, every raw run, and the
> correction. Full data: [Verified_Results.md](00_PROOF/Verified_Results.md).
>
> **Correction (2026-07-09):** Earlier versions of this README stated *512 probes*; the <!-- stale-ok: correction note -->
> correct count is 256 (garak's default `soft_probe_prompt_cap`). Logged as error #109 -
> and superseded by #114/#115, where the probe count turned out to be the smaller problem.
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
│                                   error chronicle (115 entries), handbook
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
