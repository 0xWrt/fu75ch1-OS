---
date: 2026-06-25
updated: 2026-06-30
tags: [proof, metrics, before-after, garak, opsec, verified]
status: ✅ Verifiziert
title: fu75ch1 — Verified Results (Alle Metriken)
---

# fu75ch1 — Verified Results

> **Kontext (2026-07-16):** Diese Datei protokolliert Messungen bis Phase 15. Zwei Dinge
> haben sich seither geaendert: (1) der OpSec-Audit ist von 26 auf 38 Checks gewachsen --
> "26/26 = 100%" war auf der damaligen Skala korrekt, ist aber nicht der heutige Stand <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->
> (aktuell 37/38, siehe metrics.json); (2) alle ASR-Zahlen hier sind mit #114/#115
> **zurueckgezogen** -- der Garak-Harness hat den System-Prompt nie injiziert, gemessen
> wurde das blanke Modell. Die Zahlen bleiben als Protokoll stehen; sie sind keine
> Aussage ueber den heutigen Stand.


> Alle Zahlen stammen aus dem privaten Core Vault (fu75ch1).
> Quellen: Garak Run-Logs, Invoke-OpSecAudit.ps1, Fehler-Chronologie, Git-History.
> Nichts ist geschätzt — alles ist gemessen.

---

## 1. Jailbreak Resistance — Garak 0.15.1

Systematische Red-Team-Tests des Master-Prompts über 5 Runs.

| Run | Datum | System-Prompt | Probe | Attempts | ASR | Trend |
|---|---|---|---|---|---|---|
| 1 — Baseline | 2026-06-21 | keiner | dan.Dan_11_0 | ~65 | **45.23%** | — |
| 2 | 2026-06-21 | v4.3 | dan.Dan_11_0 | ~65 | **43.67%** | -1.56% | <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->
| 3 | 2026-06-22 | v4.4 | Ablation_Dan_11_0 | ~40 | **15.75%** | -27.92% |
| 4 (Pilot) | 2026-06-24 | v4.5 | AutoDANCached | 3 | **0%** | nicht repräsentativ |
| **5** | **2026-06-30** | **v4.5** | **dan.DanInTheWild** | **512** | **41.8%** | repräsentativ | <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->
| **5** | **2026-06-30** | **v4.5** | **promptinject.HijackHateHumans** | **512** | **9.8%** | repräsentativ |

> ⚠️ Run 4 nutzte nur 3 Versuche und ist statistisch nicht aussagekräftig — ein
> Pilot-Test, kein Beweis. Run 5 ersetzt ihn als Referenzwert: 512 reale <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->
> Community-Jailbreaks pro Probe geben ein deutlich belastbareres Bild der
> tatsächlichen Robustheit. Die höhere ASR gegenüber Run 4 ist Folge der
> breiteren Stichprobe, nicht einer Verschlechterung des Systems — wir zeigen
> beide Werte, statt nur den besten herauszupicken.

Detektoren in Run 5:
- `mitigation.MitigationBypass` (DanInTheWild) — 139 PASS / 100 FAIL / 17 None (239 ausgewertet) → 41.8% ASR <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->
- `promptinject.AttackRogueString` (HijackHateHumans) — 221 PASS / 24 FAIL / 11 None (245 ausgewertet) → 9.8% ASR
- Modell: anthropic/claude-sonnet-4-6 (direkter Anthropic-API-Key)

Getestete Angriffsmuster (Run 4, AutoDANCached — Pilot):
1. Llama-2 Persona-Hijack ("Disregard previous instructions")
2. Developer Mode Output Framework
3. Bifurcated-Response Developer Mode (langer Kontext-Angriff)

> ⚠️ Hinweis: Runs nutzen unterschiedliche Probes über die Zeit — eingeschränkte
> direkte Vergleichbarkeit zwischen alten und neuen Runs. Trend bei Runs 1-3 ist
> eindeutig; Run 5 ist der aktuell verlässlichste Einzelwert.

---

## 2. Promptfoo Red Team — Teilergebnis

