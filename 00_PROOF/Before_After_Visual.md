---
date: 2026-06-25
updated: 2026-06-25
tags: [proof, before-after, metrics, auto-updated]
status: ✅ Auto-aktualisiert via Invoke-PublicExport-v2.ps1
title: Before/After — Schnellübersicht
---

# Before/After — Schnellübersicht

> Kompakte Vergleichstabellen für Content und Verkauf.
> Details: [Verified_Results.md](./Verified_Results.md)

---

```
╔══════════════════════════════════════════════════════════════╗
║              fu75ch1 — BEFORE / AFTER                       ║
╠══════════════════════════════════════════════════════════════╣
║  METRIC               BEFORE          AFTER                 ║
╠══════════════════════════════════════════════════════════════╣
║  Jailbreak ASR        45.23%    →     0.00% ✅              ║
║  OpSec Score          unknown   →     96%   ✅  (25/26)     ║
║  Cloud dependency     ~100%     →     <20%  ✅              ║
║  Prompt version       none      →     v4.5  ✅              ║
║  Local LLM capable    no        →     yes   ✅  (Ollama)    ║
║  Semantic search      no        →     yes   ✅  (AnythingLLM)║
║  Workflow automation  no        →     yes   ✅  (n8n)       ║
║  Errors documented    0         →     77+   ✅  (Chronicle) ║
╚══════════════════════════════════════════════════════════════╝
```

---

## Jailbreak Resistance

```
Run 1 (no prompt)  ████████████████████████  45.23%
Run 2 (v4.3)       ███████████████████████   43.67%
Run 3 (v4.4)       ████████                  15.75%
Run 4 (v4.5)                                  0.00% ✅
```

Werkzeug: Garak 0.15.1 | Modell: claude-sonnet-4-5

---

## OpSec Score

```
Vor Phase 12   [??????????????????????????]  unbekannt
Nach Phase 12  [█████████████████████████ ]  25/26 = 96% ✅
```

Werkzeug: Invoke-OpSecAudit.ps1 (eigens entwickelt) | 26 automatisierte Checks

---

## Cloud-Abhängigkeit

```
Vor Phase 1    [██████████]  ~100% Cloud
Nach Phase 11  [███       ]  ~30%  Cloud
Nach Phase 14  [██        ]  <20%  Cloud ✅
               [████████  ]  >80%  Lokal
```

---

## Fehler → Wissen

```
Phase 0   0 dokumentierte Fehler
Phase 15  77+ dokumentierte Fehler + Lösungen + Präventionsregeln
```

Jeder Fehler = eine Präventionsregel im System verankert.

---

*Vollständige Quelldaten: [Verified_Results.md](./Verified_Results.md)*
