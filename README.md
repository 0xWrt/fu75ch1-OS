# fu75ch1

> Privacy by Architecture. Not by Settings.

AI Operating System — built from scratch, documented in public.

---

## What is this?

fu75ch1 is a complete AI operating system built on consumer hardware.
Every phase documented. Every script reproducible. Every claim verified —
including the ones that don't look perfect.

---

## Core Metrics

| Metric | Result |
|---|---|
| Jailbreak resistance (Garak 0.15.1, 512 real-world attempts) | **41.8% / 9.8% ASR** (see note) |
| OpSec Score | **26/26 (100%)** 🟢 |
| Phases completed | **15 / 15** ✅ |
| Supporting-workload cloud dependency | **< 20%** (RAG, automation, observability) |
| Errors documented with root cause + fix | **94** (numbered to #95) |

> **Why 41.8% and not 0%?** An earlier pilot test (3 attempts) showed 0% ASR.
> We re-tested against 512 real community jailbreaks instead of 3 — the
> honest number is higher, not because the system got worse, but because
> the earlier sample size was too small to mean anything. Full data:
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
├── 00_PROOF/                    ← verified metrics, Garak run details
├── 01_Architecture/             ← sanitized system prompt, phase write-ups,
│                                   error chronicle (94 entries), handbook
└── 02_CONTENT_OPERATING_SYSTEM/ ← LinkedIn, newsletter, product templates
```

Full system (all scripts, configs, prompts, docs):
→ **The Blueprint on Lemon Squeezy** — link coming with launch

Individual components:
→ **Gumroad Store** — link coming with launch

Weekly newsletter:
→ **Substack** — link coming with launch

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
