---
tags:
  - phase15
  - n8n
  - agentic-loop
  - memos
  - workflow
  - automation
date: 2026-06-24
status: ✅ Produktionsreif
title: Phase 15 Block C — n8n Memos Vault Pollingv2 Optimierung
---

# Phase 15 Block C — n8n Memos Vault Pollingv2 — 2026-06-24

## 🎯 Ziel & Ergebnis

Vollständige End-to-End Pipeline:

```
Memos (#vault Tag) → n8n Poll → Filter → AgenticLoop → 16_AUTO/_INBOX/ → Memos (#vault-done)
```

Status: ✅ Produktionsreif, Published, läuft stabil (~1 Minute Polling-Intervall)

## 🔷 Workflow-Architektur

| Node | Typ | Funktion |
|---|---|---|
| Schedule Trigger | Timer | Pollt alle ~1 Minute |
| Memos GET | HTTP GET | Holt alle Memos von localhost:5230 |
| Filter neue Memos | JavaScript | Filtert: #vault && !#vault-done |
| Loop POST | HTTP POST | Schickt Content an AgenticLoop (Port 5231) |
| Memos PATCH done | HTTP PATCH | Setzt #vault-done Tag in Memos |

## 🔧 Änderungen in dieser Session

### Neu hinzugefügt
- **Loop POST Node** (POST http://[IP-REDACTED]/generate-note)
  - Body: `content` = `{{ $json.content }}`, `category` = `general`
  - Authentication: None
  - Kein Authorization Header

### Fixes
- `Memos PATCH done` URL auf `$('Filter neue Memos').item.json.name` umgestellt
  (vorher: `$json.name` — brach nach Loop POST weil JSON-Struktur anders)
- `python-dotenv` in `Invoke-AgenticLoop.py` eingebaut (ANTHROPIC_API_KEY aus .env)
- Node-Namen vereinheitlicht (HTTP Request → Memos GET, HTTP Request1 → Memos PATCH done)

### Filter-Logik
```javascript
const memos = $input.first().json.memos || [];
const toProcess = memos.filter(memo =>
  memo.tags.includes("vault") && !memo.tags.includes("vault-done")
);
return toProcess.map(memo => ({ json: memo }));
```

## 📋 Nutzung

1. In Memos schreiben + `#vault` Tag hinzufügen
2. n8n pollt automatisch (~1 Minute)
3. Notiz landet in `16_AUTO/_INBOX/` mit Status L2-Pending
4. Memos-Eintrag bekommt `#vault-done` → nie doppelt verarbeitet
5. L2-Review + in Vault verschieben

## ⚠️ Voraussetzungen

- `Invoke-AgenticLoop.py` muss laufen (Port 5231)
- `ANTHROPIC_API_KEY` in `C:\[USER]\Tools\.env`
- n8n läuft (Port 5678)
- Memos läuft (Port 5230)

## 📊 Execution-Statistiken (Stand 2026-06-24)

- Prod. Executions: ~19
- Failure Rate: 10.5% (Fehler während Debugging, nicht produktiv)
- Letzte erfolgreiche Execution: 15:56:58 (64ms)

## 🔗 Verknüpfte Notizen

- [[Phase15_Plan]]
- _(internal)_
- [[Invoke-AgenticLoop]]
- _(internal)_
