---
date: 2026-07-02
tags: [polar, launch, produkte, checkliste, setup]
title: Polar.sh Produkte-Setup — alle 9 launch-bereiten Produkte
status: aktiv
---

# Polar.sh Produkte-Setup

> Organisation bereits angelegt: `slug: fu75ch1`, `legal_entity: individual`,
> `default_presentment_currency: eur`. Environment: **Produktion** (`polar.sh`,
> nicht `sandbox.polar.sh` — Sandbox ist nur für Test-Zahlungen, siehe unten).
>
> Quelle der Copy-Texte: `Gumroad-P*.md` in diesem Ordner (identischer Content
> wird für Polar wiederverwendet, inkl. der neuen Cross-Promotion-Footer).
> Produkt 3 (Advanced Configs) ist seit 2026-07-02 ebenfalls bereit — Config-
> Dateien liegen unter `Configs/Ollama`, `Configs/n8n`, `Configs/WireGuard`.

---

## 🟢 Release-Status (Stand 2026-07-02)

| # | Produkt | Status | Grund |
|---|---|---|---|
| 1 | Master-Prompt v4.7 | ✅ **Bereit** | Datei verifiziert, Benefit-Bundle vollständig |
| 2 | OpSec Checklist | ✅ **Bereit** | Script + Setup-Guide vorhanden |
| 3 | Advanced Configs | ✅ **Bereit** (2026-07-02) | Config-Dateien gebaut: Ollama Model-Routing, n8n Docker Compose + Webhook-Template, WireGuard Client-Template + Kill-Switch + IPv6-Leak-Fix |
| 4 | Phase 12 Playbook | ✅ **Bereit** | Alle 8 Dateien verifiziert |
| 5 | Windows Hardening Guide | ✅ **Bereit** | README + Phase01_Retrospektive vorhanden |
| 6 | DNS/VPN Guide | ✅ **Bereit** | README + Phase02_Abschluss vorhanden |
| 7 | Browser Hardening | ✅ **Bereit** | README + Phase03_Retrospektive vorhanden |
| 8 | KeePass Blueprint | ✅ **Bereit** | README + Phase04_Abschluss vorhanden |
| 9 | Tool Stack Guide | ✅ **Bereit** | Einzeldatei, vollständig |

**→ Alle 9 Produkte können jetzt bei Polar angelegt werden.**

---

## ⚠️ Vor dem ersten Produkt — offene/kritische Punkte

| # | Punkt | Status |
|---|---|---|
| 1 | API-Key `polar_sk_Yj1m...` aus dem Onboarding-Screenshot | **Nach Abschluss Onboarding rotieren** (Settings → Developers) — war extern sichtbar |
| 2 | Support-E-Mail | Noch offen ("kommt später") — Produkte können ohne Support-Email angelegt werden (optionales Feld), aber vor dem ersten echten Verkauf nachtragen |
| 3 | Echtes Bankkonto / Stripe Connect | Läuft nur in Produktion (`polar.sh`), nicht in Sandbox — separater Schritt, KYC-Business-Details nötig |
| 4 | Cookie-Banner im Onboarding | "Decline" — nicht "Accept" (Anti-Tracking-Linie) |
| 5 | GitHub-Verknüpfung | Nicht verknüpfen — separate E-Mail-Anmeldung (siehe Chat-Historie) |
| 6 | `[LEMON SQUEEZY LINK]` / `[SUBSTACK LINK]` Platzhalter in allen Beschreibungen | Noch offen, siehe `Gumroad-Footer-Platzhalter.md` — gilt 1:1 auch für Polar-Texte |
| 7 | Website-Feld (Organisation) | `https://github.com/0xWrt/fu75ch1-OS` |
| 8 | Produkt-Preise | Polar erlaubt Multi-Currency — Default EUR ist bereits gesetzt, pro Produkt einzeln bestätigen |
| 9 | Product Images (Checkout-Cover) | ✅ Erstellt (2026-07-02) — 8x PNG, 1200x630, einheitliches Template mit Logo. Liegen noch außerhalb des Vaults (Chat-Download) — ablegen unter `fu75ch1_public\01_Architecture\Covers\cover-<slug>.png` |
| 10 | Custom Checkout Fields | Geprüft, **nicht benötigt** — keine der 8 Produkte braucht zusätzliche Käuferdaten (reine File-Downloads, kein Repo-/Discord-Benefit) |

## Hinweis zum Description-Feld (gilt für alle 8 Produkte unten)

