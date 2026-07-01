# Product 2 — OpSec Checklist
# Title: fu75ch1 OpSec Checklist — 34-Point Security Audit (PowerShell, v2.0)
# Price: €7
# Slug: opsec-checklist

---

## SUMMARY

34 automated security checks for Windows 11. Run it, get a score. No manual work, no guesswork — real results in under 60 seconds.

---

## DESCRIPTION

Most security checklists are PDFs you read once and forget. This one runs on your machine and tells you exactly where you stand.

`Invoke-OpSecAudit.ps1` is the exact script used to audit the fu75ch1 AI operating system — 34 checks across 6 categories, automated, with a clear pass/fail output and an overall score.

No raw data leaves the machine. No IPs, MACs, or credentials in the output. Just clean results you can act on.

If you want to know your actual security posture — not your assumed one — run this script.

---

## DETAILS

**34 checks across 6 categories:**

- VPN & Network (5): interface active, default route over VPN, service running, IPv6 disabled, DNS over VPN only
- System Security (5): Firewall all profiles, UAC, Secure Boot, Defender real-time, Defender definitions age
- System Hardening (4): WDigest disabled, LSASS PPL active, SMBv1 disabled, RDP disabled
- Tools & AppSec (8): gitleaks, PSScriptAnalyzer, Git repo, KeePassXC database, vault Git clean, PII scrubber, VPN watchdog, autostart task
- AI Stack Security (3): API key file permissions, Docker daemon exposure, PIIScrubber integration
- Anti-Tracking (9): telemetry level, advertiser ID, activity history, LLMNR, NetBIOS, Delivery Optimization, location services, WiFi MAC randomization, autorun disabled

**Output format:**
```
[OK] Check 01: VPN interface active
[X]  Check 04: IPv6 disabled (physical adapters)
...
OpSec Score: 31/34 (91%)
```

**Properties:**
- Idempotent — safe to run repeatedly
- No PII in output, no raw network data
- Category breakdown included
- Admin rights required for full results

**Requirements:** Windows 11, PowerShell 7+

**Includes:** `Invoke-OpSecAudit.ps1` + `Gumroad-P2-OpSec-Checklist.md` (setup guide)

© fu75ch1 — CC BY-NC 4.0
