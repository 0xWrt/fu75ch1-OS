---
date: 2026-07-24
tags: [polar, felder, upload, checkliste, launch]
status: Arbeitsblatt -- Copy-Quelle sind die Polar-P*.md im selben Ordner
title: Polar Feldbelegung -- jedes Eingabefeld, P1-P11
---

# Polar Feldbelegung -- jedes Eingabefeld

> Doku-Stand **2026-07-24**, gelesen aus `docs.polar.sh/features/products`,
> `/features/benefits/custom`, `/features/custom-fields` sowie der API-Referenz
> `/api-reference/products/create`.
>
> Copy-Quelle sind die **neutralisierten** `Polar-P*.md` im selben Ordner --
> nicht die Gumroad-Fassungen. Kein „Buy now on Gumroad", kein gumroad.com-Link,
> dafuer Ghost-Mark eingebettet.

---

## ⚠️ 0. Drei Dinge, die vor dem ersten Produkt geklaert sein muessen

### 0.1 Das 42-Zeichen-Kurzfeld steht nicht mehr in der Doku

`Polar-Produkte-Setup.md` ist komplett um ein „Kurzbeschreibung / Teaser"-Feld mit
**hartem 42-Zeichen-Limit** herumgebaut -- neun handgezaehlte Kurztexte.

Die aktuelle Doku kennt unter „Checkout Page" nur **drei** Felder: Description
(Markdown, kein Limit genannt), Product media, Checkout fields. Ein separates
Kurz-/Teaserfeld taucht nirgends auf, auch nicht in der API-Referenz.

Das heisst nicht zwingend, dass es das Feld nicht gibt -- Abwesenheit in der Doku
ist kein Beweis. Aber es heisst: **im UI nachsehen, bevor du 42-Zeichen-Texte
eintippst.** Falls das Feld weg ist, sind die neun Kurztexte unten hinfaellig und
nur noch Ideengeber.

### 0.2 Zwei Dinge sind bei Polar nach dem Anlegen UNVERAENDERLICH

Laut Doku sind **Billing Cycle** (one-time vs. recurring) und **Pricing Type**
(fixed / pay-what-you-want / free / metered / seat-based) bei der Erstellung
festgezurrt. Aendern geht nur ueber ein **neues Produkt**.

Der Betrag bei Fixed-Price laesst sich jederzeit aendern. Fuer deine Produkte also:
**one-time + fixed** ueberall, dann bist du auf der sicheren Seite. Early-Bird
laeuft ueber einen **Discount-Code**, nicht ueber einen zweiten Preis.

Nuetzlich: **Duplicate Product** im Produktmenue klont alle Einstellungen als
Entwurf. Fuer P5-P8 (gleiche Struktur, nur andere Datei) spart das die meiste
Tipparbeit.

### 0.3 Stale-Werte im bestehenden Setup

| Stelle | Steht da | Richtig |
|---|---|---|
| P2 Name | `34-Point Security Audit` | **38-Point** |
| P2 Kurzbeschreibung | `34-point Windows security audit script` | **38-point ...** |
| P2 Referenz-Satz | „34 automated security checks" | **38** |
| Kopfzeile | „alle 9 launch-bereiten Produkte" | **10** -- `Polar-P11-Security-Lab.md` existiert |
| Offener Punkt 1 | API-Key `polar_sk_...` aus dem Onboarding rotieren | Status unklar -- **pruefen** |

---

## 1. Die Felder, die Polar wirklich hat

### Produkt-Ebene

| Feld | Pflicht | Anmerkung |
|---|---|---|
| **Name** | ja | kein dokumentiertes Zeichenlimit |
| **Billing cycle** | ja | one-time / recurring -- **danach unveraenderlich** |
| **Pricing type** | ja | fixed / PWYW / free / metered / seat-based -- **unveraenderlich** |
| **Amount + Currency** | ja | Preis in der Default-Waehrung ist Pflicht. Fehlt er, gilt das Produkt als **kostenlos** |
| Weitere Waehrungen | nein | Polar waehlt nach Geolocation, faellt sonst auf den Org-Default zurueck |
| **Metadata** | nein | Key-Value, **nicht kundensichtbar**, laeuft auf jeder Order und jedem Webhook mit |
| Trial period | -- | nur bei recurring, fuer dich irrelevant |

