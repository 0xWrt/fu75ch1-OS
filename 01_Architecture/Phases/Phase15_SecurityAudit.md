---
tags: [audit, security, gitleaks, garak, pre-commit, live-verifikation, phase15]
date: 2026-06-25
status: ✅ Verifiziert
title: Phase 15 — Security Audit Live-Verifikation
---

# Phase 15 — Security Audit Live-Verifikation

> Datum: 2026-06-25
> Kontext: Erster Git-Commit nach Phase 15 Block C (Public Vault + Launch-Plan)
> Ergebnis: Beide Sicherheitssysteme haben korrekt reagiert — kein Schaden.

---

## 1. gitleaks Pre-Commit Hook — Liveeinsatz bestätigt

### Was passiert ist

Beim Versuch, 17 neue/geänderte Dateien zu committen, hat der gitleaks
Pre-Commit Hook den Commit **blockiert** und einen Fund gemeldet:

```
⚠️ gitleaks: Secret gefunden — Commit abgebrochen.
leaks found: 1
```

### Fund-Details

| Feld | Wert |
|---|---|
| Regel | generic-api-key |
| Datei | fu75ch1_pitch_v3.html |
| Zeile | 2972 |
| Pattern | `"Unser API Key: sk-DEMO-REDACTED"` |
| Art | Beispiel-String in HTML Code-Block |
| Echter Key? | ❌ Nein — Demo-Platzhalter |

### Ursache

Das Pitch-Deck enthält ein Code-Beispiel das zeigt, wie ein ungesichertes System
aussieht. Der String `sk-DEMO-REDACTED` imitiert das Präfix echter Anthropic API-Keys
(`sk-ant-...`). gitleaks erkennt das `sk-` Pattern als potentiellen API-Key.

### Fix

`"Unser API Key: sk-DEMO-REDACTED"` → `"Unser API Key: DEMO-KEY-REDACTED"`

### Bewertung

**✅ Hook hat korrekt funktioniert.** Ein echter Key mit diesem Pattern wäre ebenfalls
blockiert worden. Der Hook ist sensitiv — das ist die richtige Einstellung.
Lesson: Demo-Keys in Code-Beispielen nie mit echten Key-Präfixen versehen.

### Präventionsregel (neu → #80)
> Demo-Keys in Code-Beispielen nie mit echten Key-Präfixen (`sk-`, `Bearer`, `token: [REDACTED] —
> stattdessen: `DEMO-KEY-REDACTED`, `YOUR-KEY-HERE`, `<api-key>`.

---

## 2. Garak Pre-Commit Hook — Verhalten dokumentiert

### Status

Der Garak Git-Hook (Phase 9 / Install-GarakGitHook.ps1) ist aktiv.
Er scannt nur wenn `Master-Prompt` im Dateinamen der geänderten Dateien vorkommt.

Beim heutigen Commit: **kein Master-Prompt geändert → kein Garak-Scan.**

Log-Bestätigung (14_LOGS/garak_hook_20260625_005016.log):
```
[2026-06-25 00:50:16] [INFO] Geaenderte Dateien: .obsidian/graph.json, Session_State.md, ...
[2026-06-25 00:50:16] [INFO] Kein Master-Prompt geaendert - kein Scan noetig.
```

### Letzter echter Garak-Scan (Phase 12)

| Run | Datum | Prompt | Probe | ASR |
|---|---|---|---|---|
| 4 | 2026-06-24 | v4.5 | AutoDANCached | **0%** ✅ |

Der Hook würde beim nächsten Commit mit geändertem Master-Prompt automatisch
einen Garak-Scan auslösen und bei ASR > Schwellwert den Commit blockieren.

---

## 3. Weitere Beobachtungen aus dem Commit-Prozess

### gitleaks `--staged` nicht verfügbar (Fehler #82)

```
gitleaks git --staged  →  error: unknown option 'staged'
```

Workaround für manuelle Prüfung vor Commit:
```powershell
$tmpPatch = "$env:TEMP\staged_patch.txt"
git diff --cached > $tmpPatch
gitleaks detect --source $tmpPatch --no-git --report-format json --report-path "$env:TEMP\leaks.json"
Remove-Item $tmpPatch
```

### Commit-Messages mit Umlauten (Fehler #81)

Commit-Messages mit deutschen Sonderzeichen (ä, ö, ü) führen in `execute_safe_pwsh`
zu stummem Fehler — der Commit läuft nicht durch, aber es kommt keine Fehlermeldung.
Lösung: ASCII-only Commit-Messages in automatisierten Skripten.

### DryRun-Falle (Fehler #79)

`Invoke-PublicExport-v2.ps1` meldet auch im DryRun "Exportiert: 30" —
weil der Zähler nicht zwischen DryRun und echtem Export unterscheidet.
Fix in v2.2 geplant: DryRun-Zähler separat führen + klare Ausgabe.

---

## 4. Gesamtbewertung Sicherheitssysteme

| System | Status | Letzter Test | Ergebnis |
|---|---|---|---|
| gitleaks Pre-Commit | ✅ Aktiv | 2026-06-25 | Echter Fund erkannt + blockiert |
| Garak Pre-Commit | ✅ Aktiv | 2026-06-25 | Korrekt kein Scan (kein MP geändert) |
| Garak letzter ASR-Test | ✅ | 2026-06-24 | 0% (AutoDANCached) |
| OpSec Audit | ✅ | 2026-06-23 | 25/26 = 96% |

**Alle Sicherheitssysteme operativ. Kein echter Datenverlust. Stack funktioniert.**

---

## 5. Nächste Schritte (Security)

| Aufgabe | Priorität | Wann |
|---|---|---|
| Invoke-PublicExport-v2.ps1 → v2.2 (DryRun-Zähler fix) | 🟡 Mittel | nächste Session |
| Garak-Scan nach nächster Master-Prompt Änderung | 🔴 Pflicht | bei v4.6+ |
| Promptfoo vollständiger Run (1358 Tests) | 🟡 Mittel | wenn Credits verfügbar |
| gitleaks auf Public Vault einrichten | 🟢 Optional | Phase 2 |

---

## 🔗 Verknüpfte Notizen

- [[Fehler_Chronologie_Kumulativ]] ← Fehler #78–82
- [[Garak_Run4_2026-06-24]]
- [[Phase12_BlockA_Abschluss]] ← OpSec 96%
- [[Install-GarakGitHook]]
- [[Master-Prompt]] _(sanitized)_
- _(internal)_
