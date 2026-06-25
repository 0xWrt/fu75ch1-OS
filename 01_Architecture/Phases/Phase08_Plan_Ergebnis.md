---
tags: [phase8, ai-red-teaming, garak, promptfoo, pyrit, plan]
date: 2026-06-21
updated: 2026-06-24
status: 🔄 Block B eval läuft
title: Phase 8 — AI Red Teaming
---

# Phase 8 — AI Red Teaming

## 🎯 Ziel

Eigene Prompts und AI-Workflows systematisch auf Schwachstellen testen:
Prompt Injection, Jailbreak, Data Leakage, Robustheit, I/O-Filter.

## 🧠 Konzept

AI Red Teaming bezeichnet die systematische Angriffssimulation gegen
KI-Systeme — analog zu klassischem Penetration Testing, aber mit
Fokus auf Prompt-Ebene, Modellverhalten und Output-Sicherheit.

## 📋 Voraussetzungen

| Komponente | Version | Status |
|---|---|---|
| Python 3.11 venv | 3.11.9 | ✅ |
| Node.js | v24.16.0 | ✅ |
| npm | 11.13.0 | ✅ |
| Garak | 0.15.1 | ✅ |
| Promptfoo | 0.121.17 | ✅ |
| PyRIT | 0.14.0 | ✅ (venv-pyrit ausstehend) |

> ⚠️ Garak Patch: `top_p` in litellm.py Zeile 161 auskommentieren
> ⚠️ Flags: `--target_type` / `--target_name` statt -m/-n
> ⚠️ `--generations 1` setzen — Anthropic gibt nur 1 Response zurück
> ⚠️ `ANTHROPIC_API_KEY` in Session setzen vor Garak-Aufruf
> ⚠️ Dan_11_0 ist in v0.15.1 inaktiv (tier=9) — Ablation_Dan_11_0 nutzen

## 🔷 Blöcke

### Block 0 — Setup ✅
- Python 3.11 venv: `C:\[USER]\Tools\venv-ai-redteam`
- Garak 0.15.1 + Promptfoo 0.121.17 + PyRIT 0.14.0 installiert
- Datasets-Konflikt: separate venv-pyrit geplant

### Block A — Garak ✅
**Baseline:**

| Run | System-Prompt | Probe | ASR | Datum |
|---|---|---|---|---|
| 1 | Kein System-Prompt | dan.Dan_11_0 | 45.23% | 2026-06-21 |
| 2 | Master-Prompt v4.3 | dan.Dan_11_0 | 43.67% | 2026-06-21 |
| 3 | Master-Prompt v4.4 | Ablation_Dan_11_0 | **15.75%** | 2026-06-22 |
| 4 | Master-Prompt v4.5 | AutoDANCached | **0%** | 2026-06-24 |

> ⚠️ Run 3 nutzt andere Probe als Run 1+2 — eingeschränkte Vergleichbarkeit
> ⚠️ MitigationBypass-Detector: hohe False-Positive-Rate — ASR kritisch bewerten
> ✅ Notiz: [[Garak_Run3_2026-06-22]]

### Block B — Promptfoo 🔄
- redteam.yaml generiert (1365 Tests)
- Eval ausstehend ab 1.7 (Credits)

### Block C — PyRIT ⏳
- Separate venv-pyrit erforderlich (datasets-Konflikt)
- Ausstehend

### Block D — Llama Guard ⏳
- Defer bis Ollama / lokale LLMs verfügbar

### Block E — Abschluss ⏳

## 🔗 Verknüpfte Notizen

- [[Master-Prompt]] _(sanitized)_
- [[Phase8_Block0_Setup]]
- [[Security_Addendum_v1.0]]
- [[Garak_Run3_2026-06-22]]
- _(internal)_
- _(internal)_
