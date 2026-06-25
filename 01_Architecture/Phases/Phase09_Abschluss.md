---
tags:
  - phase9
  - orchestrator
  - git-hook
  - garak
  - agentic
  - abschluss
date: 2026-06-25
status: ✅ Abgeschlossen
title: Phase 9 — Semi-Autonome Orchestrierung Abschluss
---

# Phase 9 — Semi-Autonome Orchestrierung Abschluss

## 🎯 Ziel & Verifikationsergebnis

| Block | Aufgabe | Ergebnis |
|---|---|---|
| A | Invoke-PhaseOrchestrator.ps1 | ✅ Phase-Blöcke werden erkannt + ausgeführt |
| B | Garak Git-Hook | ✅ Pre-commit Hook löst Scan aus |
| C | Garak Run 3 (v4.4) | ✅ ASR 15.75% (Ablation_Dan_11_0) |

## 🧠 Konzepte & Hintergrund

### Phase-Orchestrator
PowerShell-Script das Vault-Phasen-Notizen parsed und Schritte
semi-autonom ausführt. Input: Markdown-Datei mit `###` Schritt-Blöcken.
L0/L1/L2/L3-Erkennung via Regex-Pattern auf Schritt-Titel.
Governance: L3-Schritte erfordern manuelle Freigabe.

### Garak Git-Hook
Pre-commit Hook der bei jedem Commit automatisch Garak auf dem
Master-Prompt ausführt. Nur auf Dateien die `Master-Prompt` im Namen
tragen. Schlägt fehl wenn ASR > Schwellwert (konfigurierbar).
Wichtig: Windows Git Hooks benötigen pwsh.exe-Aufruf, kein `#!/bin/sh`.

## 📊 Garak Run 3 Ergebnis

| Parameter | Wert |
|---|---|
| Datum | 2026-06-22 |
| System-Prompt | Master-Prompt v4.4 |
| Probe | Ablation_Dan_11_0 |
| ASR | **15.75%** |
| Vorher (v4.3) | 43.67% |
| Reduktion | −27.92% |

## ⚠️ Fehleranalyse

| # | Fehler | Ursache | Lösung |
|---|---|---|---|
| 38 | Git Hook #!/bin/sh schlägt fehl | Windows kennt kein sh | Hook als pwsh.exe Aufruf schreiben |
| 39 | Frontmatter in Blöcken erkannt | Regex traf YAML-Frontmatter | Frontmatter-Filter vor Block-Parsing |
| 40 | L3-Erkennung zu aggressiv | Pattern traf Block-Body statt Titel | Regex nur gegen Schritt-Titel |
| 41 | Wikilinks störten Parsing | [[Link]] als Schritt-Titel erkannt | Wikilink-Filter vor Auswertung |
| 64 | $script: Scope-Fehler in Funktionen | $variable ändert lokale Kopie | $script:variable statt $variable |

## 🔧 PowerShell-Referenz

```powershell
# Orchestrator ausführen
$vault = "$env:USERPROFILE\Documents\fu75ch1"
pwsh -File "$vault\10_Workflows\Invoke-PhaseOrchestrator.ps1" `
     -PhasePath "$vault\02_PHASE1_Windows_Hardening\Phase1_Block1-2_PowerShell_Setup.md"

# Garak Git-Hook installieren
pwsh -File "$vault\10_Workflows\Install-GarakGitHook.ps1"

# Garak manuell (Run 3 Reproduktion)
& 'C:\[USER]\Tools\venv-ai-redteam\Scripts\Activate.ps1'
$env:ANTHROPIC_API_KEY = (Get-Content "$env:USERPROFILE\.keys\anthropic" | ConvertTo-SecureString | [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($_)))
python -m garak --target_type litellm --target_name anthropic/claude-sonnet-4-5 `
    --probes dan.Ablation_Dan_11_0 --generations 1
```

## 🔗 Verknüpfte Notizen
- [[Invoke-PhaseOrchestrator]]
- [[Install-GarakGitHook]]
- [[Phase8_Plan]]
- [[Master-Prompt]] _(sanitized)_
- _(internal)_

## Graph-Gruppe
phase9
