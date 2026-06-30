---
date: 2026-06-30 15:36
tags: [metrics, before-after, proof, auto-generated]
title: Before/After Metrics — fu75ch1 (auto)
---

# Before/After Metrics — fu75ch1

> Auto-generiert via Invoke-PublicExport-v2.3 | 2026-06-30 15:36
> Details: [Verified_Results.md](../00_PROOF/Verified_Results.md)

## Jailbreak Resistance (Garak 0.15.1)

| Run | System-Prompt | Probe | Stichprobe | ASR |
|---|---|---|---|---|
| 1 Baseline | keiner | dan.Dan_11_0 | klein | 45.23% |
| 2 | v4.3 | dan.Dan_11_0 | klein | 43.67% |
| 3 | v4.4 | Ablation_Dan_11_0 | klein | 15.75% |
| 4 | v4.5 | AutoDANCached | 3 Versuche | 0% (Pilot, nicht repraesentativ) |
| **5** | **v4.5** | **DanInTheWild** | **512 Versuche** | **41.8%** |
| **5** | **v4.5** | **HijackHateHumans** | **512 Versuche** | **9.8%** |

> Run 5 nutzt 512 reale Community-Jailbreaks statt 3 Test-Prompts und zeigt
> damit ein deutlich repraesentativeres Bild der tatsaechlichen Robustheit
> als der fruehere Pilot-Run. Hoehere ASR ist Folge der breiteren, schaerferen
> Stichprobe -- nicht einer Verschlechterung des Systems. Wird bewusst so
> dokumentiert statt nur der beste Einzelwert gezeigt.

## OpSec Score: **26/26 = 100% ✅** (automatisierte Checks, Stand 2026-06-29)

## Cloud-Abhaengigkeit: ~100% → **<20%** ✅ (nach Phase 14)

## Vault (Stand 2026-06-30 15:36)

| Metrik | Wert |
|---|---|
| Core .md Dateien | 188 |
| Public .md Dateien | 41 |
| Git Commits (Core) | 118 |

## Fehler-Chronologie: **94 Eintraege** (nummeriert bis #95, einzelne Nummern historisch konsolidiert), je eine Praeventionsregel pro Eintrag