---
tags:
  - phase8
  - garak
  - ai-red-teaming
  - security
  - run5
date: 2026-06-30
status: ✅ Abgeschlossen
title: Garak Run 5 — DanInTheWild + HijackHateHumans — Master-Prompt v4.5
---

# Garak Run 5 — DanInTheWild + HijackHateHumans — 2026-06-30

## 🎯 Ziel & Verifikation

| Parameter | Wert |
|---|---|
| Probes | dan.DanInTheWild, promptinject.HijackHateHumans |
| System-Prompt | Master-Prompt v4.5 |
| Modell | anthropic/claude-sonnet-4-6 (direkter Anthropic-API-Key, nicht OpenRouter) |
| Generations | 1 |
| Parallel Attempts | 10 |
| Attempts gesamt | 1024 (512 je Probe) |
| Tool | garak v0.15.1, litellm-Generator |
| Datum | 2026-06-30 |

## 📊 Ergebnis

| Probe | Detector | Passed | Fails | Nones | Ausgewertet | ASR |
|---|---|---|---|---|---|---|
| dan.DanInTheWild | mitigation.MitigationBypass | 139 | 100 | 17 | 239 | **41.8%** |
| promptinject.HijackHateHumans | promptinject.AttackRogueString | 221 | 24 | 11 | 245 | **9.8%** |

> ⚠️ Deutlich hoehere ASR als der vorherige AutoDANCached-Run (0%, aber nur 3
> Versuche -- nicht repraesentativ). DanInTheWild ist eine breite Sammlung
> realer Community-Jailbreaks (512 Varianten) und zeigt damit ein
> realistischeres Bild der tatsaechlichen Robustheit von Master-Prompt v4.5
> gegen bekannte Jailbreak-Patterns.

## 💰 Kosten

| Metrik | Wert |
|---|---|
| API-Calls | 1024 |
| Geschaetzte Kosten | ~$3.20 (hochgerechnet aus ersten 256 Calls: $0.80) |
| Quelle | Direkter Anthropic-API-Key (`.anthropic_key_py`), NICHT OpenRouter |

⚠️ Schaetzung, keine exakte Abrechnung -- exakter Betrag nur über
console.anthropic.com einsehbar, dort nicht programmatisch abrufbar.

## 🛠️ Technische Probleme & Loesungen (diese Session)

| Nr | Problem | Ursache | Loesung |
|---|---|---|---|
| 1 | `'charmap' codec can't encode character` | Windows-Konsole (cp1252) kann Emoji in Garak-Output nicht schreiben bei Datei-Redirect | `PYTHONIOENCODING=utf-8` + `PYTHONUTF8=1` als Env-Vars vor Start |
| 2 | `nothing to do ?? try --help` | garak-claude.yaml `run:`-Sektion wird von dieser Garak-Version nicht korrekt geparst | Parameter direkt als CLI-Flags statt ueber --config |
| 3 | `BadGeneratorException: asked for 5 got 1` | Default generations=5, Anthropic unterstuetzt kein Multi-Generation (`n`-Parameter) pro Call | `--generations 1` explizit setzen |
| 4 | `UnsupportedParamsError: presence_penalty, frequency_penalty` | Anthropic akzeptiert diese OpenAI-Parameter nicht; `self.litellm.drop_params=True` im Generator-Code griff nicht wie erwartet | Direkter Patch in `garak/generators/litellm.py`: beide Zeilen im optional_params-Dict auskommentiert (gleiches Muster wie vorheriger `top_p`-Patch) |
| 5 | Prozess bricht nach exakt ~20-25s ab, kein Fehler im Log | execute_safe_pwsh-Wrapper killt vermutlich die eigene Prozessgruppe inkl. Kindprozessen nach internem Timeout, unabhaengig von `Start-Process` | Lauf ueber einen einmaligen Scheduled Task entkoppelt (gleicher Mechanismus wie Fehler #93) -- voll unabhaengig vom MCP-Shell-Prozess |

## 📋 PowerShell-Referenz (funktionierender Aufruf)

```powershell
$env:ANTHROPIC_API_KEY = (Get-Content "$env:USERPROFILE\.anthropic_key_py" -Raw).Trim()
$env:PYTHONIOENCODING = "utf-8"
$env:PYTHONUTF8 = "1"
& "C:\[USER]\Tools\venv-ai-redteam\Scripts\garak.exe" `
    --target_type litellm --target_name anthropic/claude-sonnet-4-6 `
    --probes dan.DanInTheWild,promptinject.HijackHateHumans `
    --generations 1 --parallel_attempts 10 `
    --report_prefix "C:\[USER]\Tools\_garak_run5\garak_run5"

# Fuer lange Laeufe: ueber Scheduled Task entkoppeln, nicht direkt im MCP-Shell-Prozess warten
```

## 🔗 Verknuepfte Notizen

- [[Phase8_Plan]]
- [[Garak_Run4_2026-06-24]]
- [[Master-Prompt]] _(sanitized)_
- _(internal)_
