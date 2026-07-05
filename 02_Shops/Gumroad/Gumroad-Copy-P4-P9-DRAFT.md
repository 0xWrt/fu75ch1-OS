# Gumroad — Copy for Products 4–9
# Ready to paste. No editing needed.
# Slug format: fu75ch1.gumroad.com/l/[slug]

---

## Product 4 — Phase 12 Playbook | €14 | Slug: phase12-playbook

**SUMMARY (paste into Summary field):**
How I hardened my AI system against prompt injection, non-determinism, and unsafe automation. Every mistake documented. Garak results included — honest ones.

**DETAILS (paste into Additional details field):**
Phase 12 was where the system stopped being experimental and became reliable.

This playbook documents every hardening decision I made — with the reasoning, the mistakes, and the fixes.

What's inside:
- PowerShell guardrails: Set-StrictMode + idempotency patterns for every script
- 34-point OpSec audit (automated, current score 31/34 = 91%)
- SBOM pipeline: syft + grype for dependency verification
- MCP Custom Server: 3 tools wired into Claude Desktop
- Prompt security evolution: Garak baseline 45.23% → 38.43% ASR across 6 runs

On the Garak numbers: Run 4 showed 0% ASR. That was a pilot with 3 probes — not representative. DanInTheWild (512 real community jailbreaks) gives the honest picture. Both disclosed.

Includes the full phase documentation, all scripts from this phase, and the error chronicle entries with root cause + prevention rule for each mistake.

Works on: Windows 11, PowerShell 7+

© fu75ch1 — CC BY-NC 4.0
Full system → The Blueprint [Lemon Squeezy LINK]

---

## Product 5 — Windows Hardening Guide | €9 | Slug: windows-hardening

**SUMMARY (paste into Summary field):**
Harden Windows 11 without losing productivity. Real PowerShell commands. Real verification for each step. No guesswork.

**DETAILS (paste into Additional details field):**
Windows is the reality in most environments. This guide makes it controllable.

Every step follows the same format: command → what it does → why it matters → verification. You always know it worked.

What's covered:
- Attack Surface Reduction (ASR): all critical rules with exact GUIDs and per-rule explanation
- Outbound Firewall: switch to default-deny with a working allowlist approach
- Telemetry + services: what's safe to disable (verified), what breaks things (documented from real mistakes)
- BitLocker: TPM + PIN setup with offline recovery key storage
- UAC: maximum configuration without breaking daily use
- Autostart: enumerate all locations (not just Task Manager), assess and clean up safely
- Patch management: no-exceptions policy with PowerShell verification

Every command is explained. Every change is reversible. Every step has a verification so you know it worked — not just trust it worked.

Works on: Windows 11, PowerShell 7+

© fu75ch1 — CC BY-NC 4.0
Full system → The Blueprint [Lemon Squeezy LINK]

---

## Product 6 — DNS/VPN Guide | €7 | Slug: dns-vpn-guide

**SUMMARY (paste into Summary field):**
Stop your DNS from leaking. Encrypted DNS + VPN with Kill-Switch in 30 minutes. Every step verified with an automated leak test.

**DETAILS (paste into Additional details field):**
Your DNS provider sees every domain you visit — by default unencrypted and unprotected. This guide fixes that end to end.

What's covered:
- NextDNS: setup with a privacy-respecting config, custom filter lists, logging control
- DNS-over-HTTPS on Windows: enable on all adapters via PowerShell, verify no plaintext DNS leaves the machine
- WireGuard client: config file explained line by line, import and connect
- Kill-Switch: Windows Firewall rules so nothing leaks on VPN drop — verified, not assumed
- IPv6 leak prevention: disable on physical adapters, handle VirtualBox/WSL2 exceptions
- Automated DNS leak test: PowerShell script included, how to read the results

Every step has a test command. You don't trust it works — you verify it works.

Works on: Windows 11, PowerShell 7+

© fu75ch1 — CC BY-NC 4.0
Full system → The Blueprint [Lemon Squeezy LINK]

---

