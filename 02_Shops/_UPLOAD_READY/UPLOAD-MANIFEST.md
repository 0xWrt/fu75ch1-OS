---
date: 2026-07-05
tags: [shops, upload, manifest, checkliste]
status: ✅ v1.0 — zentrale Upload-Steuerung
title: UPLOAD-MANIFEST — alle Beschreibungen & Deliverables an einem Ort
---

# UPLOAD-MANIFEST — zentrale Sondierung

> **Zweck:** Ein Ordner, ein Blick — was ist upload-fertig, wo liegt die Copy,
> was kommt ins Zip. **Bewusst KEINE Datei-Kopien** hier (Single-Source-Regel,
> Fehler-#103-Lektion: jede Kopie ist eine künftige Drift-Quelle). Dieses
> Manifest verweist auf die kanonischen Quellen.
>
> Fertige Zips vor Upload hier ablegen: `02_Shops\_UPLOAD_READY\zips\`
> (Ordner ist per .gitignore vom Repo ausgeschlossen — Bezahlprodukte
> gehören nicht auf GitHub).

---

## Status-Matrix

| Produkt | Store-Copy (EN, kanonisch) | Deliverable-Quelle (Core) | Zip | Status |
|---|---|---|---|---|
| P1 Master-Prompt €9 | `..\Gumroad\Gumroad-P1-Master-Prompt.md` | `00_META\Master-Prompt-v4.7.md` (neutralisierte Fassung) + Addendum v1.1 + Buyer-Setup-Guide + `Verify-GhostMark.py` | 🔶 RE-UPLOAD nötig (Watermark + Verify-Script, Transparenznote-Pflicht) | hochgeladen, unpublished |
| P2 OpSec Checklist €7 | `..\Gumroad\Gumroad-P2-OpSec-Checklist.md` | `10_Workflows\Invoke-OpSecAudit.ps1` + Checklisten-MD | 🔶 RE-UPLOAD nötig (wie P1) | hochgeladen, unpublished |
| P3 Advanced Configs €12 | `..\Gumroad\Gumroad-P3-Advanced-Configs.md` | Ollama/n8n/WireGuard-Configs (Phase-10/11-Bestand) | ⬜ packen | upload-bereit |
| P4 Phase 12 Playbook €14 | `..\Gumroad\Gumroad-P4-Phase12-Playbook.md` | Phase-12-Abschlüsse + Chronik-Auszug | ⬜ packen | upload-bereit |
| P5 Windows Hardening €9 | `..\Gumroad\Gumroad-P5-Windows-Hardening.md` | Phase-1-Guide + Hardening-Scripts | ⬜ packen | upload-bereit |
| P6 DNS/VPN Guide €7 | `..\Gumroad\Gumroad-P6-DNS-VPN-Guide.md` | Phase-2-Guide + Watchdog-Script | ⬜ packen | upload-bereit |
| P7 Browser Hardening €7 | `..\Gumroad\Gumroad-P7-Browser-Hardening.md` | Phase-3-Guide + user.js/Configs | ⬜ packen | upload-bereit |
| P8 KeePass Blueprint €7 | `..\Gumroad\Gumroad-P8-KeePass-Blueprint.md` | KeePass-Konzept-MD + Load-Snippets | ⬜ packen | upload-bereit |
| P9 Tool Stack Guide €12 | `..\Gumroad\Gumroad-P9-Tool-Stack-Guide.md` | Tool-Stack-MD (inkl. Rejected-Sektion) | ⬜ packen | upload-bereit |
| **P10 Blueprint €29 EB/€49** | `..\Gumroad\Gumroad-P10-Blueprint.md` | **Zip-Manifest steht in der Copy-Datei** (kompletter Vault-Export) | ⬜ packen — Early-Bird-Discount-Code, Limit 50 | Copy fertig |
| Whop-Bundle P1+P2 €19 | P1+P2-Copy kombinieren, Bundle-Framing lt. Launch_Plan | identisch P1+P2 | ⬜ | nach Gumroad-Sprint |
| Lead-Magnet Sampler (frei) | `..\LeadMagnets\Error-Chronicle-Sampler.md` | Datei selbst = Deliverable (watermark-frei) | — | fertig |
| Lead-Magnet QuickCheck (frei) | `..\LeadMagnets\Invoke-OpSecQuickCheck.ps1` | Datei selbst = Deliverable | — | fertig, getestet 5/5 |

Polar (⏸ pausiert): Copy-Dateien in `..\Polar\P1–P9` sind fertig + gewatermarkt — kein Handlungsbedarf bis Reaktivierung.
Lemon Squeezy (Woche 2): nutzt P10-Copy 1:1, Checkliste in `..\LemonSqueezy\LemonSqueezy-Setup.md`.

## Upload-Reihenfolge (72h-Sprint)

1. **P1+P2 Re-Upload** — gewatermarkte Dateien + `Verify-GhostMark.py` (Transparenznote in der Copy behauptet das bereits!)
2. **P10 Blueprint** — Flaggschiff ZUERST live, dann Rest (Footer aller Produkte verlinken auf `/l/blueprint`)
3. P3–P9 nach `..\Gumroad\Gumroad-Upload-Guide.md`
4. Pro Produkt: Cover + Screenshots nach `..\Produkt-Uebersicht.md` (PII-Regeln!)
5. Nach JEDEM Upload: Live-Seite gegen Copy-Datei diffen (Copy ist kanonisch)

## Regeln

- Zips: Watermark-Stand prüfen (`Verify-GhostMark.py` gegen jede MD im Zip), keine Klartext-Pfade/Hostnamen in gepackten Dateien
- Zahlen in Copy vor Upload: `Invoke-MetricsCheck.ps1` muss grün sein
- `zips\` bleibt lokal (gitignore) — nur Beschreibungen sind öffentlich, nie Deliverables