Polars Produkt-Description unterstützt **Markdown** und ist für den vollen
Produkt-Pitch gedacht (nicht nur eine Kurzzeile wie bei Gumroad). Für jedes
Produkt unten gilt: **volle SUMMARY + DESCRIPTION aus der jeweiligen
`Gumroad-Px.md`** ins Polar-Description-Feld übernehmen — die "Description
(kurz)"-Zeilen unten sind nur Kurzreferenz/Fallback, nicht die finale Polar-Copy.
Die "Volltext/Details"-Zeile je Produkt zeigt auf die korrekte Quelldatei.

---

## Produkt 1 — Master-Prompt v4.7

- **Name:** `fu75ch1 Master-Prompt v4.7 — Production AI System Prompt`
- **Slug:** `master-prompt-v47`
- **Preis:** €9 · One-time purchase
- **Description (kurz, fürs Polar-Feld):**
  `The system prompt that runs a complete AI OS. Jailbreak-resistant. Garak 0.15.1 tested: 0% ASR (AutoDANCached, pilot) and 38.43% ASR (DanInTheWild, 512 real-world probes). Governance layers. Security hardened.`
- **Volltext/Details:** aus `Gumroad-P1-Master-Prompt.md` (inkl. Cross-Promotion-Footer)
- **Benefit-Typ:** File Download (`downloadables`)
- **Benefit-Description (kurzes Label, sichtbar im Checkout/Portal/Mail):**
  `Master-Prompt v4.7 (.md, ready to paste)`
- **Datei(en) für File-Download-Benefit:**
  `fu75ch1_public\01_Architecture\Master-Prompt-v4.7-Gumroad.md`
  *(Prompt + Anleitung in einer Datei — kein zweites Upload nötig)*
- **Currently selling on:** Gumroad ✅
- **Product URL:** `https://github.com/0xWrt/fu75ch1-OS`
- **Metadata (intern, nicht kundensichtbar):**
  ```json
  { "gumroad_slug": "master-prompt-v47", "phase": "n/a", "content_version": "v4.7", "category": "prompt-engineering" }
  ```

---

## Produkt 2 — OpSec Checklist

- **Name:** `fu75ch1 OpSec Checklist — 34-Point Security Audit (PowerShell, v2.0)`
- **Slug:** `opsec-checklist`
- **Preis:** €7 · One-time purchase
- **Description (kurz):**
  `34 automated security checks for Windows. Run it, get a score. No manual work. Real results in 60 seconds.`
- **Volltext/Details:** aus `Gumroad-P2-OpSec-Checklist.md`
- **Benefit-Typ:** File Download (`downloadables`, 2 Dateien in einem Benefit-Paket)
- **Benefit-Description:** `OpSec Audit Script + Setup Guide (.ps1 + .md)`
- **Dateien:**
  ```
  fu75ch1\10_Workflows\Invoke-OpSecAudit.ps1
  fu75ch1_public\01_Architecture\Gumroad-P2-OpSec-Checklist.md   (als Setup-Guide mitgeben)
  ```
- **Currently selling on:** Gumroad ✅
- **Product URL:** `https://github.com/0xWrt/fu75ch1-OS`
- **Metadata (intern):**
  ```json
  { "gumroad_slug": "opsec-checklist", "phase": "n/a", "content_version": "v2.0", "category": "opsec-automation" }
  ```

---

## Produkt 3 — Advanced Configs

- **Name:** `fu75ch1 Advanced Configs — Ollama, n8n, WireGuard (Ready-to-Deploy)`
- **Slug:** `advanced-configs`
- **Preis:** €12 · One-time purchase
- **Description (kurz):**
  `Production-ready configuration files for three core local AI stack components. Copy, adjust two variables, deploy.`
- **Volltext/Details:** aus `Gumroad-P3-Advanced-Configs.md`
- **Benefit-Typ:** File Download (`downloadables`, 6 Dateien in einem Benefit-Paket)
- **Benefit-Description:** `Ollama + n8n + WireGuard Configs (6 files, ready-to-deploy)`
- **Dateien (gebaut 2026-07-02):**
  ```
  fu75ch1_public\01_Architecture\Gumroad-P3-Advanced-Configs.md          (README)
  fu75ch1_public\01_Architecture\Configs\Ollama\model-routing.md
  fu75ch1_public\01_Architecture\Configs\Ollama\model-routing.json
  fu75ch1_public\01_Architecture\Configs\n8n\docker-compose.yml
  fu75ch1_public\01_Architecture\Configs\n8n\webhook-ai-pipeline-template.json
  fu75ch1_public\01_Architecture\Configs\WireGuard\client.conf.template
  fu75ch1_public\01_Architecture\Configs\WireGuard\Install-KillSwitch.ps1
  fu75ch1_public\01_Architecture\Configs\WireGuard\Disable-IPv6Leak.ps1
  ```
  *(8 Dateien statt der ursprünglich geplanten 6 — Ollama-Config liegt als .md +
  .json vor, WireGuard hat zusätzlich das separate IPv6-Skript)*
