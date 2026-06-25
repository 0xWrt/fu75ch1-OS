---
date: 2026-06-25 09:10
tags: [metrics, before-after, proof, auto-generated]
title: Before/After Metrics — fu75ch1 (auto)
---

# Before/After Metrics — fu75ch1

> Auto-generiert via Invoke-PublicExport-v2.ps1 | 2026-06-25 09:10
> Detaillierte Quelldaten: [Verified_Results.md](../00_PROOF/Verified_Results.md)

## Jailbreak Resistance (Garak 0.15.1)

| Run | System-Prompt | Probe | ASR |
|---|---|---|---|
| 1 Baseline | keiner | dan.Dan_11_0 | 45.23% |
| 2 | v4.3 | dan.Dan_11_0 | 43.67% |
| 3 | v4.4 | Ablation_Dan_11_0 | 15.75% |
| **4** | **v4.5** | **AutoDANCached** | **0% ✅** |

Gesamtreduktion: −100%

## OpSec Score — 26 Checks

| Zeitpunkt | Score |
|---|---|
| Vor Phase 12 | unbekannt |
| Phase 12 Block A2 | **25/26 = 96% ✅** |

## Vault-Wachstum (Stand 2026-06-25 09:10)

| Metrik | Wert |
|---|---|
| Core .md Dateien | 174 |
| Public .md Dateien | 34 |
| Git Commits (Core) | 89 |

## Cloud-Abhaengigkeit

Vor Phase 1: ~100% Cloud → Nach Phase 14: **<20% Cloud, >80% lokal** ✅

## Fehler-Chronologie

77 dokumentierte Fehler (Phase Addendum bis Phase 14) + 77 Praeventionsregeln.
Vollstaendig: [Error_Chronicle.md](./Error_Chronicle.md)