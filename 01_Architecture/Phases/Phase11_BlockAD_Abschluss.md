---
tags: [phase11, llmlingua, langfuse, instructor, langgraph, agentic, docker]
date: 2026-06-22
updated: 2026-06-22
status: 🔄 In Bearbeitung
title: Phase 11 — Block A–D Abschluss
---

# Phase 11 — Block A–D Abschluss

## 🎯 Ziel & Verifikation

| Block | Komponente | Version | Verifikation |
|---|---|---|---|
| A | LLMLingua-2 | latest | 1541→818 Token (52.8%) ✅ |
| B | LangFuse Self-Hosted | 3.194.1 | Trace in UI sichtbar ✅ |
| C | Instructor | 1.15.3 | Pydantic-Modell validiert ✅ |
| D | LangGraph | 1.2.6 | State-Machine 4 Nodes ✅ |

## 🧠 Konzepte & Hintergrund

### LLMLingua-2
Microsoft-Framework zur Prompt-Komprimierung. Entfernt semantisch
redundante Token aus langen Texten via BERT-basiertes Modell
(microsoft/llmlingua-2-bert-base-multilingual-cased-meetingbank).
Chunk-Verarbeitung nötig da Modell max 512 Token pro Chunk verarbeitet.
Wrapper: C:\[USER]\Tools\Invoke-LLMLingua.py

### LangFuse Self-Hosted
Observability-Framework für LLM-Applikationen. Trackt API-Calls mit
Token, Latenz, Kosten, Prompt-Version. Stack: PostgreSQL + ClickHouse
+ MinIO + Redis + langfuse-web + langfuse-worker via Docker Compose.
Compose-Pfad: C:\[USER]\Tools\langfuse\docker-compose.yml
Python SDK: langfuse 4.9.1 — API: get_client() + start_as_current_observation()

### Instructor
Wrapper um Anthropic/OpenAI-API der LLM-Output als typisiertes
Pydantic-Objekt zurückgibt. Kein manuelles JSON-Parsing nötig.
VaultEntry-Modell: title, tags, summary, phase, priority.

### LangGraph
State-Machine Framework für Agentic Loops. Explizite Nodes + Edges +
State-TypedDict. Nodes: pre_process → route → api_call → vault_write → END.
Basis für den vollständigen Agentic Loop in Block G.

## 🔷 PowerShell-Referenz

```powershell
# venv aktivieren
C:\[USER]\Tools\venv-ai-redteam\Scripts\Activate.ps1

# LLMLingua-2 nutzen
python C:\[USER]\Tools\Invoke-LLMLingua.py <pfad> --rate 0.4

# LangFuse Container starten
Set-Location "C:\[USER]\Tools\langfuse"
docker compose up -d
docker compose down

# Container Status
docker ps --format "table {{.Names}}\t{{.Status}}"

# LangFuse URL
# http://localhost:3000
```

## ⚠️ Fehleranalyse & Lösungen

### Fehler: LangFuse S3 Upload schlägt fehl
- **Kategorie:** KONFIGURATION
- **Ursache:** MINIO_ROOT_PASSWORD in .env gesetzt aber S3-Keys noch auf Default
- **Lösung:** LANGFUSE_S3_*_SECRET_ACCESS_KEY explizit in .env setzen
- **Prävention:** Bei Custom-Passwörtern immer alle abhängigen Keys mitsetzen

### Fehler: websockets Konflikt (frida-tools vs langgraph)
- **Kategorie:** ABHÄNGIGKEIT
- **Ursache:** frida-tools erwartet websockets<14, langgraph zieht 15.x
- **Lösung:** Frida in separatem venv betreiben
- **Prävention:** RE-Tools (Frida, Garak) in eigene venvs isolieren

### Fehler: LangFuse 4.x API geändert
- **Kategorie:** API-ÄNDERUNG
- **Ursache:** decorators/trace()/start_as_current_span() nicht mehr vorhanden
- **Lösung:** get_client() + start_as_current_observation(as_type="span")
- **Prävention:** Vor Installation Changelog/Migration-Guide lesen

## 🔗 Verknüpfte Notizen
- [[Phase11_Plan]]
- [[Master-Prompt]] _(sanitized)_
- _(internal)_

## Graph-Gruppe
phase11
