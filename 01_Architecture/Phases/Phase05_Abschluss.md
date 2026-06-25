---
tags: [phase5, appsec, gitleaks, psscriptanalyzer, sast]
date: 2026-06-19
status: ✅ Abgeschlossen
title: Phase 5 — AppSec Abschluss
---

# Phase 5 — AppSec Abschluss

## Ziel
Statische Code-Analyse und Secret-Scanning für den Vault und alle
PowerShell-Skripte etablieren.

## Ergebnis

| Komponente | Version | Status | Details |
|---|---|---|---|
| gitleaks | 8.30.1 | ✅ | Secret-Scanner, Git-History + Pre-commit Hook |
| PSScriptAnalyzer | 1.25.0 | ✅ | SAST für PS1-Skripte, Suppress-Config gesetzt |
| Semgrep | — | ⏳ | Phase 11 (Python/JS, Custom API-Workflow) |

## gitleaks

- Binary: `C:\[USER]\Scripts\gitleaks.exe`
- PATH: `C:\[USER]\Scripts` permanent gesetzt
- Git-History-Scan: 19 Commits, 2.74 MB — keine Secrets gefunden ✅
- Pre-commit Hook: `.git\hooks\pre-commit` aktiv

## PSScriptAnalyzer

- Suppress-Config: `10_Workflows\PSScriptAnalyzer.psd1`
- Supprimiert: PSAvoidUsingWriteHost, PSUseBOMForUnicodeEncodedFile,
  PSAvoidUsingCmdletAliases (False Positive — PS-Prompts in Strings)
- Fixes durchgeführt:
  - Write-Log → Write-VPNLog (4 Skripte)
  - Invoke-PIIScrubber: begin{}/process{} Block ergänzt (Pipeline-Fix)

## Fixes dieser Phase

| Datei | Fix | Regel |
|---|---|---|
| vpn_watchdog.ps1 | Write-Log → Write-VPNLog | PSAvoidOverwritingBuiltInCmdlets |
| Diagnose-VPN-VBox*.ps1 (3x) | Write-Log → Write-VPNLog | PSAvoidOverwritingBuiltInCmdlets |
| Invoke-PIIScrubber.ps1 | begin{}/process{} ergänzt | PSUseProcessBlockForPipelineCommand |
| Invoke-AnthropicCached.ps1 | Master-Prompt v4.1 → v4.2 | PFAD (Fehler Nr. 21) |

## Scan-Befehl (reproduzierbar)

```powershell
$vault = "$env:USERPROFILE\Documents\fu75ch1"
$cfg   = "$vault\10_Workflows\PSScriptAnalyzer.psd1"

@(Get-ChildItem "$vault\10_Workflows" -Filter "*.ps1"
  Get-ChildItem "C:\[USER]\Scripts"  -Filter "*.ps1") |
    ForEach-Object { Invoke-ScriptAnalyzer -Path $_.FullName -Settings $cfg -Severity Warning,Error }

gitleaks git --report-format json --report-path "C:\[USER]\Logs\gitleaks-scan.json"
```

## Verknüpfte Notizen
- [[Master-Prompt]] _(sanitized)_
- _(internal)_
- _(internal)_
- [[Phase4_Abschluss]]
