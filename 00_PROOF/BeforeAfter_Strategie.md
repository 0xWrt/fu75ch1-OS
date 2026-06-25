---
date: 2026-06-25
updated: 2026-06-25
tags: [strategie, before-after, proof, metrics, content]
status: ✅ v1.1 — korrigiert 2026-06-25
title: Vor/Nachher Datenstrategie — fu75ch1
---

# Vor/Nachher Datenstrategie — fu75ch1

> Ziel: Nachweisbare, konkrete Vorher/Nachher-Effekte für Content und Verkauf.
> Prinzip: Retrospektiv aus vorhandenen Quellen + prospektiv ab jetzt messen.

---

## 1. Was bereits vorhanden ist (retrospektiv)

Diese Daten existieren bereits im Vault und können sofort verwendet werden.

### 1.1 Jailbreak Resistance — stärkster Beweis

| Run | Datum | System-Prompt | Probe | ASR | Beleg |
|---|---|---|---|---|---|
| 1 | 2026-06-21 | keiner | dan.Dan_11_0 | 45.23% | Garak Run Log |
| 2 | 2026-06-21 | v4.3 | dan.Dan_11_0 | 43.67% | Garak Run Log |
| 3 | 2026-06-22 | v4.4 | Ablation_Dan_11_0 | 15.75% | Garak Run Log |
| 4 | 2026-06-24 | v4.5 | AutoDANCached | **0%** ✅ | Garak_Run4_2026-06-24.md |

Gesamtreduktion: −100% (45.23% → 0%)
Werkzeug: Garak 0.15.1 | Modell: claude-sonnet-4-5

**Content-Verwertung:**
- Substack Issue #3: "From 45% to 0% — what actually worked" ✅ (fertig)
- GitHub README Badge: `Jailbreak ASR: 0%` ✅ (fertig)
- Gumroad Master-Prompt Beschreibung ✅ (fertig)

### 1.2 OpSec Score — 26 Checks

| Zeitpunkt | Score | Checks | Beleg |
|---|---|---|---|
| Vor Phase 12 | nicht messbar (kein Tool) | — | — |
| Nach Phase 12 Block A2 | **25/26 (96%)** ✅ | 26 | Phase12_BlockA_Abschluss.md |

Kategorien: VPN/Netzwerk (5), System Security (5), Tools & AppSec (8), Anti-Tracking (7/8)
Offener Check: #26 WiFi MAC — Treiber-Limitation, manuell als OK verifiziert.

**Content-Verwertung:**
- Substack: "I built a 26-point security audit script. Here's the score."
- Gumroad OpSec Checklist Produktseite ✅

### 1.3 Fehler-Chronologie als Beweis

**77 dokumentierte Fehler** (Nr. A1–77, Phasen Addendum bis Phase 14)
Quelle: `13_AUDIT/Fehler_Chronologie_Kumulativ.md`

Jeder Fehler zeigt: *das war das Problem (vorher)* — *das ist die Lösung (nachher)*.
Das ist authentischer als jede Erfolgsgeschichte ohne Rückschläge.

| Phasen-Block | Fehler-Nummern |
|---|---|
| Addendum-Setup | A1–A3 |
| Phase 1–2 | 1–13 |
| Phase MCP | 14a–14c |
| Phase 4–5 | 15–28 |
| Phase 7–8 | 29–37 |
| Phase 9–10 | 38–51 |
| Phase 11 | 52–65 |
| Phase 12–14 | 66–77 |

**Content-Verwertung:**
- Substack: "77 mistakes building a local AI OS" (hohe Engagement-Rate erwartet)
- GitHub: `Error_Chronicle.md` als eigene Datei (zeigt Tiefe + Ehrlichkeit)

### 1.4 Vault-Wachstum (aus Git-History rekonstruierbar)

```powershell
git -C "$env:USERPROFILE\Documents\fu75ch1" log --oneline --format="%H %ai %s" |
    Select-Object -First 50
```

Zeigt: von 0 Notizen (Phase 0) zu 100+ Notizen (Phase 15).

### 1.5 Cloud-Abhängigkeit

| Zeitpunkt | Cloud | Lokal | Basis |
|---|---|---|---|
| Vor Phase 1 | ~100% | 0% | kein lokales LLM, kein RAG |
| Nach Phase 11 | ~30% | ~70% | Ollama + AnythingLLM aktiv |
| Nach Phase 14 | **<20%** | **>80%** ✅ | vollständiger lokaler Stack |

### 1.6 Supply Chain — SBOM-Delta

| Image | Critical CVEs | Entscheidung |
|---|---|---|
| memos:0.24.0 | 12 | Upgrade erforderlich |
| memos:0.29.1 | **8** | Akzeptiert (localhost-only) |