> **Steuer:** Ob dein eingetragener Betrag die Steuer enthaelt oder sie oben
> draufkommt, haengt am Tax-Behavior-Setting. Default richtet sich nach dem Land
> des Kaeufers -- in den meisten Laendern inklusive, in US/Kanada/Indien exklusiv.
> Org-weit unter **Settings** einstellbar.

### Checkout-Seite

| Feld | Anmerkung |
|---|---|
| **Description** | Markdown. Der eigentliche Verkaufstext |
| **Product media** | Bilder, je bis **10 MB**, per Drag&Drop sortierbar |
| **Checkout fields** | Org-weit unter Settings → Custom Fields definiert, pro Produkt aktivierbar. Typen: text, number, date, checkbox, select. Laut altem Setup **nicht benoetigt** -- bleibt so |

### Benefits (das, was der Kaeufer bekommt)

Typen: **Downloadables** (File Download), License Keys, Discord, GitHub Repository,
Feature Flag, Custom. Fuer dich ist ausschliesslich **Downloadables** relevant.

Polar vergibt und entzieht Benefits automatisch. **Benefit-Aenderungen wirken
rueckwirkend:** ein neu hinzugefuegter Benefit landet auch bei Bestandskunden, ein
entfernter wird ihnen entzogen.

> **Custom Benefit als Zusatz:** Beim Custom Benefit ist die *Description* der
> Titel, den der Kunde sieht, und die *Private note* der Inhalt -- gerendertes
> Markdown, sichtbar auf der Erfolgsseite, in der Kaufbestaetigungs-Mail und im
> Customer Portal. Das ist die richtige Stelle fuer den Ghost-Mark-Hinweis und
> den Repo-Link, analog zum Gumroad-Receipt-Tab.

---

## 2. Feldbelegung pro Produkt

Für alle: **Billing cycle** `one-time` · **Pricing type** `fixed` ·
**Currency** `EUR` (Org-Default) · **Product URL** `https://github.com/0xWrt/fu75ch1-OS` ·
**Benefit-Typ** `Downloadables` · **Checkout fields** keine.

**Description (Markdown)** = jeweils die volle SUMMARY + DESCRIPTION aus der
genannten `Polar-P*.md`.

