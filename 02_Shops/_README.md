---
tags: [meta, shops, struktur, navigation]
date: 2026-07-03
status: aktiv
title: 02_Shops — Übersicht Verkaufskanäle
---

# 02_Shops — Übersicht

Diese Kategorie buendelt **ausschliesslich shop-/plattformspezifische Inhalte**
(Produktbeschreibungen, Setup-Notizen, Checkout-Copy). `01_Architecture`
bleibt bewusst plattformneutral — dort liegen nur gemeinsam genutzte
Quelldateien (z. B. der kanonische `Master-Prompt-v4.7.md`, Configs, Phase-
Dokumentation), auf die mehrere Shops verweisen koennen, ohne dass der
Kern-Vault mit einem einzelnen Shop-Namen "gebrandet" wird.

## Struktur

```
02_Shops/
├── Gumroad/     — Live-Kanal, 9 Produktbeschreibungen + Upload-Guide
└── Polar/       — Vorbereiteter Kanal, 9 neutralisierte + watermarkte
                    Produktbeschreibungen + Setup-Dokument
```

## Gumroad

Enthaelt die 9 Original-Produktbeschreibungen (`Gumroad-P1` bis `Gumroad-P9`),
so wie sie live auf `fu75ch1.gumroad.com` verwendet werden — inkl. der dort
korrekten Gumroad-Verlinkung ("Buy now on Gumroad", gumroad.com-Querverweis).
Diese Referenzen sind für Gumroad **richtig** und werden nicht neutralisiert.

Zusaetzlich: `Gumroad-Upload-Guide.md`, `Gumroad-Footer-Platzhalter.md`,
`Gumroad-Copy-P4-P9-DRAFT.md` (fruehe Entwurfsversion, archiviert).

## Polar

Enthaelt die 9 plattformneutralen, watermarkten Produktbeschreibungen
(`Polar-P1` bis `Polar-P9`) — keine Gumroad-Referenzen, keine
Cross-Promotion-Links zu Gumroad, dafuer ein unsichtbarer Ghost-Mark pro
Datei (siehe `Verify-GhostMark.py`).

Setup-Dokument: `Polar-Produkte-Setup.md` (Kurzbeschreibungen auf das
42-Zeichen-Limit von Polar angepasst, Metadaten ohne "gumroad"-Referenzen).
Vorversion archiviert als `Polar-Produkte-Setup-v1-2026-07-02-ARCHIV.md`.

## Geteilte Quelldatei

`fu75ch1_public\01_Architecture\Master-Prompt-v4.7.md` ist die einzige
kanonische Fassung des Master-Prompts fuer Kaeufer (frueher
`Master-Prompt-v4.7-Gumroad.md`, umbenannt und Frontmatter-Tag "gumroad"
entfernt am 2026-07-03). Beide Shops referenzieren dieselbe Datei als
File-Download-Benefit fuer Produkt 1 — keine Duplikate, keine Drift-Gefahr.

## Naechster Shop

Bei einem weiteren Verkaufskanal (z. B. Lemon Squeezy, Whop): eigenen
Unterordner `02_Shops\<Name>\` anlegen, Copy aus den bestehenden Polar- oder
Gumroad-Dateien ableiten (je nachdem, ob Cross-Promotion-Verweise zu anderen
Shops erwuenscht sind oder nicht), Ghost-Mark-Schema aus `Polar\Verify-GhostMark.py`
wiederverwenden.
