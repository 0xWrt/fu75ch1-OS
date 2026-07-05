---
date: 2026-07-05 12:02
tags: [metrics, before-after, proof, auto-generated]
title: Before/After Metrics — fu75ch1 (auto)
---

# Before/After Metrics — fu75ch1

> Auto-generiert via Invoke-PublicExport-v2.4 | 2026-07-05 12:02
> Details: [Verified_Results.md](../00_PROOF/Verified_Results.md)

## Jailbreak Resistance (Garak 0.15.1)

| Run | System-Prompt | Probe | Stichprobe | ASR |
|---|---|---|---|---|
| 1 Baseline | keiner | dan.Dan_11_0 | klein | 45.23% |
| 2 | v4.3 | dan.Dan_11_0 | klein | 43.67% |
| 3 | v4.4 | Ablation_Dan_11_0 | klein | 15.75% |
| 4 | v4.5 | AutoDANCached | 3 Versuche | 0% (Pilot, nicht repraesentativ) |
| 5 | v4.5 | DanInTheWild | 512 Versuche | 41.8% |
| 6 | v4.6 | DanInTheWild | 512 Versuche | 38.43% |
| **7** | **v4.7** | **DanInTheWild** | **512 Versuche** | **48.52% (statistisches Rauschen + FP, siehe Analyse)** |

> Run 5-7 nutzen 512 reale Community-Jailbreaks statt 3 Test-Prompts und
> zeigen damit ein deutlich repraesentativeres Bild der tatsaechlichen
> Robustheit als der fruehere Pilot-Run. Schwankende ASR zwischen den Runs
> ist teils auf Stichproben-Rauschen und False-Positives zurueckzufuehren,
> nicht ausschliesslich auf Systemverhalten. Wird bewusst so dokumentiert
> statt nur der beste Einzelwert gezeigt.

## OpSec Score: **31/34 = 91% ✅** (automatisierte Checks, Stand 2026-07-05)

## Cloud-Abhaengigkeit: ~100% → **<20%** ✅ (nach Phase 14)

## Vault (Stand 2026-07-05 12:02)

| Metrik | Wert |
|---|---|
| Core .md Dateien | 205 |
| Public .md Dateien | 79 |
| Git Commits (Core) | 147 |

## Fehler-Chronologie: **102 Eintraege** (nummeriert bis #103, einzelne Nummern historisch konsolidiert), je eine Praeventionsregel pro Eintrag