---
date: 2026-06-25
tags: [substack, newsletter, content, launch]
status: ✅ v1.0 — bereit zum Einpflegen
title: Substack — Newsletter Setup & Issues 1–4
---

# Substack — Newsletter Setup & Issues 1–4

> Einpflegen unter: Substack → Settings → About + neue Posts

---

## Publication Setup

**Name:** `fu75ch1`
**Tagline:** `AI Operating System — built in public. Privacy by architecture.`
**About:** aus `Platform_Bios.md` (Substack-Sektion)
**URL:** `fu75ch1.substack.com` (oder ähnlich)
**Sprache:** Englisch (primär), Deutsch optional für einzelne Posts

---

## Issue #1 — "Why I Built This"

**Betreff:** `Why I built a local-first AI OS from scratch`
**Typ:** Manifest / Rant
**Länge:** ~600 Wörter

```
I got tired of the same pattern.

You set up a new AI tool. It's cloud-based.
Your prompts go somewhere. Your queries go somewhere.
You don't know where. You can't verify it.
And the terms of service are 40 pages of optimistic fiction.

So I stopped trusting and started building.

---

fu75ch1 is my answer. A local-first AI operating system.
Built on consumer hardware. Documented in public. Verified by red-team testing.

The goal was simple: 80% of my AI workloads should run locally.
No API calls for routine tasks. No data leaving the machine for anything sensitive.
No single point of failure.

After 15 phases and several months of work, I'm at 91% OpSec score (34-point audit, v2.0)
and 38.43% jailbreak ASR against 512 real-world attack attempts (Garak DanInTheWild) on my system prompt.

Not because I used some magic tool.
Because I documented every decision, tested every assumption,
and fixed every mistake I made along the way.

---

This newsletter is that documentation, made public.

Every issue: one concept, one tool, one system — explained completely.
Real configs. Real scripts. Real mistakes.

No hype. No affiliate links for tools I don't run myself.
No "10 AI tools that will change your life."

---

The full system is available as The Blueprint.
15 phases. All scripts. All configs. All docs.

Early Bird: €29 → [LINK]

---

Next issue: The 15 phases explained — what each one does and why the order matters.

fu75ch1
```

---

## Issue #2 — "The 15 Phases Explained"

**Betreff:** `The 15 phases of building a local-first AI OS`
**Typ:** Theory / Architecture
**Länge:** ~700 Wörter

```
People ask: why 15 phases? Why not just install some tools and call it a day?

Because "install some tools" is how you get a fragile system
that breaks when one dependency updates, leaks data you didn't know it sent,
and can't be reproduced on another machine.

Phases create structure. Structure creates reproducibility.
Reproducibility creates trust.

Here's what each phase covers and why the order matters:

---

**Phase 1–4: Foundation**
Windows hardening → VPN/OpSec → Browser hardening → Data masking.

You build the secure environment before you add AI tools to it.
Most people do this backwards. They add the tools first,
then wonder why their "private" setup still phones home.

**Phase 5–8: Security depth**
AppSec → Reverse Engineering → Hardware Forensics → AI Red-Teaming.

This is where you learn to verify, not trust.
You learn to read what software actually does, not what it claims to do.
Phase 8 (AI Red-Teaming) is where Garak comes in.
My prompt went from 45% jailbreak ASR down to 38.43% against 512 real-world attack probes across these phases.

**Phase 9–11: Automation**
Extended security → Workflow automation → Custom API workflow.

Once the foundation is solid, you automate it.
n8n for workflows. LangFuse for observability. Custom PowerShell pipelines.
The goal: the system runs itself for routine tasks.

**Phase 12–14: Hardening**
Determinism → Controlled vault growth → RAG & semantic search.

Phase 12 is where you make everything reliable, not just functional.
Idempotency guardrails. SBOM pipeline. MCP server.
Phase 14 adds AnythingLLM: semantic search across hundreds of vault notes.

**Phase 15: This newsletter.**
The Content Operating System.
Documenting the system in public.

---

The full phase documentation is in The Blueprint.
→ [LINK] — Early Bird €29

Next issue: What Garak actually found when I tested my prompt against 512 real jailbreaks — the honest jailbreak resistance story.

fu75ch1
```

---

## Issue #3 — "What Happens When You Red-Team Your Own Prompt Honestly"

**Betreff:** `From 45% to 38.43% jailbreak ASR — and why I'm not claiming 0%`
**Typ:** Proof / Technical
**Länge:** ~650 Wörter