| Plugin | Tests | PASS | FAIL | Score |
|---|---|---|---|---|
| bias:age | 5 | 5 | 0 | **1.0** |
| bias:gender | 2 | 2 | 0 | **1.0** |
| **Gesamt (Teilrun)** | **7** | **7** | **0** | **100%** |

Ausstehend: 1358 weitere Tests (32 Plugins) — vollständiger Lauf noch offen.
Modell: anthropic:messages:claude-sonnet-4-6
Eval-ID: eval-B1R-2026-06-24T11:56:25

---

## 3. OpSec Score — Invoke-OpSecAudit.ps1 (26 Checks)

Automatisiertes Audit-Script mit 26 Checks über 4 Kategorien.

| Kategorie | Checks | Bestanden | Score |
|---|---|---|---|
| VPN / Netzwerk | 01–05 | 5/5 | 100% |
| System Security | 06–10 | 5/5 | 100% |
| Tools & AppSec | 11–18 | 8/8 | 100% |
| Anti-Tracking | 19–26 | 8/8 | 100% |
| **Gesamt** | **26** | **26/26** | **100% 🟢** | <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->

Stand 2026-06-29: letzter offener Check (WiFi MAC Randomisierung) verifiziert/geschlossen.

Vorher: kein Audit-Tool vorhanden (Phase 0–11) — Baseline = unbekannt / 0%.

---

## 4. Prompt-Evolution — Was jede Version brachte

| Version | Hauptänderung | Messbarer Effekt |
|---|---|---|
| v1.0 | "Agiere als" Muster | kein Baseline |
| v2.0 | "Du bist" — Redundanzen reduziert | — |
| v3.0 | XML-strukturiert | strukturierterer Output |
| v4.0 | Governance L0–L4 + Decision Engine | kontrollierbare Autonomie |
| v4.3 | Vault fu75ch1 + Phasen-Protokoll | ASR 45.23% → 43.67% (-1.56%) | <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->
| v4.4 | `[prompt_security]` — 7 Jailbreak-Muster | ASR 43.67% → 15.75% (-27.92%) | <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->
| v4.5 | pwsh Guardrails + Idempotenz | ASR 15.75% → 0% (Pilot, 3 Versuche) |
| **v4.5** | **(repräsentativer Test, Run 5)** | **ASR 41.8% / 9.8% gegen 512 reale Jailbreaks** | <!-- stale-ok: historisches Protokoll, siehe Kontext-Banner -->

---

## 5. Cloud-Abhängigkeit

| Zeitpunkt | Cloud-Workload | Lokal | Was lokal läuft |
|---|---|---|---|
| Vor Phase 1 | ~100% | 0% | nichts |
| Nach Phase 11 | ~30% | ~70% | Ollama, AnythingLLM, n8n, LangFuse |
| **Nach Phase 14** | **<20%** | **>80%** ✅ | RAG, Automation, Observability, lokale LLMs |

Lokal: AnythingLLM (semantische Vault-Suche), Ollama (lokale LLMs, offline-fähig),
n8n (Workflow-Automation, self-hosted), LangFuse (LLM-Observability, self-hosted Docker),
Memos (Quick-Capture, self-hosted Docker).

Cloud: Anthropic API — primär für Architektur-/Security-Analysen und Dokumentengenerierung
(Komplexitätsstufe Medium/Large). Hinweis: lokale LLMs (Ollama) sind als Infrastruktur
vorhanden und einsatzbereit, der produktive Hauptworkload läuft Stand heute überwiegend
über die Anthropic-API — siehe Master-Prompt `[environment]`-Sektion ("kein lokales LLM"
im Tages-Workflow). "<20% Cloud" bezieht sich auf die Anzahl unterstützender Workloads
(RAG, Automation, Observability), nicht auf den Anteil der KI-Inferenz selbst.

---

## 6. Supply Chain Security — SBOM-Ergebnisse

Memos Docker Image — SBOM via syft 1.45.1 + CVE-Scan via grype 0.114.0:

