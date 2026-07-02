---
date: 2026-07-01
tags: [gumroad, launch, platzhalter, checkliste, cross-promotion]
title: Gumroad Footer — Offene Platzhalter (alle 9 Produkte)
---

# Gumroad Footer — Offene Platzhalter

> Kontext: In allen 9 Produkt-Listing-Dateien wurde ein CTA + Cross-Promotion-
> Footer ("GET THE FULL SYSTEM") nach der Listing-Guideline ergänzt
> (Struktur: Problem→Solution→Contents→Value→CTA + Cross-Links).
> Zwei Platzhalter sind noch offen, weil die Ziel-URLs noch nicht existieren.

---

## Platzhalter 1: `[LEMON SQUEEZY LINK]`

**Ersetzen mit:** Live-URL des Lemon Squeezy Blueprint-Produkts (€29 Early Bird),
sobald angelegt (StateTransfer v34, Prio 1).

**Betroffen — genau 1x pro Datei:**

| Datei | Zeile (Kontext) |
|---|---|
| `Gumroad-P1-Master-Prompt.md` | `- **Full system (all 15 phases):** [LEMON SQUEEZY LINK] — €29 Early Bird` |
| `Gumroad-P2-OpSec-Checklist.md` | „ |
| `Gumroad-P3-Advanced-Configs.md` | „ (Produkt selbst HELD — Link trotzdem vorbereitet) |
| `Gumroad-P4-Phase12-Playbook.md` | „ |
| `Gumroad-P5-Windows-Hardening.md` | „ |
| `Gumroad-P6-DNS-VPN-Guide.md` | „ |
| `Gumroad-P7-Browser-Hardening.md` | „ |
| `Gumroad-P8-KeePass-Blueprint.md` | „ |
| `Gumroad-P9-Tool-Stack-Guide.md` | „ |

---

## Platzhalter 2: `[SUBSTACK LINK]`

**Ersetzen mit:** URL der Substack-Publikation, sobald Account + Issue #1 live
(StateTransfer v34, Prio 2 — erst NACH Lemon Squeezy).

**Betroffen — genau 1x pro Datei:** dieselben 9 Dateien wie oben, Zeile:
`- **Weekly build notes:** [SUBSTACK LINK]`

---

## Bereits live — kein Platzhalter noetig

- `fu75ch1.gumroad.com` (Store-Link) — bereits korrekt in allen 9 Dateien
- `github.com/0xWrt/fu75ch1-OS` — bereits korrekt in allen 9 Dateien

---

## Reihenfolge (aus StateTransfer v34)

1. Lemon Squeezy anlegen → URL notieren
2. Alle 9x `[LEMON SQUEEZY LINK]` ersetzen (Batch-Ersetzung moeglich, siehe unten)
3. Substack Account + Issue #1 posten → URL notieren
4. Alle 9x `[SUBSTACK LINK]` ersetzen

## Batch-Ersetzung (PowerShell, sobald beide URLs feststehen)

```powershell
$root = "$env:USERPROFILE\Documents\fu75ch1_public\01_Architecture"
$lsUrl = "HIER_LEMON_SQUEEZY_URL_EINTRAGEN"
$subUrl = "HIER_SUBSTACK_URL_EINTRAGEN"

Get-ChildItem $root -Filter "Gumroad-P*.md" | ForEach-Object {
    (Get-Content $_.FullName -Raw) `
        -replace [regex]::Escape('[LEMON SQUEEZY LINK]'), $lsUrl `
        -replace [regex]::Escape('[SUBSTACK LINK]'), $subUrl |
        Set-Content $_.FullName -NoNewline
    Write-Host "aktualisiert: $($_.Name)"
}
```

> Vorher immer `-WhatIf`-Analog pruefen: Skript zuerst gegen eine Kopie testen
> oder Git-Diff nach dem Lauf kontrollieren (Rollback via `git checkout`).

---

## Weitere offene `[LINK]`-Platzhalter (bisher nicht getrackt)

Zusätzlich zu den 18 Stellen oben gibt es generische `[LINK]`-Platzhalter in
zwei weiteren Dateien (je 2x vorhanden: public + core), noch **nicht** ersetzt,
Lemon-Squeezy-Link bewusst offen gelassen bis Produkt live ist:

| Datei | Zeile | Kontext |
|---|---|---|
| `SUBSTACK_Newsletter.md` | Issue #1 | `Early Bird: €29 → [LINK]` |
| `SUBSTACK_Newsletter.md` | Issue #2 | `→ [LINK] — Early Bird €29` |
| `SUBSTACK_Newsletter.md` | Issue #3 | `→ Gumroad [LINK] — €9` |
| `SUBSTACK_Newsletter.md` | Issue #3 | `→ Or included in The Blueprint [LINK] — €29 Early Bird` |
| `GUMROAD_Products.md` | Cross-Selling-Checkliste | `"Full system → The Blueprint [LINK]"` |

Alle diese `[LINK]`-Stellen sind faktisch dasselbe wie `[LEMON SQUEEZY LINK]`
oben (bzw. `fu75ch1.gumroad.com` für die Gumroad-Verweise) — nur mit anderer
Schreibweise, weil sie vor der Standardisierung des Platzhalter-Namens entstanden
sind. Beim finalen Batch-Replace mit erfassen, oder Schreibweise vorher
vereinheitlichen auf `[LEMON SQUEEZY LINK]`.

## Verknüpfte Notizen
- [[Gumroad-Upload-Guide]]
- [[GUMROAD_Products]]
- [[StateTransfer_v34_2026-07-01]]
- [[Offene_Punkte_ToDo]]
