# Product 5 — Windows Hardening Guide
# Title: fu75ch1 Windows Hardening Guide — ASR, Firewall, Telemetry (Step-by-Step)
# Price: €9
# Slug: windows-hardening

---

## SUMMARY

Harden Windows 11 without losing productivity. Real PowerShell commands, real verification for every step — no guesswork, no assumptions.

---

## DESCRIPTION

Windows hardening guides usually fall into two categories: theoretical checklists that skip the implementation, or aggressive scripts that break things and leave you troubleshooting.

This guide is neither.

Every step follows the same format: command → what it does → why it matters → verification command. You always know what changed and you always know it worked. Every change is reversible and every risk is documented — including which services break things if disabled (learned from real mistakes).

Built as Phase 1 of a 15-phase AI operating system running on hardened Windows 11.

---

## DETAILS

**Attack Surface Reduction (ASR):**
- All critical ASR rules with exact GUIDs
- Per-rule explanation: which attack vector it blocks and why
- Audit mode vs. enforce mode — when to use which
- Verification command for each rule

**Outbound Firewall (whitelist model):**
- Switch from default-allow to default-deny outbound
- PowerShell script to enumerate current active connections
- Building a practical allowlist for your applications
- Rollback procedure

**Telemetry + Services:**
- What is safe to disable (verified list)
- What breaks things if disabled (documented from real experience)
- Registry + PowerShell approach for each
- Verification that changes survive reboot

**BitLocker:**
- TPM + PIN setup
- Recovery key storage strategy (offline only)
- Verification script

**UAC:**
- Always-notify mode
- Admin approval for built-in accounts
- Verification

**Autostart Analysis + Cleanup:**
- Enumerate all autostart locations (not just Task Manager)
- Risk assessment per entry
- Safe removal procedure

**Patch Management:**
- No-exceptions policy
- PowerShell-based update verification
- Driver update strategy

**Requirements:** Windows 11, PowerShell 7+

© fu75ch1 — CC BY-NC 4.0