- **Currently selling on:** Gumroad ✅
- **Product URL:** `https://github.com/0xWrt/fu75ch1-OS`
- **Metadata (intern):**
  ```json
  { "gumroad_slug": "advanced-configs", "phase": "n/a", "content_version": "v1", "category": "infrastructure-configs" }
  ```

---

## Produkt 4 — Phase 12 Playbook

- **Name:** `fu75ch1 Phase 12 Playbook — Hardening & Determinism`
- **Slug:** `phase12-playbook`
- **Preis:** €14 · One-time purchase
- **Description (kurz):**
  `How I hardened my AI system against prompt injection, non-determinism, and unsafe automation. Garak baseline included.`
- **Volltext/Details:** aus `Gumroad-P4-Phase12-Playbook.md`
- **Benefit-Typ:** File Download (`downloadables`, Paket, 7 Dateien + README)
- **Benefit-Description:** `Phase 12 Playbook Bundle (8 files: README, hardening docs, Garak reports, scripts)`
- **Dateien (alle vorhanden, geprüft 2026-07-02):**
  ```
  fu75ch1_public\01_Architecture\Gumroad-P4-Phase12-Playbook.md   (README)
  fu75ch1_public\01_Architecture\Phases\Phase12_BlockA_Abschluss.md
  fu75ch1_public\01_Architecture\Phases\Phase12_BlockB_Abschluss.md
  fu75ch1_public\00_PROOF\Garak_Run4_Detail.md
  fu75ch1_public\00_PROOF\Garak_Run5_Detail.md
  fu75ch1_public\00_PROOF\Garak_Run6_Detail.md
  fu75ch1\10_Workflows\Invoke-OpSecAudit.ps1
  fu75ch1\10_Workflows\Invoke-OpSecFix-v1.0.ps1
  ```
- **Currently selling on:** Gumroad ✅
- **Product URL:** `https://github.com/0xWrt/fu75ch1-OS`
- **Metadata (intern):**
  ```json
  { "gumroad_slug": "phase12-playbook", "phase": "phase12", "content_version": "v1", "category": "hardening-guide" }
  ```

---

## Produkt 5 — Windows Hardening Guide

- **Name:** `fu75ch1 Windows Hardening Guide — ASR, Firewall, Telemetry (Step-by-Step)`
- **Slug:** `windows-hardening`
- **Preis:** €9 · One-time purchase
- **Description (kurz):**
  `Harden Windows 11 without losing productivity. Real commands. Real verification. No guesswork.`
- **Volltext/Details:** aus `Gumroad-P5-Windows-Hardening.md`
- **Benefit-Typ:** File Download (`downloadables`)
- **Benefit-Description:** `Windows Hardening Guide + Phase 1 Retrospective`
- **Dateien:**
  ```
  fu75ch1_public\01_Architecture\Gumroad-P5-Windows-Hardening.md   (README)
  fu75ch1_public\01_Architecture\Phases\Phase01_Retrospektive.md
  ```
- **Currently selling on:** Gumroad ✅
- **Product URL:** `https://github.com/0xWrt/fu75ch1-OS`
- **Metadata (intern):**
  ```json
  { "gumroad_slug": "windows-hardening", "phase": "phase01", "content_version": "v1", "category": "hardening-guide" }
  ```

---

## Produkt 6 — DNS/VPN Guide

- **Name:** `fu75ch1 DNS/VPN Guide — NextDNS DoH + WireGuard Kill-Switch`
- **Slug:** `dns-vpn-guide`
- **Preis:** €7 · One-time purchase
- **Description (kurz):**
  `Stop your DNS from leaking. Set up encrypted DNS + VPN with Kill-Switch. 30 minutes. Verified via automated leak test.`
- **Volltext/Details:** aus `Gumroad-P6-DNS-VPN-Guide.md`
- **Benefit-Typ:** File Download (`downloadables`)
- **Benefit-Description:** `DNS/VPN Guide + Phase 2 Completion Notes`
- **Dateien:**
  ```
  fu75ch1_public\01_Architecture\Gumroad-P6-DNS-VPN-Guide.md   (README)
  fu75ch1_public\01_Architecture\Phases\Phase02_Abschluss.md
  ```
- **Currently selling on:** Gumroad ✅
- **Product URL:** `https://github.com/0xWrt/fu75ch1-OS`
- **Metadata (intern):**
  ```json
  { "gumroad_slug": "dns-vpn-guide", "phase": "phase02", "content_version": "v1", "category": "network-privacy" }
  ```