**Dateien** = der fertige Paketordner aus
`02_Shops\_UPLOAD_READY\zips\` (gewatermarkt, `Verify-GhostMark.py` liegt bei).

---

### P1 -- Master-Prompt v4.7

| Feld | Wert |
|---|---|
| Name | `fu75ch1 Master-Prompt v4.7 — Production AI System Prompt` |
| Slug | `master-prompt-v47` |
| Amount | `9` EUR |
| Description | aus `Polar-P1-Master-Prompt.md` |
| Kurzfeld (falls vorhanden) | `Jailbreak-resistant AI system prompt` *(36)* |
| Benefit-Description | `Master-Prompt v4.7 (.md, ready to paste)` |
| Dateien | `zips\P01_master-prompt-v47\` |
| Metadata | `{ "source_slug": "master-prompt-v47", "phase": "n/a", "content_version": "v4.7", "category": "prompt-engineering" }` |

---

### P2 -- OpSec Checklist

| Feld | Wert |
|---|---|
| Name | `fu75ch1 OpSec Checklist — 38-Point Security Audit (PowerShell, v2.0)` |
| Slug | `opsec-checklist` |
| Amount | `7` EUR |
| Description | aus `Polar-P2-OpSec-Checklist.md` |
| Kurzfeld | `38-point Windows security audit script` *(38)* |
| Benefit-Description | `OpSec Audit Script + Setup Guide (.ps1 + .md)` |
| Dateien | `zips\P02_opsec-checklist\` |
| Metadata | `{ "source_slug": "opsec-checklist", "phase": "n/a", "content_version": "v2.0", "category": "opsec-automation" }` |

> **34 → 38 korrigieren**, an allen drei Stellen im alten Setup-Dokument.

---

### P3 -- Advanced Configs

| Feld | Wert |
|---|---|
| Name | `fu75ch1 Advanced Configs — Ollama, n8n, WireGuard (Ready-to-Deploy)` |
| Slug | `advanced-configs` |
| Amount | `12` EUR |
| Description | aus `Polar-P3-Advanced-Configs.md` |
| Kurzfeld | `Ready-to-deploy configs: Ollama, n8n, WG` *(40)* |
| Benefit-Description | `Ollama + n8n + WireGuard Configs (8 files, ready-to-deploy)` |
| Dateien | `zips\P03_advanced-configs\` |
| Metadata | `{ "source_slug": "advanced-configs", "phase": "n/a", "content_version": "v1", "category": "infrastructure-configs" }` |

> Benefit-Description sagte bisher „6 files", das Paket hat **8**. Und: die zwei
> JSON-Configs tragen keine Ghost-Mark, die Transparenznote in der Copy benennt
> das inzwischen.

---

### P4 -- Phase 12 Playbook

| Feld | Wert |
|---|---|
| Name | `fu75ch1 Phase 12 Playbook — Hardening & Determinism` |
| Slug | `phase12-playbook` |
| Amount | `14` EUR |
| Description | aus `Polar-P4-Phase12-Playbook.md` |
| Kurzfeld | `Hardening playbook: injection, safety` *(37)* |
| Benefit-Description | `Phase 12 Playbook Bundle (README, hardening docs, Garak reports, scripts)` |
| Dateien | `zips\P04_phase12-playbook\` |
| Metadata | `{ "source_slug": "phase12-playbook", "phase": "phase12", "content_version": "v1", "category": "hardening-guide" }` |

---

### P5 -- Windows Hardening Guide

| Feld | Wert |
|---|---|
| Name | `fu75ch1 Windows Hardening Guide — ASR, Firewall, Telemetry (Step-by-Step)` |
| Slug | `windows-hardening` |
| Amount | `9` EUR |
| Description | aus `Polar-P5-Windows-Hardening.md` |
| Kurzfeld | `Harden Windows 11 step-by-step guide` *(36)* |
| Benefit-Description | `Windows Hardening Guide + Phase 1 Retrospective` |
| Dateien | `zips\P05_windows-hardening\` |
| Metadata | `{ "source_slug": "windows-hardening", "phase": "phase01", "content_version": "v1", "category": "hardening-guide" }` |

---

### P6 -- DNS/VPN Guide

| Feld | Wert |
|---|---|
| Name | `fu75ch1 DNS/VPN Guide — NextDNS DoH + WireGuard Kill-Switch` |
| Slug | `dns-vpn-guide` |
| Amount | `7` EUR |
| Description | aus `Polar-P6-DNS-VPN-Guide.md` |
| Kurzfeld | `Stop DNS leaks: encrypted DNS + VPN setup` *(41)* |
| Benefit-Description | `DNS/VPN Guide + Phase 2 Completion Notes` |
| Dateien | `zips\P06_dns-vpn-guide\` |
| Metadata | `{ "source_slug": "dns-vpn-guide", "phase": "phase02", "content_version": "v1", "category": "network-privacy" }` |

---

### P7 -- Browser Hardening

| Feld | Wert |
|---|---|
| Name | `fu75ch1 Browser Hardening — LibreWolf + uBlock Origin (Exportable Config)` |
| Slug | `browser-hardening` |
| Amount | `7` EUR |
| Description | aus `Polar-P7-Browser-Hardening.md` |
| Kurzfeld | `Block browser fingerprinting & tracking` *(39)* |
| Benefit-Description | `Browser Hardening Guide + Phase 3 Retrospective` |
| Dateien | `zips\P07_browser-hardening\` |
| Metadata | `{ "source_slug": "browser-hardening", "phase": "phase03", "content_version": "v1", "category": "browser-privacy" }` |

---

### P8 -- KeePass Blueprint

| Feld | Wert |
|---|---|
| Name | `fu75ch1 KeePass Blueprint — Offline Credentials with Key-File Concept` |
| Slug | `keepass-blueprint` |
| Amount | `7` EUR |
| Description | aus `Polar-P8-KeePass-Blueprint.md` |
| Kurzfeld | `Offline password manager setup (KeePass)` *(40)* |
| Benefit-Description | `KeePass Blueprint + Phase 4 Completion Notes` |
| Dateien | `zips\P08_keepass-blueprint\` |
| Metadata | `{ "source_slug": "keepass-blueprint", "phase": "phase04", "content_version": "v1", "category": "credential-management" }` |

---

### P9 -- Tool Stack Guide

| Feld | Wert |
|---|---|
| Name | `fu75ch1 Tool Stack Guide — Every Tool, Every Decision, Every Config` |
| Slug | `tool-stack-guide` |
| Amount | `12` EUR |
| Description | aus `Polar-P9-Tool-Stack-Guide.md` |
| Kurzfeld | `Complete approved tool stack + notes` *(36)* |
| Benefit-Description | `Tool Stack Guide (complete, single file)` |
| Dateien | `zips\P09_tool-stack-guide\` |
| Metadata | `{ "source_slug": "tool-stack-guide", "phase": "n/a", "content_version": "v1", "category": "reference" }` |

---

### P11 -- Security Lab

| Feld | Wert |
|---|---|
| Name | `fu75ch1 Security Lab — Reverse Engineering + AI Red-Teaming` |
| Slug | `security-lab` |
| Amount | `27` EUR (Early Bird `19` ueber Discount-Code, Limit 50) |
| Description | aus `Polar-P11-Security-Lab.md` -- inkl. HONEST STATUS, WHO IT'S FOR, WHAT YOU NEED |
| Kurzfeld | `Isolated RE + AI red-teaming lab` *(32)* |
| Benefit-Description | `Security Lab (5 modules, provisioners, Dockerfile, verifier)` |
| Dateien | `zips\P11_security-lab\` (15 Dateien) |
| Metadata | `{ "source_slug": "security-lab", "phase": "n/a", "content_version": "v1", "category": "security-lab" }` |

> Fehlte im alten Setup-Dokument komplett.

---

## 3. Uebersicht Kurzfelder (nur falls das Feld existiert)

| # | Produkt | Kurzbeschreibung | Zeichen |
|---|---|---|---|
| 1 | Master-Prompt v4.7 | Jailbreak-resistant AI system prompt | 36 |
| 2 | OpSec Checklist | 38-point Windows security audit script | 38 |
| 3 | Advanced Configs | Ready-to-deploy configs: Ollama, n8n, WG | 40 |
| 4 | Phase 12 Playbook | Hardening playbook: injection, safety | 37 |
| 5 | Windows Hardening | Harden Windows 11 step-by-step guide | 36 |
| 6 | DNS/VPN Guide | Stop DNS leaks: encrypted DNS + VPN setup | 41 |
| 7 | Browser Hardening | Block browser fingerprinting & tracking | 39 |
| 8 | KeePass Blueprint | Offline password manager setup (KeePass) | 40 |
| 9 | Tool Stack Guide | Complete approved tool stack + notes | 36 |
| 11 | Security Lab | Isolated RE + AI red-teaming lab | 32 |

Alle Werte nachgezaehlt inkl. Leer- und Satzzeichen. Vor dem Eintragen die
Live-Zeichenanzeige des Feldes pruefen, falls Polar Sonderzeichen anders zaehlt.

---

## 4. Offen aus dem alten Setup

| # | Punkt | Status |
|---|---|---|
| 1 | API-Key aus dem Onboarding rotieren (Settings → Developers) | **pruefen** -- war extern sichtbar |
| 2 | Support-E-Mail | offen; Produkte gehen ohne, vor dem ersten echten Verkauf nachtragen |
| 3 | Stripe Connect / Bankkonto | nur in Produktion, KYC noetig |
| 4 | Cookie-Banner im Onboarding | „Decline", nicht „Accept" |
| 5 | GitHub-Verknuepfung | **nicht** verknuepfen, separate E-Mail-Anmeldung |
| 6 | `[LEMON SQUEEZY LINK]` / `[SUBSTACK LINK]` Platzhalter | offen, siehe `Gumroad-Footer-Platzhalter.md` |
| 7 | Website-Feld (Organisation) | `https://github.com/0xWrt/fu75ch1-OS` |
| 8 | Product media / Checkout-Cover | 8x PNG 1200x630 laut ToDo erstellt, liegen **ausserhalb** des Vaults. Ablegen unter `01_Architecture\Covers\` |
| 9 | Custom Checkout Fields | geprueft, nicht benoetigt -- bleibt so |

---

## 5. Reihenfolge

1. Im UI pruefen, ob es das Kurzfeld noch gibt (0.1)
2. P1 anlegen, komplett durchziehen, Checkout einmal selbst testen
3. P2-P4 einzeln
4. P5-P8 ueber **Duplicate Product** aus P5 klonen -- identische Struktur
5. P9, P11
6. Nach jedem Produkt: Benefit-Datei selbst herunterladen und oeffnen. Der
   Download ist der Konsument, nicht die Upload-Bestaetigung
