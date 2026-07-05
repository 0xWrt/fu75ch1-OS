---
date: 2026-07-04
tags: [shops, lemonsqueezy, blueprint, woche2]
status: 🔜 Woche 2 — vorbereitet, bewusst nicht im 72h-Sprint
title: Lemon Squeezy — Setup-Plan (Blueprint-Zweitkanal)
---

# Lemon Squeezy — Setup-Plan

> **Single-Source-Regel:** Die Produkt-Copy für den Blueprint lebt in
> `02_Shops\Gumroad\Gumroad-P10-Blueprint.md` (DESCRIPTION/DETAILS-Sektionen).
> Diese Datei hier enthält NUR die LemonSqueezy-spezifischen Abweichungen und
> die Setup-Checkliste. Keine Copy-Duplikate anlegen — das war die Drift-Ursache
> der letzten Woche (siehe Fehler #103-Kontext).

---

## Warum Lemon Squeezy als Zweitkanal (Woche 2)

- Besserer Checkout-Flow als Gumroad, EU-VAT-Handling automatisch (Merchant of Record)
- Blueprint launcht ZUERST auf Gumroad (P10, im 72h-Sprint) — LemonSqueezy zieht nach,
  sobald ein Traffic-Signal da ist. Kein Warten auf die "richtige" Plattform.
- Preis identisch: €49 Basis, Early-Bird €29 — **Early-Bird-Kontingent (50) gilt
  kanalübergreifend**: vor Aktivierung Gumroad-Verkaufszahl prüfen und Restkontingent
  als Discount-Limit setzen.

## Setup-Checkliste (Woche 2, ~1h)

- [ ] Store anlegen: Name `fu75ch1`, anonyme Bio aus `00_META\Platform_Bios.md`
- [ ] Produkt "The fu75ch1 Blueprint" — Copy 1:1 aus `Gumroad-P10-Blueprint.md`
      (SUMMARY → Tagline, DESCRIPTION → Beschreibung, DETAILS → Beschreibung Teil 2)
- [ ] Identisches Zip wie Gumroad-P10 hochladen (gleiche Datei, gleicher Ghost-Mark-Stand)
- [ ] Preis €49 + Discount-Code Early-Bird €29, Limit = 50 minus bereits verkaufte
      Gumroad-Early-Birds
- [ ] Footer-Links: GitHub-Repo + Gumroad-Store (Einzelprodukte bleiben Gumroad-only)
- [ ] Transparenznote (Ghost-Mark) übernehmen — steht in der P10-Copy
- [ ] Nach Livegang: README-Blueprint-Link um LemonSqueezy-Option ergänzen
      (beide Kanäle nennen, Käufer wählt Checkout)
- [ ] `Invoke-MetricsCheck.ps1` laufen lassen (products_live-Zähler in metrics.json anpassen)

## Bewusst NICHT

- Einzelprodukte P1–P9 auf LemonSqueezy spiegeln (doppelter Pflegeaufwand, kein Mehrwert)
- Eigene LemonSqueezy-Sales-Copy pflegen (Single-Source-Regel oben)

© fu75ch1 — intern
