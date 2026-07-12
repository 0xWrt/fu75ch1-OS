# Product 10 — The Blueprint (Flagship)
# Title: The fu75ch1 Blueprint — Complete AI Operating System (15 Phases)
# Price: €29 Early Bird (first 50) → €49 Standard
# Slug: blueprint

> Strategie-Notiz (2026-07-03): Blueprint launcht ZUERST auf Gumroad, damit
> das Flaggschiff waehrend des Show-HN-Traffic-Fensters kaufbar ist.
> Lemon Squeezy zieht in Woche 2 als besserer Checkout nach (gleiche Copy,
> siehe 02_Shops\LemonSqueezy\). Kein Warten auf die "richtige" Plattform.

---

## SUMMARY

The complete system behind the 9 standalone products — all 15 phases, every script, every config, every one of 100+ documented mistakes. €84 of parts for €29 Early Bird.

---

## DESCRIPTION

Every standalone product in this store is one piece of a larger system. This is the system.

The fu75ch1 Blueprint is a complete, documented AI operating system built on consumer hardware — solo, in two weeks, over 15 phases. Not a tutorial. Not a course. A working system with every script, config, and decision documented so you can reproduce it exactly — including the full error chronicle of 100+ numbered mistakes with root cause, fix, and prevention rule for each.

Most system guides show you the polished end state. This one ships the failure modes too, because that's where the actual knowledge is.

---

## DETAILS

**The math:** All 9 standalone products (€84 combined) are included — plus the phase documentation, error chronicle, and vault structure that none of them contain individually.

**Core System**
- Master-Prompt v4.7 (production-tested, red-team verified)
- Behaviour Addendum v1.1 (explanation protocol, error analysis framework)
- All 15 phase plans + completion protocols
- PowerShell scripts (idempotent, strict mode, documented)
- **Full error chronicle: 100+ numbered mistakes, each with root cause + fix + prevention rule**

**Privacy & Security**
- OpSec Audit (38 automated checks, v2.0)
- Windows Hardening Guide (ASR, BitLocker, Firewall, Telemetry)
- DNS/VPN Setup (NextDNS DoH + WireGuard Kill-Switch)
- Browser Hardening (LibreWolf + uBlock Origin config export)
- KeePass Blueprint (Key-File concept, backup strategy)
- Fire TV Hardening (ADB, AppOps, privacy stack)

**AI Architecture**
- AnythingLLM RAG setup (local semantic vault search)
- n8n workflow automation (self-hosted, production-ready)
- LangFuse observability (self-hosted Docker, on-demand)
- MCP server configuration (read/write/search vault from Claude)
- Prompt security: 10 jailbreak resistance patterns + Garak run documentation

**Knowledge System**
- Obsidian Vault structure (16 folders, graph colors, templates)
- Git workflow (commit conventions, audit trail)
- State Transfer format (context across chat sessions)

**Red-team testing (honest disclosure — the correction is the point):**
Earlier versions of this listing quoted Garak ASR percentages here. A later audit found the harness never actually injected the system prompt, so those figures measured the bare model — not this hardened system. It's logged as its own numbered error, the harness was rebuilt to verify the exact payload it sends before every run, and both the full run documentation and the rebuilt harness are included. We'd rather ship the retraction than a flattering number — that's the point of this project.

**Format:** .zip — all markdown files, scripts, and configs
**Updates:** free forever — you're buying the living system, not a snapshot. Copies go stale; the original keeps evolving.
**Early Bird:** first 50 buyers €29, then €49.

---

## ZIP-MANIFEST (interne Packliste — nicht in Gumroad-Description uebernehmen)

```
fu75ch1_blueprint_v4.7/
├── README.md                     ← Kurz-Orientierung + Lesereihenfolge
├── LICENSE                       ← CC BY-NC 4.0
├── Verify-GhostMark.py           ← Watermark-Verifikation (Transparenz!)
├── 00_META/
│   ├── Master-Prompt-v4.7.md
│   ├── Behaviour_Addendum_v1.1.md
│   └── Public_Handbuch.md
├── 01_Phases/                    ← alle 15 Phasen-Abschluesse (aus 01_Architecture\Phases)
├── 02_Proof/
│   ├── Error_Chronicle.md        ← vollstaendig (100+, das Sampler-Gegenstueck)
│   ├── Verified_Results.md
│   └── Garak_Run4-6_Detail.md
├── 03_Scripts/
│   ├── Invoke-OpSecAudit.ps1
│   └── ... (alle sanitierten pwsh-Skripte)
└── 04_Configs/
    ├── Ollama/  n8n/  WireGuard/
```

Pack-Regeln:
1. Quelle ist ausschliesslich fu75ch1_public (sanitiert) — NIE Core-Vault.
2. Vor dem Zippen: Invoke-PublicExport-v2.4.ps1 + gitleaks laufen lassen.
3. Ghost-Mark-Schema auf alle .md anwenden (wie Polar), Verify-GhostMark.py beilegen.
4. Early-Bird-Mechanik: Gumroad Discount-Code `EARLYBIRD` (limit 50) auf €49-Basispreis
   ODER Startpreis €29 + manuelle Erhoehung nach 50 Verkaeufen — Variante A ist
   sauberer (sichtbarer Anker €49, Rabatt kommuniziert Dringlichkeit).

---

## GET THE STANDALONE PARTS

Only need one piece? Every component is available standalone at fu75ch1.gumroad.com (€7–14) — but the Blueprint includes them all.

- **Public repo (free, sanitized):** github.com/0xWrt/fu75ch1-OS

**→ Buy now on Gumroad**

*Transparency note: every delivered file carries an invisible license watermark (zero-width Unicode signature). The verification script `Verify-GhostMark.py` is included in your download — inspect it yourself. Nothing in this product is hidden from you.*

© fu75ch1 — CC BY-NC 4.0
