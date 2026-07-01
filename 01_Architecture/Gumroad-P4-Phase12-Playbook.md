# Product 4 — Phase 12 Playbook
# Title: fu75ch1 Phase 12 Playbook — Hardening & Determinism
# Price: €14
# Slug: phase12-playbook

---

## SUMMARY

The complete documentation of how a functional AI system becomes a reliable one — with every hardening decision, every mistake, and honest Garak red-team results.

---

## DESCRIPTION

A working AI system and a hardened AI system are two different things.

Phase 12 was the hardening phase of the fu75ch1 AI operating system — where every script became idempotent, every change was audited, every dependency was verified, and the prompt security was tested against 512 real-world jailbreak attempts.

This playbook is not a guide on what to do. It is a documented record of what was actually done — including what broke, why it broke, and what the prevention rule is for next time.

If you are building a production AI system and want to learn from 99 documented mistakes instead of making them yourself, this is that document.

---

## DETAILS

**PowerShell Guardrails:**
- `Set-StrictMode -Version Latest` + `$ErrorActionPreference = 'Stop'` as mandatory header on every script
- Idempotency patterns: scripts that are safe to run multiple times without side effects
- Script header retrofit applied to all production scripts

**OpSec Hardening:**
- 34-point automated audit (v2.0), current score 31/34 (91%)
- Gap analysis for remaining 3 structural issues
- Fix scripts for all addressable gaps

**SBOM Pipeline:**
- syft + grype for dependency inventory and vulnerability scanning
- Supply chain audit trail

**MCP Custom Server:**
- 3 tools wired into Claude Desktop: read vault, write vault, execute PowerShell
- Architecture and integration documentation

**Prompt Security — Garak Results (honest):**
- Run 1 Baseline: 45.23% ASR
- Run 6 (v4.6, DanInTheWild, 512 probes): 38.43% ASR
- Run 4 showed 0% ASR — AutoDANCached, 3 probes, not representative. Documented alongside the real numbers.

**Includes:**
- Full Phase 12 plan and completion protocol
- Error chronicle entries (real mistakes + root cause + prevention rule)
- All PowerShell scripts from this phase
- Garak run documentation (Runs 1–6)
- OpSec audit script v2.0

**Requirements:** Windows 11, PowerShell 7+

© fu75ch1 — CC BY-NC 4.0
