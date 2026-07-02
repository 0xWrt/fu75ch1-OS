# Product 8 — KeePass Blueprint
# Title: fu75ch1 KeePass Blueprint — Offline Credentials with Key-File Concept
# Price: €7
# Slug: keepass-blueprint

---

## SUMMARY

Move your credentials fully offline. KeePassXC with Key-File concept, tested backup strategy, and API key hygiene for developers — nothing leaves your machine.

---

## DESCRIPTION

A cloud password manager is only as secure as the company running it. When that company has a breach — and they do — your credentials are in the dump.

KeePassXC keeps everything local. This blueprint adds a Key-File concept: your database file and your key file are stored separately. Getting one without the other is useless. A stolen laptop gives an attacker an encrypted database and nothing else.

Built as the credential management layer of a 15-phase AI operating system — handling everything from system passwords to API keys for LLM providers.

---

## DETAILS

**KeePassXC Setup (Windows):**
- Settings that matter: auto-lock, clipboard clear timeout, minimize on copy
- What not to enable: default browser integration settings are too permissive
- Initial database configuration

**Key-File Concept:**
- Database file on your main drive
- Key file on a USB stick or separate secure location
- Both required to open the database
- What this protects against: stolen laptop, cloud backup leak, remote access

**Database Structure (4 groups):**
- API Keys: LLM providers, services, developer credentials
- System: OS passwords, disk encryption recovery, BIOS
- Services: web accounts, subscriptions
- Personal: everything else

**Backup Strategy (3-2-1 rule):**
- 3 copies, 2 different media, 1 offsite
- Encrypted backup procedure
- Tested restore — not assumed restore

**Browser Integration (controlled):**
- KeePassXC browser extension — safer configuration than default
- Auto-type vs. browser fill: when to use which
- What not to do

**Password Generator Settings:**
- 32+ characters minimum
- No patterns, no dictionary words, no memorable structures
- Different profiles for different account types

**API Key Hygiene:**
- Store API keys in KeePassXC, not in `.env` files or scripts
- Load at runtime via PowerShell — never in plaintext, never in Git, never in logs
- PowerShell snippet included

**Works on:** Windows (primary), KeePassXC is cross-platform

---

## GET THE FULL SYSTEM

Pairs well with the **OpSec Checklist** (€7) — verify your credential hygiene is actually enforced.

- **Full system (all 15 phases):** [LEMON SQUEEZY LINK] — €29 Early Bird
- **More standalone products:** fu75ch1.gumroad.com
- **Weekly build notes:** [SUBSTACK LINK]
- **Public repo (free, sanitized):** github.com/0xWrt/fu75ch1-OS

**→ Buy now on Gumroad**

© fu75ch1 — CC BY-NC 4.0
