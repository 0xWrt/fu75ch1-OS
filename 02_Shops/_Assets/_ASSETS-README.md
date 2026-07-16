---
date: 2026-07-05
tags: [assets, marketing, screenshots, svg]
status: ✅ v1.0 — 3 Terminal-Cards fertig, GUI-Shots offen
title: Marketing-Assets — Terminal-Cards (echt) + Screenshot-Restliste
---

# Marketing-Assets

> **Prinzip:** Alle Terminal-Cards hier basieren auf **echten Script-Outputs**
> (ausgeführt 2026-07-05 auf dem Produktivsystem) — nichts ist gemockt, Zahlen
> stammen aus den realen Läufen. PII-frei by design.

## Fertige SVG-Cards (1280×720, dark)

| Datei | Inhalt | Einsatz |
|---|---|---|
| `P2_opsec_audit_35of38.svg` | Echter Audit-Lauf, 35/38 inkl. sichtbarem [X] Check 29 | P2-Cover/Screenshot, Post 2, README |
| `LeadMagnet_quickcheck_5of5.svg` | Echter QuickCheck-Lauf 5/5 | Lead-Magnet-Promo, X-Posts |
| `P10_metricscheck_gate_green.svg` | **STALE (2026-07-14)** -- zeigt Errors 103 / OpSec 35/38 / ASR 38.43%; alle drei ueberholt (118 / 37/38 / ASR zurueckgezogen). NEU ERZEUGEN aus echtem Lauf, NICHT von Hand umschreiben. |

**Warum das [X] in der P2-Card drin bleibt:** Ein Audit-Screenshot mit sichtbarem
Fehlschlag ist glaubwürdiger als 34× grün — er zeigt, dass das Tool wirklich prüft.
Exakt die Markenlinie (38.43% statt 0%).

## SVG → PNG (für Gumroad/X)

- Schnell: SVG im Browser öffnen → Screenshot, oder
- Sauber: `inkscape P2_opsec_audit_35of38.svg -o P2_cover.png -w 1280 -h 720`
  (alternativ: jeder Online-Konverter — Dateien enthalten keine sensiblen Daten)

## Noch manuell nötig (GUI, siehe `..\Produkt-Uebersicht.md` für Details + PII-Regeln)

- [ ] Streamlit-Dashboard (localhost:8501) — wichtigster Shot, auch fürs README-TODO
- [ ] Obsidian: Vault-Struktur (P10) + Master-Prompt-Gliederung (P1)
- [ ] Fehler-Chronik-Scroll (P10, "this is 115 documented mistakes")
- [ ] KeePassXC Demo-DB (P8 — NUR Demo-Einträge!)
- [ ] n8n Workflow-Canvas (P3)

## Regeln

- Neue Cards: nur aus echten, verifizierten Outputs bauen — nie Zahlen erfinden
- Vor jeder neuen Card: `Invoke-MetricsCheck.ps1` grün
- Bei Zahlenaenderung (z.B. OpSec-Fix -> 37/38): Cards regenerieren, alte loeschen. NIE Zahlen im SVG von Hand editieren -- Screenshots muessen echte Laeufe zeigen.