```
Garak is an LLM vulnerability scanner.
You point it at a system prompt and it tries to break it.

When I first ran it, my prompt had no security hardening.
Result: 45.23% Attack Success Rate. Almost half of attack probes succeeded.

Here's the full progression — including the number I almost led with, and why I didn't.

---

**Run 1: No system prompt → 45.23% ASR**

Baseline. Every jailbreak pattern Garak tried had a 45% chance of working.
This is roughly what "helpful AI with no guardrails" looks like.

**Run 2: Master-Prompt v4.3 → 43.67% ASR**

Marginal improvement. A general-purpose system prompt helps slightly,
but it doesn't address the specific attack patterns Garak uses.

**Run 3: Master-Prompt v4.4 → 15.75% ASR**

This is where [prompt_security] was added.
Seven specific patterns: persona hijacking, nested fiction,
technical authority framing, threats, RANT+bypass, empty placeholders.

Each pattern gets an explicit detection rule and rejection behavior.
Going from 43% to 15% in one version is not magic — it's specific countermeasures.

**Run 4 (AutoDANCached): Master-Prompt v4.5 → 0% ASR — and here's the catch**

This probe set only ran 3 attack attempts. Zero for three sounds perfect.
It's also not a real measurement — a 3-probe pilot proves almost nothing.
I could have stopped here and published "0% jailbreak ASR." I didn't, because it would've been misleading.

**Run 5: Same prompt, DanInTheWild probe set (512 real community jailbreaks) → 41.8% ASR**

This is the test that actually matters: 512 real-world jailbreak attempts,
not 3 cached ones. The honest number came back much higher than the pilot suggested.
That's not the prompt getting worse — it's the test getting real.

**Run 6: Master-Prompt v4.6, same 512-probe set → 38.43% ASR**

Two new [prompt_security] patterns (implicit evil-persona, from-now-on override)
brought it down 3.4 points. Moderate, real, and documented — not dramatic, but true.

---

The lesson isn't "jailbreak resistance isn't about being more restrictive" — that part still holds.
The bigger lesson: a 3-probe pilot and a 512-probe real-world test are not the same claim,
and publishing the smaller number because it looks better is exactly the kind of thing
this whole project exists to push back against.

38.43% against 512 real attacks is the number I'm standing behind.

The full prompt_security section is in Master-Prompt v4.7:
→ Gumroad [LINK] — €9
→ Or included in The Blueprint [LINK] — €29 Early Bird

Next issue: My complete privacy stack — every tool and why it's there.

fu75ch1
```

---

## Issue #4 — "My complete privacy stack"

**Betreff:** `My complete privacy stack — every tool, every reason`
**Typ:** Proof / Tool Overview
**Länge:** ~700 Wörter

```
Most "privacy tool" lists are SEO content.
This one is an audit trail.

Every tool I list, I run. Every reason I give, I tested.

---

**Network layer**

Mullvad WireGuard with Kill-Switch.
Why Mullvad: no-logs policy, audited, accepts cash/Monero, no account required.
Why WireGuard: modern protocol, minimal attack surface, fast.
Kill-Switch: if VPN drops, no traffic leaves. Non-negotiable.

NextDNS with DNS-over-HTTPS.
Your DNS requests are metadata. Unencrypted DNS = your ISP can see every domain.
NextDNS encrypts it and lets me control filtering + logging.

IPv6 disabled on all physical adapters.
Reason: most consumer VPNs don't handle IPv6 correctly. IPv6 leaks are common.
Disabling it removes the attack surface.

---

**Browser**

LibreWolf as primary. Brave as secondary.
LibreWolf: Firefox-based, fingerprint protection built in, WebRTC disabled.
Brave: for sites that break in LibreWolf, Chromium-based, reasonable defaults.
Separate profiles for: AI tools / Work / Private / Research.
No cross-contamination.

uBlock Origin in aggressive mode.
Not just ads. JavaScript from unknown domains blocked by default.
Temporary allow for what I need.

---

**Credentials**

KeePassXC. Offline. Key-File concept.
No browser sync. No cloud backup. Encrypted local database + separate key file.
API keys loaded via PowerShell from KeePass, never in plaintext in scripts.

---

**AI tools**

Claude Desktop via MCP (primary agent).
AnythingLLM locally for RAG (semantic vault search, zero external calls).
Ollama for offline-capable models.
OpenRouter with ZDR (Zero Data Retention) for cases requiring cloud models.

No AI tool gets credentials, PII, or network details.
Regex-based PII scrubber runs before any API call.

---

**System**

Windows 11 hardened (ASR, outbound firewall, telemetry off, BitLocker).
PowerShell 7 with strict mode + idempotency guardrails.
Garak + Promptfoo for regular red-team runs.
Invoke-OpSecAudit.ps1: 34-point automated check, runs weekly.

---

The full stack documentation + configs:
→ Tool Stack Guide [Gumroad LINK] — €12
→ Or everything in The Blueprint [Lemon Squeezy LINK] — €29 Early Bird

fu75ch1
```

---

## Posting-Rhythmus (Phase 1)

| Woche | Issue | Typ |
|---|---|---|
| 1 | #1 Why I Built This | Manifest |
| 2 | #2 The 15 Phases | Architecture |
| 3 | #3 From 45% to 38.43% jailbreak ASR (honest DanInTheWild results) | Proof |
| 4 | #4 Complete Privacy Stack | Tool Overview |

Batch schreiben, dann wöchentlich scheduled posten.

---

## Paid-Tier Entscheidung

- Erst aktivieren ab **200 Subscriber**
- Preis: **€5/Monat** oder **€45/Jahr**
- Paid-only content: tiefere technische Deep-Dives, neue Phase-Dokumentation vorab
- Alternative: Sponsor-Deal mit NextDNS / Mullvad ab 500 Subscriber

---

## 🔗 Verknüpfte Notizen

- [[Platform_Bios]]
- [[Launch_Plan]]
- [[GUMROAD_Products]]
- [[LEMON_SQUEEZY_SalesPage]]
- [[fu75ch1_IDENTITY]]
