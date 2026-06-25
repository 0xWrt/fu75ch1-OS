---
tags: [phase1, retrospektive, fehleranalyse, verbesserungen]
date: 2026-06-18
status: ✅ Abgeschlossen
phase: Phase 1 — Abschlussprotokoll
tool: PowerShell 7.4.6, Windows Terminal
title: Phase 1 — Retrospektive & Abschlussprotokoll
---

# Phase 1 — Retrospektive & Abschlussprotokoll

## 🎯 Ziel & Kontext
Vollständige Nachbereitung von Phase 1 nach MECE-Prinzip.
Fehlerchronologie, Verbesserungen und Erkenntnisse dokumentiert.

## ✅ Was gut funktioniert hat
- Telemetrie-Deaktivierung auf Dienst- und Registry-Ebene
- Windows Defender verifiziert
- Script Block Logging aktiviert
- Obsidian Vault Grundstruktur aufgebaut
- Linter konfiguriert — Tag-Problem dauerhaft gelöst
- PowerShell Out-File Workflow etabliert

## 🔧 Verbesserungen für künftige Phasen

### Verbesserung 1 — MSI direkt statt winget
```powershell
Invoke-WebRequest -Uri "https://github.com/PowerShell/PowerShell/releases/download/v7.4.6/PowerShell-7.4.6-win-x64.msi" -OutFile "$env:USERPROFILE\Downloads\pwsh7.msi"
Start-Process msiexec.exe -ArgumentList "/i `"$env:USERPROFILE\Downloads\pwsh7.msi`" /quiet" -Verb RunAs -Wait
```

### Verbesserung 2 — Admin-Check als erster Schritt
```powershell
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "❌ Kein Admin-Kontext" -ForegroundColor Red; exit
}
Write-Host "✅ Admin-Kontext bestätigt" -ForegroundColor Green
```

### Verbesserung 3 — Netzwerk-Inventory in Phase 1
```powershell
Get-NetAdapter | Select-Object Name, InterfaceDescription, Status
```

## ⚠️ Fehlerchronologie
| Nr | Fehler | Ursache | Lösung |
|---|---|---|---|
| 1 | Execution Policy Access Denied | Store-App Sandbox | AppxPackage entfernen, MSI installieren |
| 2 | winget: System config not supported | Store-Version registriert | Get-AppxPackage \| Remove-AppxPackage |
| 3 | Start-Process MSI: Keine Zuordnung | Fehlende .msi Zuordnung | msiexec.exe explizit aufrufen |
| 4 | Fehlerhafter Store-Pfad im Terminal | Altes Profil nach Deinstallation | Terminal-Profil korrigieren |
| 5 | Admin-Check False trotz elevated | Falsches pwsh-Profil | pwsh direkt als Admin starten |
| 6 | PcaSvc nicht stoppbar | Geschützter Dienst | Registry Start=4 |
| 7 | Tags ungültig in Obsidian | Einzeilige YAML-Syntax | Linter multi-line konfigurieren |
| 8 | Vault-Pfad geändert | Rename ObsidianVault→fu75ch1 | $vault Variable aktualisiert |

## 🧠 Kernerkenntnisse
- Store-Apps für Admin-Operationen ungeeignet
- Registry-Deaktivierung robuster als Dienst-Deaktivierung
- Admin-Kontext immer als erstes verifizieren
- Vault-Name nie in Skripten hardcoden — Variable verwenden
- Prompt-Hygiene: Beobachtungen nie in Prompt-Text einbauen

## 🔗 Verknüpfte Notizen
- [[Phase1_Block1-2_PowerShell_Setup]]
- [[Phase1_Block3-4_Defender_Telemetrie]]
- [[Phase2_VPN_LeakTest]]
- _(internal)_
