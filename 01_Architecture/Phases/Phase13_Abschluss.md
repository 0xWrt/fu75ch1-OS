---
tags:
  - phase13
  - vault-wachstum
  - n8n
  - memos
  - agentic-loop
  - abschluss
date: 2026-06-24
status: ✅ Abgeschlossen
title: Phase 13 — Kontrolliertes Vault-Wachstum Abschluss
---

# Phase 13 — Kontrolliertes Vault-Wachstum Abschluss

## 🎯 Verifikationsergebnis

| Block | Aufgabe | Ergebnis |
|---|---|---|
| A | 16_AUTO/ Staging-Verzeichnis | ✅ _INBOX, _REVIEW, _REJECTED angelegt |
| B | Memos Webhook-Trigger (n8n) | ✅ Polling-Workflow aktiv (alle 15 Min) |
| C | Agentic Loop Vault-Notiz-Generator | ✅ HTTP-Endpunkt Port 5231, Notiz-Generierung verifiziert |
| D | L2-Kuratierungs-Workflow | ✅ Approve/Reject-Funktionen, Checkliste definiert |
| E | Erster Use Case: Public-Handbuch | ✅ 2026-06-24_Public_Handbuch.md generiert + kuratiert |

## 🧠 Konzepte & Hintergrund

### 16_AUTO/ Schleuse
Automatisch generierte Notizen landen in `16_AUTO/_INBOX/` —
niemals direkt im Vault. L2-Kuratierung verhindert Halluzinationen im Vault.
Dreistufig: _INBOX (ungeprüft) → _REVIEW (in Arbeit) → Vault (freigegeben)
oder _REJECTED (abgelehnt, zur Loop-Analyse behalten).

### Memos als Capture-Layer
Memos v0.29.1 (localhost:5230) als unstrukturierter Input-Kanal.
Tag `#vault` triggert n8n Polling → Agentic Loop.
Nach Verarbeitung: Tag auf `#vault-done` gesetzt (idempotent).
Memos-API v0.29: Bearer Token + `?updateMask=content` bei PATCH (Fehler #68–72).

### Agentic Loop (Port 5231)
Invoke-AgenticLoop.py als Flask-HTTP-Server.
Pipeline: Memos-Text → LLMLingua (falls >500 Wörter) → Instructor + Claude Haiku →
VaultNote Pydantic-Objekt → MCP write_file → 16_AUTO/_INBOX/.
Modell: claude-haiku-4-5-20251001 (günstig für Draft-Generierung).

## 📊 Fehleranalyse

| # | Fehler | Ursache | Lösung |
|---|---|---|---|
| 66 | Memos nicht erreichbar localhost:5230 | Container ohne --restart-Flag | docker update --restart unless-stopped memos |
| 67 | Memos API-Token im Chat exponiert | Notepad als Zwischenspeicher | Direkt KeePassXC → Terminal |
| 68 | Memos GET gibt leeres Array | Bearer Token fehlte | Authorization Header setzen |
| 69 | n8n PATCH: Authorization failed | n8n API Token statt Memos PAT | Memos PAT (memos_pat_...) |
| 70 | n8n PATCH: Bad request | updateMask fehlte | URL: /memos/{id}?updateMask=content |
| 71 | n8n Auth via Credential fehlschlägt | Header nicht korrekt übertragen | Send Headers manuell aktivieren |
| 72 | Memos filter=tag gibt Fehler | AIP-160 unterstützt kein tag-Filter | Client-seitige Filterung |

## 🔧 PowerShell-Referenz

```powershell
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$vault = "$env:USERPROFILE\Documents\fu75ch1"

# 16_AUTO Struktur prüfen/anlegen
@('16_AUTO\_INBOX','16_AUTO\_REVIEW','16_AUTO\_REJECTED') | ForEach-Object {
    $p = Join-Path $vault $_
    if (-not (Test-Path $p)) { New-Item -ItemType Directory -Path $p -Force | Out-Null }
    Write-Host "$(if (Test-Path $p) {'✅'} else {'⚠️'}) $p"
}

# Notiz freigeben
function Approve-VaultNote($file, $targetFolder) {
    $src = Join-Path $vault "16_AUTO\_INBOX\$file"
    $dst = Join-Path $vault "$targetFolder\$file"
    if (Test-Path $src) { Move-Item $src $dst; Write-Host "✅ $file → $targetFolder" }
}

# Memos Container-Restart-Policy
docker update --restart unless-stopped memos
```

## 🔗 Verknüpfte Notizen
- [[Phase13_Plan]]
- [[Phase14_Plan]]
- [[Invoke-AgenticLoop]]
- [[Fehler_Chronologie_Kumulativ]]
- _(internal)_
- _(internal)_

## Graph-Gruppe
phase13