---

## Produkt 7 — Browser Hardening

- **Name:** `fu75ch1 Browser Hardening — LibreWolf + uBlock Origin (Exportable Config)`
- **Slug:** `browser-hardening`
- **Preis:** €7 · One-time purchase
- **Description (kurz):**
  `Stop browser fingerprinting. Block trackers at the config level. Exportable settings for LibreWolf + uBlock Origin.`
- **Volltext/Details:** aus `Gumroad-P7-Browser-Hardening.md`
- **Benefit-Typ:** File Download (`downloadables`)
- **Benefit-Description:** `Browser Hardening Guide + Phase 3 Retrospective`
- **Dateien:**
  ```
  fu75ch1_public\01_Architecture\Gumroad-P7-Browser-Hardening.md   (README)
  fu75ch1_public\01_Architecture\Phases\Phase03_Retrospektive.md
  ```
- **Currently selling on:** Gumroad ✅
- **Product URL:** `https://github.com/0xWrt/fu75ch1-OS`
- **Metadata (intern):**
  ```json
  { "gumroad_slug": "browser-hardening", "phase": "phase03", "content_version": "v1", "category": "browser-privacy" }
  ```

---

## Produkt 8 — KeePass Blueprint

- **Name:** `fu75ch1 KeePass Blueprint — Offline Credentials with Key-File Concept`
- **Slug:** `keepass-blueprint`
- **Preis:** €7 · One-time purchase
- **Description (kurz):**
  `Your browser's password manager is a security hole. This is the offline alternative — with Key-File, backup strategy, and API key hygiene.`
- **Volltext/Details:** aus `Gumroad-P8-KeePass-Blueprint.md`
- **Benefit-Typ:** File Download (`downloadables`)
- **Benefit-Description:** `KeePass Blueprint + Phase 4 Completion Notes`
- **Dateien:**
  ```
  fu75ch1_public\01_Architecture\Gumroad-P8-KeePass-Blueprint.md   (README)
  fu75ch1_public\01_Architecture\Phases\Phase04_Abschluss.md
  ```
- **Currently selling on:** Gumroad ✅
- **Product URL:** `https://github.com/0xWrt/fu75ch1-OS`
- **Metadata (intern):**
  ```json
  { "gumroad_slug": "keepass-blueprint", "phase": "phase04", "content_version": "v1", "category": "credential-management" }
  ```

---

## Produkt 9 — Tool Stack Guide

- **Name:** `fu75ch1 Tool Stack Guide — Every Tool, Every Decision, Every Config`
- **Slug:** `tool-stack-guide`
- **Preis:** €12 · One-time purchase
- **Description (kurz):**
  `My complete approved tool stack. What I use, what I rejected, and why. With setup notes for each tool.`
- **Volltext/Details:** aus `Gumroad-P9-Tool-Stack-Guide.md`
- **Benefit-Typ:** File Download (`downloadables`)
- **Benefit-Description:** `Tool Stack Guide (complete, single file)`
- **Datei:**
  ```
  fu75ch1_public\01_Architecture\Gumroad-P9-Tool-Stack-Guide.md
  ```
  *(vollständig — kein zweites File nötig)*
- **Currently selling on:** Gumroad ✅
- **Product URL:** `https://github.com/0xWrt/fu75ch1-OS`
- **Metadata (intern):**
  ```json
  { "gumroad_slug": "tool-stack-guide", "phase": "n/a", "content_version": "v1", "category": "reference" }
  ```

---

## Reihenfolge-Empfehlung für den Live-Anlage-Prozess

1. Support-E-Mail final festlegen (steht noch aus)
2. Produkt 1 + 2 zuerst (bereits auf Gumroad erprobt, Copy sitzt)
3. Danach 3 → 9 der Reihe nach
4. Nach jedem Produkt: Benefit-Datei(en) testweise selbst herunterladen und
   öffnen (Checkout-Flow einmal live mit dir selbst als Käufer, falls Polar das
   ohne Sandbox erlaubt — sonst über Sandbox-Konto separat verifizieren)
5. Erst danach: `[LEMON SQUEEZY LINK]` / `[SUBSTACK LINK]` Platzhalter global
   ersetzen (Batch-Skript liegt in `Gumroad-Footer-Platzhalter.md`)

## Verknüpfte Notizen
- [[Gumroad-Upload-Guide]]
- [[Gumroad-Footer-Platzhalter]]
- [[GUMROAD_Products]]
- [[Offene_Punkte_ToDo]]
