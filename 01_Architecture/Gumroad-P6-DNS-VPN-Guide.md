# Product 6 — DNS/VPN Guide
# Title: fu75ch1 DNS/VPN Guide — NextDNS DoH + WireGuard Kill-Switch
# Price: €7
# Slug: dns-vpn-guide

---

## SUMMARY

Stop your DNS from leaking. Encrypted DNS + VPN with Kill-Switch, set up in 30 minutes — every step verified with an automated leak test.

---

## DESCRIPTION

Your DNS provider knows every domain you visit. By default, on most systems, that traffic is unencrypted, unprotected, and logged.

This guide closes that gap end to end — from the DNS resolver to the VPN tunnel to the Kill-Switch that ensures nothing leaks if the connection drops.

Every step includes a verification command. You do not trust it works. You test it works.

Built as Phase 2 of the fu75ch1 AI operating system, running continuously under Mullvad WireGuard with NextDNS DoH and an automated 60-second watchdog.

One of 101 documented build steps from a solo, two-week project — the watchdog exists because the leak happened once, got logged, and got fixed.

---

## DETAILS

**NextDNS:**
- Account setup with a privacy-respecting configuration
- Custom filter lists: what to block, what to leave alone
- Logging control: how much to log and for how long
- Profile export for reuse across devices

**DNS-over-HTTPS on Windows:**
- Enable DoH on all adapters via PowerShell
- Verify no plaintext DNS leaves the machine
- Fallback handling

**WireGuard Client (Windows):**
- Config file structure explained line by line
- Import, connect, verify
- What each setting does and why it's set that way

**Kill-Switch:**
- Windows Firewall rules so no traffic passes without an active tunnel
- What happens on VPN drop — blocks, not leaks
- Verification procedure
- Reconnect behavior

**IPv6 Leak Prevention:**
- Disable on all physical adapters
- Handle VirtualBox / WSL2 adapter exceptions
- Verify no IPv6 traffic leaks

**Automated DNS Leak Test (PowerShell script included):**
- Run it, read the output
- How to interpret partial leaks
- What a clean result looks like

**Requirements:** Windows 11, PowerShell 7+

---

## GET THE FULL SYSTEM

Pairs well with the **Browser Hardening** config (€7) — close the last major leak surface.

- **Full system (all 15 phases):** [LEMON SQUEEZY LINK] — €29 Early Bird
- **More standalone products:** fu75ch1.gumroad.com
- **Weekly build notes:** [SUBSTACK LINK]
- **Public repo (free, sanitized):** github.com/0xWrt/fu75ch1-OS

**→ Buy now on Gumroad**

© fu75ch1 — CC BY-NC 4.0