## Product 7 — Browser Hardening | €7 | Slug: browser-hardening

**SUMMARY (paste into Summary field):**
Stop browser fingerprinting. Block trackers at the config level. Exportable settings for LibreWolf + uBlock Origin — drop in and done.

**DETAILS (paste into Additional details field):**
The browser is the biggest attack surface in any system. Default settings on any browser — including Firefox — leak more than most people realize.

What's included:
- LibreWolf user.js: drop into your profile folder, restart, done. WebRTC off, canvas blocked, HTTPS-only, cookie isolation per site.
- uBlock Origin config: my exact filter list export + aggressive mode settings + custom rules
- 4-profile strategy: AI tools / Work / Private / Research — why separation matters and how to set it up
- JavaScript selective allow: default-deny approach without breaking every site
- Cookie strategy: session-only by default, exceptions only where needed
- Search engine setup: privacy-respecting alternatives with pros/cons of each

Setup time: under 20 minutes. Everything exportable so you can rebuild the same config on a new machine in minutes.

Works on: LibreWolf (Firefox-based), Windows and Linux

© fu75ch1 — CC BY-NC 4.0
Full system → The Blueprint [Lemon Squeezy LINK]

---

## Product 8 — KeePass Blueprint | €7 | Slug: keepass-blueprint

**SUMMARY (paste into Summary field):**
Your browser's password manager syncs to a cloud server. This is the offline alternative — KeePassXC with Key-File concept, backup strategy, and API key hygiene.

**DETAILS (paste into Additional details field):**
Credentials in the browser = credentials on someone else's server. This guide moves them fully offline — with a two-factor setup that means even a stolen laptop gives an attacker nothing useful.

What's covered:
- KeePassXC setup: the settings that matter, what not to enable by default
- Key-File concept: database file and key file stored separately — one on your drive, one on a USB stick. Both needed to open anything.
- Database structure: four groups with clear separation (API Keys / System / Services / Personal)
- Backup strategy: 3-2-1 rule with encrypted backups and a tested restore procedure
- Browser integration: controlled setup, not the default (which is too permissive)
- Password generator: 32+ characters, no patterns, no memorable structures
- API key hygiene: store in KeePassXC, load via PowerShell at runtime, never in plaintext or Git

The API key hygiene section alone is worth the price if you work with LLM APIs.

Works on: Windows, KeePassXC (cross-platform)

© fu75ch1 — CC BY-NC 4.0
Full system → The Blueprint [Lemon Squeezy LINK]

---

## Product 9 — Tool Stack Guide | €12 | Slug: tool-stack-guide

**SUMMARY (paste into Summary field):**
My complete approved tool stack. What I use, what I rejected, and why. With setup notes and privacy status for each tool.

**DETAILS (paste into Additional details field):**
Most tool lists are marketing. This one is an audit trail.

Every tool in this stack has a defined purpose, has been evaluated against at least one alternative, and is documented with setup notes, known issues, and a privacy assessment.

Categories:
- AI & Automation: Claude (ZDR endpoint), AnythingLLM (local RAG), Ollama (local LLMs), n8n (self-hosted automation), LangFuse (self-hosted observability), Memos (quick capture)
- System & Security: KeePassXC, gitleaks, PSScriptAnalyzer, Wireshark, Obsidian
- Dev & RE: JADX-GUI, Ghidra, Docker, repomix, PowerShell 7
- Browser & OpSec: LibreWolf, uBlock Origin, Mullvad VPN, NextDNS
- AI Security: Garak, Promptfoo, Llama Guard, PyRIT

What was rejected and why:
- 1Password / Bitwarden → cloud sync = credential server dependency
- GitHub Copilot → code sent to external server
- Notion → proprietary cloud, no real offline
- Zapier / Make → cloud automation, data leaves the system
- ChatGPT web → no zero-data-retention option on consumer tier

For each tool: purpose, privacy status, why it made the cut, setup notes, known issues.

© fu75ch1 — CC BY-NC 4.0
Full system → The Blueprint [Lemon Squeezy LINK]
