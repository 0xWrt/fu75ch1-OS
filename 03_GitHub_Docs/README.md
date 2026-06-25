# fu75ch1

> Privacy by Architecture. Not by Settings.

AI Operating System — built from scratch, documented in public.

---

## What is this?

fu75ch1 is a complete AI operating system built on consumer hardware.
Local-first. Zero cloud dependency for 80% of workloads.
Every phase documented. Every script reproducible. Every claim verified.

---

## Core Metrics

| Metric | Result |
|---|---|
| Jailbreak resistance (Garak 0.15.1) | **0% ASR** ✅ |
| OpSec Score | **25/26 (96%)** 🟢 |
| Phases completed | **15 / 15** ✅ |
| Cloud dependency | **< 20% of workloads** |
| Local LLM capable | **Yes (Ollama)** |

---

## The Stack

**OS & Shell**
- Windows 11 (hardened: ASR, BitLocker, Firewall outbound, Telemetry off)
- PowerShell 7.4 with strict mode + idempotency guardrails
- WSL2 Ubuntu 22.04 (Binwalk, Linux tooling)

**AI & Automation**
- Claude (primary agent via MCP)
- AnythingLLM (local RAG, semantic vault search)
- Ollama (offline-capable local LLMs)
- n8n (self-hosted workflow automation)
- LangFuse (LLM observability, self-hosted)

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
| 9 | (extended security) |
| 10 | Workflow Automation |
| 11 | Custom API Workflow |
| 12 | Hardening & Determinism |
| 13 | Controlled Vault Growth |
| 14 | RAG & Semantic Search |
| 15 | Content Operating System |

---

## What's in the Repository

```
/
├── MANIFESTO.md          ← Philosophy & principles
├── LICENSE               ← CC BY-NC 4.0
├── OpSec_Checklist_Preview.md  ← 10 of 26 checks (free)
└── docs/
    └── Architecture.md   ← System overview
```

Full system (all scripts, configs, prompts, docs):
→ **[The Blueprint on Lemon Squeezy](LINK_PLACEHOLDER)** — Early Bird €29

Individual components:
→ **[Gumroad Store](LINK_PLACEHOLDER)** — €7–€14 per component

Weekly newsletter:
→ **[Substack](LINK_PLACEHOLDER)** — free + paid

---

## Principles

**fu75ch1 always:**
- Documents every step (reproducible by design)
- Only recommends tools that are in active use
- Shows real metrics, not marketing claims
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
