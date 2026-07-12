---
date: 2026-07-01
tags: [gumroad, launch, produkte, checkliste]
title: Gumroad Upload Guide — alle 9 Produkte
---

# Gumroad Upload Guide — alle 9 Produkte

> Reihenfolge: Produkt 1+2 bereits angelegt. NEU 2026-07-04: P10 (The Blueprint) MIT hochladen - Copy in Gumroad-P10-Blueprint.md, Zip nach dortigem Manifest packen, Early-Bird als Discount-Code (Limit 50).
> Weiter ab Produkt 3.
> Alle Beschreibungs-MDs liegen in:
> `%USERPROFILE%\Documents\fu75ch1_public\01_Architecture\`

---

## Produkt 1 — Master-Prompt v4.7 ✅

**Titel:** `fu75ch1 Master-Prompt v4.7 — Production AI System Prompt`
**Preis:** €9
**Summary:** `The system prompt that runs a complete AI OS. Jailbreak-resistant, governance layers, security hardened. On red-team metrics we ship an honest retraction: our earlier ASR numbers measured the bare model (harness never injected the prompt) — corrected methodology is in the repo.`
**Additional details:** Inhalt aus Beschreibungs-MD
**Upload 1 (README):** `fu75ch1_public\01_Architecture\Master-Prompt-v4.7.md`
**Upload 2 (Produkt):** `fu75ch1_public\01_Architecture\Master-Prompt-v4.7.md` (gleiche Datei — ist Prompt + Anleitung in einem)
**Slug:** `master-prompt-v47`

---

## Produkt 2 — OpSec Checklist ✅

**Titel:** `fu75ch1 OpSec Checklist — 38-Point Security Audit (PowerShell, v2.0)`
**Preis:** €7
**Summary:** `38 automated security checks for Windows. Run it, get a score. No manual work. Real results in 60 seconds.`
**Additional details:** Inhalt aus Beschreibungs-MD
**Upload 1 (README):** `fu75ch1_public\01_Architecture\Gumroad-P2-OpSec-Checklist.md`
**Upload 2 (Produkt):** `fu75ch1\10_Workflows\Invoke-OpSecAudit.ps1`
**Slug:** `opsec-checklist`

---

## Produkt 3 — Advanced Configs ✅

**Titel:** `fu75ch1 Advanced Configs — Ollama, n8n, WireGuard (Ready-to-Deploy)`
**Preis:** €12
**Status:** Bereit (gebaut 2026-07-02)

**Upload 1 (README):** `fu75ch1_public\01_Architecture\Gumroad-P3-Advanced-Configs.md`

**Upload 2-8 (Produkt-Files):**
```
fu75ch1_public\01_Architecture\Configs\Ollama\model-routing.md
fu75ch1_public\01_Architecture\Configs\Ollama\model-routing.json
fu75ch1_public\01_Architecture\Configs\n8n\docker-compose.yml
fu75ch1_public\01_Architecture\Configs\n8n\webhook-ai-pipeline-template.json
fu75ch1_public\01_Architecture\Configs\WireGuard\client.conf.template
fu75ch1_public\01_Architecture\Configs\WireGuard\Install-KillSwitch.ps1
fu75ch1_public\01_Architecture\Configs\WireGuard\Disable-IPv6Leak.ps1
```

**Slug (reserviert):** `advanced-configs`

---

## Produkt 11 — Security Lab (NEU 2026-07-11)

**Titel:** `fu75ch1 Security Lab — Reverse Engineering + AI Red-Teaming (reproducible, isolated)`
**Preis:** €27 (Early Bird €19, erste 50 — als Gumroad-Discount-Code, Limit 50)
**Summary:** `A reproducible security lab you build from pinned, idempotent scripts: reverse engineering (Android + firmware) and AI red-teaming in one isolated environment. Built around a real, documented measurement failure - so you learn the part most courses skip: proving your test tested what you think it did.`
**Additional details:** Inhalt aus Beschreibungs-MD (`Gumroad-P11-Security-Lab.md`)

**Upload 1 (README):** `fu75ch1_public\02_Shops\Gumroad\Gumroad-P11-Security-Lab.md`

**Upload 2 (Produkt-Zip):** ganzen Ordner packen nach Manifest in der Beschreibungs-MD:
```
fu75ch1_public\01_Architecture\SecurityLab\   (README, SAFETY-and-LEGAL, provision\, modules\)
```
> Vor dem Zippen: `Verify-GhostMark`-Watermark setzen (wie P1-P10), Stale-/PII-Scan ueber den Ordner.

**Slug:** `security-lab`

---

## Produkt 4 — Phase 12 Playbook

**Titel:** `fu75ch1 Phase 12 Playbook — Hardening & Determinism`
**Preis:** €14
**Summary:** `How I hardened my AI system against prompt injection, non-determinism, and unsafe automation. Garak baseline included.`
**Additional details:** Inhalt aus Beschreibungs-MD

**Upload 1 (README):** `fu75ch1_public\01_Architecture\Gumroad-P4-Phase12-Playbook.md`

**Upload 2-5 (Produkt-Files):**
```
fu75ch1_public\01_Architecture\Phases\Phase12_BlockA_Abschluss.md
fu75ch1_public\01_Architecture\Phases\Phase12_BlockB_Abschluss.md
fu75ch1_public\00_PROOF\Garak_Run4_Detail.md
fu75ch1_public\00_PROOF\Garak_Run5_Detail.md
fu75ch1_public\00_PROOF\Garak_Run6_Detail.md
fu75ch1\10_Workflows\Invoke-OpSecAudit.ps1
fu75ch1\10_Workflows\Invoke-OpSecFix-v1.0.ps1
```

**Slug:** `phase12-playbook`

---

## Produkt 5 — Windows Hardening Guide

**Titel:** `fu75ch1 Windows Hardening Guide — ASR, Firewall, Telemetry (Step-by-Step)`
**Preis:** €9
**Summary:** `Harden Windows 11 without losing productivity. Real commands. Real verification. No guesswork.`
**Additional details:** Inhalt aus Beschreibungs-MD

**Upload 1 (README):** `fu75ch1_public\01_Architecture\Gumroad-P5-Windows-Hardening.md`

**Upload 2 (Produkt):**
```
fu75ch1_public\01_Architecture\Phases\Phase01_Retrospektive.md
```

**Slug:** `windows-hardening`

---

## Produkt 6 — DNS/VPN Guide

**Titel:** `fu75ch1 DNS/VPN Guide — NextDNS DoH + WireGuard Kill-Switch`
**Preis:** €7
**Summary:** `Stop your DNS from leaking. Set up encrypted DNS + VPN with Kill-Switch. 30 minutes. Verified via automated leak test.`
**Additional details:** Inhalt aus Beschreibungs-MD

**Upload 1 (README):** `fu75ch1_public\01_Architecture\Gumroad-P6-DNS-VPN-Guide.md`

**Upload 2 (Produkt):**
```
fu75ch1_public\01_Architecture\Phases\Phase02_Abschluss.md
```

**Slug:** `dns-vpn-guide`

---

## Produkt 7 — Browser Hardening

**Titel:** `fu75ch1 Browser Hardening — LibreWolf + uBlock Origin (Exportable Config)`
**Preis:** €7
**Summary:** `Stop browser fingerprinting. Block trackers at the config level. Exportable settings for LibreWolf + uBlock Origin.`
**Additional details:** Inhalt aus Beschreibungs-MD

**Upload 1 (README):** `fu75ch1_public\01_Architecture\Gumroad-P7-Browser-Hardening.md`

**Upload 2 (Produkt):**
```
fu75ch1_public\01_Architecture\Phases\Phase03_Retrospektive.md
```

**Slug:** `browser-hardening`

---

## Produkt 8 — KeePass Blueprint

**Titel:** `fu75ch1 KeePass Blueprint — Offline Credentials with Key-File Concept`
**Preis:** €7
**Summary:** `Your browser's password manager is a security hole. This is the offline alternative — with Key-File, backup strategy, and API key hygiene.`
**Additional details:** Inhalt aus Beschreibungs-MD

