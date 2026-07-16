---
date: 2026-06-25
updated: 2026-06-30
tags: [proof, before-after, metrics, manually-maintained]
status: ✅ Aktuell (Stand 2026-06-30)
title: Before/After — Schnellübersicht
---

# Before/After — Schnellübersicht

> **Kontext (2026-07-16):** Diese Datei protokolliert Messungen bis Phase 15. Zwei Dinge
> haben sich seither geaendert: (1) der OpSec-Audit ist von 26 auf 38 Checks gewachsen --
> "26/26 = 100%" war auf der damaligen Skala korrekt, ist aber nicht der heutige Stand <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->
> (aktuell 37/38, siehe metrics.json); (2) alle ASR-Zahlen hier sind mit #114/#115
> **zurueckgezogen** -- der Garak-Harness hat den System-Prompt nie injiziert, gemessen
> wurde das blanke Modell. Die Zahlen bleiben als Protokoll stehen; sie sind keine
> Aussage ueber den heutigen Stand.


> Kompakte Vergleichstabellen für Content und Verkauf.
> Details: [Verified_Results.md](./Verified_Results.md)

---

```
╔══════════════════════════════════════════════════════════════╗
║              fu75ch1 — BEFORE / AFTER                       ║
╠══════════════════════════════════════════════════════════════╣
║  METRIC               BEFORE          AFTER                 ║
╠══════════════════════════════════════════════════════════════╣
║  Jailbreak ASR (512)  45.23%    →     41.8% / 9.8% ✅       ║ <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->
║  OpSec Score          unknown   →     100%  ✅  (26/26)     ║ <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->
║  Cloud dependency     ~100%     →     <20%  ✅  (Workloads) ║
║  Prompt version       none      →     v4.5  ✅              ║
║  Local LLM capable    no        →     yes   ✅  (Ollama)    ║
║  Semantic search      no        →     yes   ✅  (AnythingLLM)║
║  Workflow automation  no        →     yes   ✅  (n8n)       ║
║  Errors documented    0         →     94    ✅  (bis #95)   ║
╚══════════════════════════════════════════════════════════════╝
```

> Hinweis Jailbreak-ASR: 41.8%/9.8% (Run 5, 512 reale Jailbreaks) ersetzt den <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->
> früheren 0%-Wert (Run 4, nur 3 Versuche, nicht repräsentativ). Höher wirkende
> Zahl = größere, ehrlichere Stichprobe, keine Verschlechterung.
> Hinweis Cloud-Dependency: bezieht sich auf unterstützende Workloads (RAG,
> Automation, Observability laufen lokal) — die primäre KI-Inferenz läuft
> weiterhin überwiegend über die Anthropic-Cloud-API.

---

## Jailbreak Resistance

```
Run 1 (no prompt)        ████████████████████████  45.23%
Run 2 (v4.3)              ███████████████████████  43.67% <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->
Run 3 (v4.4)               ████████                15.75%
Run 4 (v4.5, Pilot, n=3)                             0.00% (nicht repräsentativ)
Run 5 (v4.5, DanInTheWild, n=512)        ██████████  41.8% <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->
Run 5 (v4.5, HijackHateHumans, n=512)    ██          9.8%
```

Werkzeug: Garak 0.15.1 | Modell: anthropic/claude-sonnet-4-6

---

## OpSec Score

```
Vor Phase 12   [??????????????????????????]  unbekannt
Nach Phase 15  [███████████████████████████]  26/26 = 100% ✅ <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->
```

Werkzeug: Invoke-OpSecAudit.ps1 (eigens entwickelt) | 26 automatisierte Checks

---

## Cloud-Abhängigkeit (unterstützende Workloads)

```
Vor Phase 1    [██████████]  ~100% Cloud
Nach Phase 11  [███       ]  ~30%  Cloud
Nach Phase 14  [██        ]  <20%  Cloud ✅
               [████████  ]  >80%  Lokal
```

Bezieht sich auf RAG/Automation/Observability — primäre KI-Inferenz läuft
weiterhin überwiegend über Cloud-API (kein lokales LLM im Hauptworkflow).

---

## Fehler → Wissen

```
Phase 0    0 dokumentierte Fehler
Heute     94 dokumentierte Fehler (nummeriert bis #95) + Lösungen + Präventionsregeln
```

Jeder Fehler = eine Präventionsregel im System verankert.

---

*Vollständige Quelldaten: [Verified_Results.md](./Verified_Results.md)*