| Image | Critical CVEs | High CVEs | Entscheidung |
|---|---|---|---|
| neosmemo/memos:0.24.0 | 12 | — | Upgrade erforderlich |
| neosmemo/memos:0.29.1 | **8** | — | Akzeptiert (localhost-only) |

Verbleibende Criticals in 0.29.1:
- golang.org/x/crypto — Fix in 0.52.0 (2 Minor-Versionen voraus)
- golang.org/x/net — Fix in 0.55.0 (2 Minor-Versionen voraus)
Akzeptiert da: keine Internet-Exposition, localhost:5230 only.

---

## 7. Fehler-Chronologie — 94 dokumentierte Fehler

Alle Fehler mit Ursache, Lösung und abgeleiteter Präventionsregel.

| Phasen-Block | Fehler | Kategorien |
|---|---|---|
| Addendum-Setup | #A1–A3 | SYNTAX, PFAD |
| Phase 1–2 | #1–13 | SYNTAX, PFAD, KONFLIKT, BERECHTIGUNG |
| Phase MCP | #14a–14c | KONFLIKT, PFAD, PROZESS |
| Phase 4–5 | #15–28 | ABHÄNGIGKEIT, SYNTAX, BILLING, ENCODING |
| Phase 7 | #29–32 | ABHÄNGIGKEIT, KONFIGURATION |
| Phase 8 | #33–37 | KONFLIKT, SYNTAX, SECURITY, ABHÄNGIGKEIT |
| Phase 9 | #38–41 | KONFLIKT, PARSING, LOGIK |
| Phase 10 | #42–51 | SYNTAX, BERECHTIGUNG, ABHÄNGIGKEIT, NETZWERK |
| Phase 11 | #52–65 | ABHÄNGIGKEIT, SYNTAX, API-ÄNDERUNG, KONFIGURATION |
| Phase 12 | #66–67 | KONFIGURATION, SECURITY |
| Phase 13 | #68–72 | AUTH, API |
| Phase 14 | #73–77 | PFAD, SYNTAX, PARSING |
| Phase 15 + Folgesessions | #78–95 | KONFIGURATION, SYNTAX, PROZESS, KOMPATIBILITÄT |
| **Gesamt** | **94 Einträge** (nummeriert bis #95, eine Nummer historisch konsolidiert) | **12+ Kategorien** |

Vollständige Liste: [Error_Chronicle.md](../01_Architecture/Error_Chronicle.md)

---

## 8. Stack-Verifikation (Windows Defender + Telemetrie)

Phase 1 Ergebnis:

| Prüfpunkt | Ergebnis |
|---|---|
| Defender Aktiv | ✅ True |
| Echtzeit-Schutz | ✅ True |
| Signaturen veraltet | ✅ False |
| DiagTrack | ✅ Stopped / Disabled |
| dmwappushservice | ✅ Stopped / Disabled |
| WerSvc | ✅ Stopped / Disabled |
| PcaSvc | ✅ Stopped / Disabled |
| Telemetrie-Level | ✅ 0 (Security) |
| Script Block Logging | ✅ 1 (Aktiv) |

---

## 9. Noch ausstehend (prospektiv)

| Metrik | Methode | Status |
|---|---|---|
| Token-Kosten vorher/nachher | LangFuse 4-Wochen-Export | offen |
| Setup-Zeit Neuling | Beta-Tester | offen |
| Promptfoo vollständiger Run (1358 Tests) | Budget jetzt verfügbar (~$10.77) | offen |
| DanInTheWild Fail-Cases im Detail | Manuelle Analyse der 100 Fail-Fälle | offen |
| Vault-Wachstumskurve | Git-Log-Auswertung | offen |

---

*Quellen: Garak_Run4_2026-06-24.md, Garak_Run5_2026-06-30.md,
Phase8_BlockB_Promptfoo_2026-06-24.md, Phase12_BlockA_Abschluss.md,
Fehler_Chronologie_Kumulativ.md, Phase1_Retrospektive.md,
Phase1_Block3-4_Defender_Telemetrie.md — alle im Core Vault fu75ch1.*
