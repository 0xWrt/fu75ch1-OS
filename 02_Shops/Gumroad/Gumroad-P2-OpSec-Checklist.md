# Product 2 — OpSec Checklist
# Title: fu75ch1 OpSec Checklist — 38-Point Security Audit (PowerShell, v2.0)
# Price: €7
# Slug: opsec-checklist

---

## SUMMARY

38 automated security checks for Windows 11. Run it, get a real score in under 60 seconds — including the gaps that look green but aren't.

---

## DESCRIPTION

Most security checklists are PDFs you read once and forget. This one runs on your machine and tells you exactly where you stand.

`Invoke-OpSecAudit.ps1` is the exact script used to audit the fu75ch1 AI operating system — 38 checks across 6 categories, automated, with a clear pass/fail output and an overall score.

No raw data leaves the machine. No IPs, MACs, or credentials in the output. Just clean results you can act on.

If you want to know your actual security posture — not your assumed one — run this script.

Most audits tick a box and move on. This one catches the traps standard tools miss: a drive that reads "encrypted" but whose protection is silently switched off — self-unlocking, protecting nothing. A proxy service you can't safely disable because six others depend on it. It shows you the gap, tells you what closing it costs, and how to undo it. You decide, you run it. Nothing changes behind your back.

One of 38 checks in a script written for a solo, two-week build — the kind that
finds real gaps because it was written to catch the author's own mistakes, not to look thorough in a demo.

---

## DETAILS

**38 checks across 6 categories:**

- VPN & Network (5): interface active, default route over VPN, service running, IPv6 disabled, DNS over VPN only
- System Security (5): Firewall all profiles, UAC, Secure Boot, Defender real-time, Defender definitions age
- System Hardening (4): WDigest disabled, LSASS PPL active, SMBv1 disabled, RDP disabled
- Tools & AppSec (8): gitleaks, PSScriptAnalyzer, Git repo, KeePassXC database, vault Git clean, PII scrubber, VPN watchdog, autostart task
- AI Stack Security (3): API key file permissions, Docker daemon exposure, PIIScrubber integration
- Anti-Tracking (9): telemetry level, advertiser ID, activity history, LLMNR, NetBIOS, Delivery Optimization, location services, WiFi MAC randomization, autorun disabled

**Output format:**
```
[OK] Check 23: NetBIOS over TCP/IP disabled
[X]  Check 35: BitLocker C: active  (FullyEncrypted, but ProtectionStatus=Off — encrypted yet unprotected)
...
OpSec Score: 37/38 (97%)
```

The author's own machine failed Check 35 — a fully encrypted drive protecting nothing, because no secure key protector was bound. The audit caught it. That's a real score you earn, not a vanity 100%.

**Properties:**
- Idempotent — safe to run repeatedly
- No PII in output, no raw network data
- Category breakdown included
- Admin rights required for full results

**Requirements:** Windows 11, PowerShell 7+

**Includes:** `Invoke-OpSecAudit.ps1` + `Gumroad-P2-OpSec-Checklist.md` (setup guide)

---

## GET THE FULL SYSTEM

Pairs well with the **Windows Hardening Guide** (€9) and **DNS/VPN Guide** (€7) — fix what the audit finds.

- **Full system — The Blueprint:** all 15 phases + all 9 standalone products included (€84 of parts for €29 Early Bird) → fu75ch1.gumroad.com/l/blueprint
- **More standalone products:** fu75ch1.gumroad.com
- **Public repo (free, sanitized):** github.com/0xWrt/fu75ch1-OS

**→ Buy now on Gumroad**

*Transparency note: every delivered file carries an invisible license watermark (zero-width Unicode signature). The verification script `Verify-GhostMark.py` is included in your download — inspect it yourself. Nothing in this product is hidden from you.*

© fu75ch1 — CC BY-NC 4.0