---

## 2. Was noch fehlt (prospektiv ab jetzt messen)

### 2.1 Token-Kosten (LangFuse)

**Problem:** Kein Baseline vor Phase 11.
**Lösung:** Ab jetzt wöchentlicher Snapshot.

```powershell
# LangFuse Dashboard: http://localhost:3000 → Projects → Export
# Speichern als: 14_LOGS\langfuse_week_YYYY-WW.json
```

Ziel: "Ich spare X€/Monat durch lokales Routing" — exakter Wert.

### 2.2 Setup-Zeit

Option A — VM-Simulation (4–6h einmalig)
Option B — Beta-Tester, 2–3 Personen (1h Organisation) → **empfohlen**

Ziel: "Setup in X Stunden mit Blueprint vs. selbst herausfinden"

### 2.3 Content-Performance

Ab erstem Substack-Post:

| Metrik | Tool | Frequenz |
|---|---|---|
| Substack Open Rate | Substack Analytics | nach jedem Post |
| Substack CTR | Substack Analytics | nach jedem Post |
| GitHub Stars | manuell | wöchentlich |
| Gumroad/LS Verkäufe | Dashboards | wöchentlich |

Speicherort: `02_CONTENT_OPERATING_SYSTEM/Analytics/Weekly_Metrics.md`

---

## 3. Content-Verwertung

### 3.1 Sofort verwertbar

| Post-Idee | Kern-Metrik | Plattform | Status |
|---|---|---|---|
| "From 45% to 0% jailbreak ASR" | Garak Runs 1–4 | Substack #3 | ✅ fertig |
| "I audited my own system. 96% score." | 25/26 OpSec | Substack Phase 1 | Schreiben |
| "77 mistakes building a local AI OS" | Fehler-Chronologie | Substack Phase 2 | Schreiben |
| "Before/After: cloud dependency" | ~100% → <20% | Substack Phase 2 | Schreiben |
| "How my vault grew: 0 to 100+ notes" | Git-History | GitHub / Substack | Schreiben |

### 3.2 Erst nach Datenerhebung

| Post-Idee | Fehlende Daten | Wann |
|---|---|---|
| "I save X€/month with local routing" | LangFuse 4-Wochen-Schnitt | Phase 2 |
| "Beta tester set it up in X hours" | Beta-Tester | Phase 3 |
| "Week 8: revenue breakdown" | Gumroad + LS | Phase 3 |

### 3.3 Visuelles Format (kein Video nötig)

ASCII-Tabellen — funktionieren auf GitHub, Substack, Reddit ohne Bildbearbeitung:

```
BEFORE                          AFTER
──────────────────────────────────────────────────
Jailbreak ASR:   45.23%    →    0.00% ✅
OpSec Score:     unknown   →    96%   ✅
Cloud dependency: ~100%    →    <20%  ✅
Errors documented: 0       →    77+   ✅
```

---

## 4. Automatisierung

```powershell
# Export + Before/After aktualisieren
.\Invoke-PublicExport-v2.ps1 -Mode All

# DryRun (nichts schreiben)
.\Invoke-PublicExport-v2.ps1 -Mode All -DryRun
```

Weekly Metrics manuell (5 min):
```powershell
$vault = "$env:USERPROFILE\Documents\fu75ch1"
$pub   = "$env:USERPROFILE\Documents\fu75ch1_public"
"Core .md : $((Get-ChildItem $vault -Filter '*.md' -Recurse).Count)"
"Public .md: $((Get-ChildItem $pub  -Filter '*.md' -Recurse).Count)"
"Git commits: $((git -C $vault log --oneline | Measure-Object -Line).Lines)"
```

---

## 5. Priorisierung

| Priorität | Maßnahme | Aufwand | Impact |
|---|---|---|---|
| 🔴 Sofort | Invoke-PublicExport-v2.ps1 -Mode All | 5 min | Public Vault befüllt |
| 🔴 Sofort | LangFuse wöchentlichen Snapshot starten | 5 min/Woche | Token-Kosten ab Woche 4 |
| 🟡 Phase 2 | Beta-Tester rekrutieren | 1h | Setup-Zeit + Testimonials |
| 🟡 Phase 2 | Weekly_Metrics.md anlegen | 10 min | Wachstumskurve |
| 🟢 Phase 3 | "77 mistakes" Post schreiben | 45 min | hohe Engagement-Rate |

---

## 🔗 Verknüpfte Notizen

- [[Launch_Plan]]
- [[Session_State_Content]]
- [[Invoke-PublicExport-v2]]
- [[Fehler_Chronologie_Kumulativ]]
- [[Vault_Audit_2026-06-25]]
- [[fu75ch1_IDENTITY]]