**Upload 1 (README):** `fu75ch1_public\01_Architecture\Gumroad-P8-KeePass-Blueprint.md`

**Upload 2 (Produkt):**
```
fu75ch1_public\01_Architecture\Phases\Phase04_Abschluss.md
```

**Slug:** `keepass-blueprint`

---

## Produkt 9 — Tool Stack Guide

**Titel:** `fu75ch1 Tool Stack Guide — Every Tool, Every Decision, Every Config`
**Preis:** €12
**Summary:** `My complete approved tool stack. What I use, what I rejected, and why. With setup notes for each tool.`
**Additional details:** Inhalt aus Beschreibungs-MD

**Upload 1 (README + Produkt in einem):**
```
fu75ch1_public\01_Architecture\Gumroad-P9-Tool-Stack-Guide.md
```
> Diese Datei ist vollständig — kein zweites File nötig.

**Slug:** `tool-stack-guide`

---

## ⚠️ Offene Punkte vor Launch

- [x] Produkt 3: Config-Dateien gebaut (2026-07-02) — Ollama, n8n, WireGuard, 7 Dateien
- [ ] Alle Produkte: Lemon Squeezy URL als Footer-Link nachtragen (sobald LS live)
- [ ] Alle Produkte: Substack URL als Footer-Link nachtragen
- [ ] Thumbnail/Cover-Bild (P10 zuletzt) für alle 9 Produkte (optional, aber empfohlen)
- [ ] Cross-Selling Footer in jedem Produkt: "Full system → The Blueprint [LS LINK]"

---

## Slugs Übersicht

| # | Slug | URL (nach Go-Live) |
|---|---|---|
| 1 | master-prompt-v47 | fu75ch1.gumroad.com/l/master-prompt-v47 |
| 2 | opsec-checklist | fu75ch1.gumroad.com/l/opsec-checklist |
| 3 | advanced-configs | fu75ch1.gumroad.com/l/advanced-configs |
| 4 | phase12-playbook | fu75ch1.gumroad.com/l/phase12-playbook |
| 5 | windows-hardening | fu75ch1.gumroad.com/l/windows-hardening |
| 6 | dns-vpn-guide | fu75ch1.gumroad.com/l/dns-vpn-guide |
| 7 | browser-hardening | fu75ch1.gumroad.com/l/browser-hardening |
| 8 | keepass-blueprint | fu75ch1.gumroad.com/l/keepass-blueprint |
| 9 | tool-stack-guide | fu75ch1.gumroad.com/l/tool-stack-guide |
