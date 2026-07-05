---
tags: [phase14, rag, anythingllm, mcp, semantic-search, abschluss]
date: 2026-06-24
status: ✅ Abgeschlossen
title: Phase 14 — RAG & Semantische Vault-Suche Abschluss
---

# Phase 14 — RAG & Semantische Vault-Suche Abschluss

## 🎯 Verifikationsergebnis

| Block | Aufgabe | Ergebnis |
|---|---|---|
| A | AnythingLLM Re-Indexierung + API-Key | ✅ Workspace vollständig, API-Key in CredManager |
| B | MCP Tool search_vault(query) | ✅ v1.1.3 in fu75ch1-custom, absoluter curl-Pfad |
| C | Orchestrator RAG-Kontext-Integration | ✅ v1.4, -NoRag Switch verfügbar |
| D | Abschluss + Doku + State Transfer | ✅ 2026-06-24 |

## 🧠 Konzepte & Hintergrund

### Semantische Suche vs. Pfad-basierter Zugriff
`read_vault_note`: Pfad bekannt → Datei lesen (exakte Adresse).
`search_vault`: Frage stellen → semantisch verwandte Chunks aus ~100+ Notizen.
AnythingLLM wandelt alle Notizen in Embedding-Vektoren um.
Bei Suchanfrage: Vektordistanz-Vergleich → Top-K relevanteste Chunks.

### AnythingLLM RAG-Modus
Modus `query` (kein Chat-History-Overhead, nur RAG) statt `chat`.
Workspace "fu75ch1": Obsidian Connector, Built-in Embedder.
Re-Indexierung: Dokument-Count vor (80) → nach (110+) verifiziert.

### MCP Tool search_vault
Neues Tool in fu75ch1-custom MCP-Server.
HTTP POST an AnythingLLM API (localhost:3001), API-Key via Env-Variable.
Absoluter curl-Pfad (C:\Program Files\Git\mingw64\bin\curl.exe)
wegen PATH-Problem in execute_safe_pwsh (Fehler #74).

### Orchestrator RAG-Integration
Invoke-PhaseOrchestrator.ps1 v1.4:
Vor Notiz-Generierung: search_vault(compressed[:300]) → Top-5 Chunks.
Kontext-Injektion in Instructor-Prompt → korrektere Wikilinks, keine Duplikate.
-NoRag Switch für Debugging / Credits sparen.

## 📊 Fehleranalyse

| # | Fehler | Ursache | Lösung |
|---|---|---|---|
| 73 | execute_safe_pwsh kein Output | Multiline-Script via -Command bricht auf Windows | Script via Temp-Datei + -File |
| 74 | search_vault HTML statt JSON | docker exec curl: curl nicht in Node-PATH | Absoluter Pfad C:\Program Files\Git\mingw64\bin\curl.exe |
| 75 | Orchestrator $steps.Count Fehler | PowerShell unboxt List zu Einzelobjekt | @(Get-PhaseSteps ...) |
| 76 | Orchestrator Parser 0 Schritte | Phase14_Plan.md nutzt ## statt ### | Regex ^#{2,3} |
| 77 | Orchestrator Schritt-Regex: nummertierte Listen nicht erkannt | 1. nicht in Pattern | (?:[-*]\|\d+\.) |

## 🔧 PowerShell/Referenz

```powershell
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# AnythingLLM API-Key aus CredManager
$cred = Get-StoredCredential -Target "AnythingLLM_API"
$key  = $cred.GetNetworkCredential().Password
$env:ANYTHINGLLM_API_KEY = $key

# search_vault direkt testen
$headers = @{ "Authorization" = "Bearer $key"; "Content-Type" = "application/json" }
$body = @{ message = "Was ist Governance Level L2?"; mode = "query" } | ConvertTo-Json
(Invoke-RestMethod -Uri "http://localhost:3001/api/v1/workspace/fu75ch1/chat" `
    -Method POST -Headers $headers -Body $body).textResponse

# MCP-Server neu starten (nach Code-Änderung)
# Claude Desktop → Einstellungen → Developer → MCP neu laden
```

## 🔗 Verknüpfte Notizen
- [[Phase14_Plan]]
- [[Phase13_Abschluss]]
- [[Phase11_BlockEH_Abschluss]]
- [[Fehler_Chronologie_Kumulativ]]
- _(internal)_
- _(internal)_

## Graph-Gruppe
phase14
