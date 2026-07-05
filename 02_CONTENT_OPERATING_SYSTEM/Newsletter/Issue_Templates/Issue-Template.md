---
date: 2026-07-04
tags: [newsletter, substack, template]
status: ✅ Template v1.0
title: Substack Issue-Template
---

# Issue-Template (Substack, 500–800 Wörter, EN)

> Rhythmus: Montag schreiben (45 min), Freitag publizieren. Ein Issue = eine Story,
> ein technischer Kern, ein Takeaway. Kein Rundumschlag.

---

## Struktur

**Titel:** konkret + leicht schief (Neugier), max 60 Zeichen.
Muster: "The [thing] that [unexpected behavior]" — wie die Sampler-Headlines.

**1. Hook (2–3 Sätze):** Das Symptom, so wie es sich angefühlt hat. Kein Kontext, kein Setup — direkt der Moment, in dem etwas kaputt war.

**2. Kontext (1 Absatz):** Was fu75ch1 ist, in einem Satz für Neue ("a local-first AI OS, built solo, every mistake numbered") + wo im System das Problem saß.

**3. Der technische Kern (2–4 Absätze):** Root Cause, mit echtem Befehl/Config-Ausschnitt. Genau EIN Code-Block. Zahlen konkret (RAM, Ports, Fehlercodes).

**4. Die Prävention-Regel (1 Absatz, fett):** Die eine Regel, die der Leser mitnimmt — wörtlich aus der Fehler-Chronik.

**5. Ehrlichkeits-Moment (optional, 1–2 Sätze):** Was immer noch nicht gelöst ist / was der Fix NICHT abdeckt. Das ist der Marken-Kern — nie weglassen, wenn es einen gibt.

**6. Footer (fix):**
- "Error #N of 103+ — full chronicle ships with [The Blueprint](https://fu75ch1.gumroad.com/l/blueprint) (€29 Early Bird)."
- Free sampler: Link Error-Chronicle-Sampler
- Repo: github.com/0xWrt/fu75ch1-OS

## Regeln
- Zahlen vor Versand gegen `00_META\metrics.json` prüfen (`Invoke-MetricsCheck.ps1`)
- Kein Hostname, kein Pfad, kein Key in Code-Blöcken (PIIScrubber-Blick)
- Ein CTA pro Issue, nicht drei

© fu75ch1 — intern
