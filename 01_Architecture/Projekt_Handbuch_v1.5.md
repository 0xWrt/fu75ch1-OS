---
tags: [meta, handbuch, referenz, konventionen]
date: 2026-06-19
updated: 2026-06-30
status: aktiv
version: "1.5"
title: Projekt-Handbuch -- Personal AI Operating System
---

# Projekt-Handbuch -- Personal AI Operating System

## Was ist dieses Projekt
Kein "besseres ChatGPT-Setup", sondern der Aufbau eines persoenlichen
KI-Betriebssystems aus Wissen, Agenten, Security, Automatisierung und
Entscheidungslogik. Ziel: hochsicheres KI-Oekosystem fuer IT-Support,
AppSec, Reverse Engineering, Hardware-Forensik und Wissensmanagement.

Entwicklungsstufen:
- Stufe 1 (jetzt): Personal Tool -- Wissen akkumuliert, Prozesse reproduzierbar
- Stufe 2: Template -- replizierbar fuer andere Projekte/Personen
- Stufe 3: Autonomous Agent -- autonomes Prompt Engineering mit Governance

## Kern-Prinzipien (die DNA des Projekts)
1. Lehrbuch-Standard: jeder Begriff erklaert, kein Wissen ohne Verstaendnis
2. PowerShell Out-File: jede Notiz via Skript, niemals manuell
3. MECE: keine Doppelungen, keine Luecken
4. OpSec zuerst: keine Rohdaten, PII-Maskierung, VPN-Integritaet
5. Fehler sind Wissen: jeder Fehler dokumentiert mit Alternativen
6. Nicht mehr speichern -- Besser speichern
7. Kontext-Disziplin: State Transfer statt endloser Chats

## Vault-Struktur (fu75ch1)
00_META       -- Prompts, Addenda, State Transfer, To-Do, Regeln
01_STACK      -- Tech-Stack-Dokumentation
02_PHASE1     -- Windows Haertung
03_PHASE2     -- VPN OpSec
04_PHASE3     -- Browser Hardening (LibreWolf)
05_PHASE4     -- Data Masking
06_AppSec     -- Application Security
07_RE         -- Reverse Engineering
08_Hardware   -- Hardware Forensik
09_AI_Security-- AI Red Teaming
10_Workflows  -- Prompts, Skripte, Automatisierung, Phasenpläne
11_KONZEPTE   -- Technische Konzepte (Netzwerk, Krypto, Windows, AI_ML, Security)
12_TRAINING   -- Verstaendnisfragen & Antworten
13_AUDIT      -- Aenderungsprotokoll, Entscheidungen
14_LOGS       -- VPN Watchdog, API Logs, Telemetrie-DB
15_SECURITY   -- Security Artefakte
16_ARCHIVE    -- Veraltete Versionen (nie loeschen, nur archivieren)
16_AUTO       -- Agentic Loop Staging: _INBOX / _REVIEW / _REJECTED
_Templates    -- Notiz-Vorlagen
000_INDEX.md  -- Einstiegspunkt

## Prompt-Hierarchie
1. Master-Prompt v4.5      -- Kern-System (Identity, Stack, Directives, Security, pwsh Guardrails)
2. Behaviour Addendum v1.1 -- Verhalten (Lehrbuch, Fehleranalyse, Farben)
3. Phasen-Abschluss-Prompt -- erzwingt vollstaendige Doku am Phasen-Ende
4. State Transfer (aktuell)-- Ist-Stand fuer Kontext-Uebergabe

## Neuen Chat starten
Claude Desktop liest via MCP in dieser Reihenfolge:
1. 00_META/_BOOT.md laedt:
2. Master-Prompt v4.5
3. Behaviour Addendum v1.1
4. Session_State.md
5. Offene_Punkte_ToDo.md

Startbefehl: "Lies _BOOT.md und StateTransfer_vXX.md"
Danach wartet Claude auf Freigabe (Governance L2).

## Autostart & Telemetrie (ab 2026-06-29)

| Script | Funktion |
|---|---|
| Install-fu75ch1-Autostart.ps1 | Richtet Task Scheduler Task ein (bei Login) |
| Start-fu75ch1-Wrapper.ps1 | Wird vom Task aufgerufen: fu75 -StartAll + Toast |
| Invoke-AgenticLoop.py | Flask Port 5231: Memos -> VaultNote (v2.1) |
| Invoke-fu75ch1-Telemetry.py | 28-Tage Hintergrund-Collector (SQLite) |
| Get-fu75ch1-Stats.ps1 | Statistik-Abfrage: -Today -Days 7 -Live -Json |

Tasks (alle bei Login):
- fu75ch1-Autostart (+15s): fu75 -StartAll + Toast-Notification
- fu75ch1-AgenticLoop (+20s): Flask Server Port 5231
- fu75ch1-Telemetry (+25s): Collector 28 Tage

WICHTIG: AgenticLoop benoetigt Klartext-Key in ~/.anthropic_key
(nicht als PS-SecureString -- Python kann SecureString nicht lesen, Fehler #88)

## Performance-Check & Ressourcen-Monitoring (ab 2026-06-30)

Hardware-Performance-Test als wiederholbares Skript, analog zu Get-fu75ch1-Stats.ps1.

| Script | Funktion |
|---|---|
| Get-fu75ch1-PerfCheck.ps1 | RAM/CPU/WSL2/Docker/Hintergrunddienste in einer Uebersicht, OK/WARN-Bewertung |
| Install-fu75ch1-BackgroundTasks.ps1 | Registriert AgenticLoop+Telemetry-Tasks idempotent MIT -Hidden (Fehler #93) |

Ausfuehren: `pwsh -File 10_Workflows\Get-fu75ch1-PerfCheck.ps1` (oder `-Json` fuer maschinenlesbare Ausgabe)

Baseline-Messung 2026-06-30 (vor/nach Optimierung, siehe Fehler #91+92):

| Metrik | Vorher | Nachher |
|---|---|---|
| RAM gesamt | 73.1% (11.4/15.6 GB) | 55-67% (8.6-10.4/15.6 GB) |
| WSL2/Docker-VM Cap | unbegrenzt (bis 7.58 GiB) | 6 GB Cap, autoMemoryReclaim=gradual |
| LangFuse (6 Container) | Autostart, ~2.2 GB im Leerlauf | On-demand via `fu75 -LangFuse` |

Prinzip: Services mit seltener Nutzung (Observability/Tracking) laufen on-demand,
nicht im Autostart. WSL2 bekommt immer ein explizites Memory-Cap + Reclaim.

## Phasen-Workflow (7-Schritte-Abschluss)
1. Review (MECE -- was lief gut, was verbessern)
2. Retrospektive (vollstaendige Fehlerchronologie)
3. Verbesserungen einpflegen
4. Fabric Export
5. Obsidian Sync (PowerShell Out-File)
6. To-Do aktualisieren
7. State Transfer vorbereiten + Git Commit

## Notiz-Schema (7 Punkte -- immer vollstaendig)
1. Frontmatter (Tags Mehrzeilen-YAML, date, status, phase, tool)
2. Ziel & Verifikationsergebnis (Tabelle)
3. Konzepte & Hintergrund (Lehrbuch-Stil)
4. Vollstaendige PowerShell-Referenz
5. Fehleranalyse & Loesungen
6. Verknuepfte Notizen (Wikilinks)
7. Graph-Gruppe (Farbe nach Palette)

## Fehleranalyse-Schema (5 Schritte)
1. Sofortanalyse: Fehlermeldung lesen, Kategorie bestimmen
   (BERECHTIGUNG | PFAD | ABHAENGIGKEIT | NETZWERK | KONFLIKT | SYNTAX)
2. Ursache: Was wurde versucht, welche Voraussetzung fehlte
3. Alternative Wege: Weg A (direkt), B (robust), C (manuell)
4. Dokumentation: Tabelle in Fehlerchronologie
5. Praevention: Regel ableiten zur kuenftigen Vermeidung

## Farbpalette (graph.json)
00_META: 11184810 (Grau)      | 01_STACK: 4886754 (Blau)
02_PHASE1: 5025616 (Gruen)    | 03-05_PHASE: 15120384 (Orange)
06-09: 16711680 (Rot)         | 10_Workflows: 10053120 (Dunkelgruen)
11_KONZEPTE: 16744272 (Gelb)  | 12_TRAINING: 8388863 (Lila)
13_AUDIT: 5592405 (Dunkelgrau)| 14_LOGS: 5592405 (Dunkelgrau)
15_SECURITY: 8388608 (Dunkelrot) | 16_ARCHIVE: 13421772 (Hellgrau)
_Templates: 8421504 (Grau)

## Modell-Routing
Small (GPT-4o-mini / Groq Llama 3.3): Zusammenfassung, Formatierung, Logs
Medium (Claude Sonnet 4.6): Dokumentation, Code Review, Standardanalyse
Large (Claude Opus 4): Architektur, RE, Security-Analyse
Security (Garak, Promptfoo, Llama Guard, PyRIT): AI Red Teaming
Fallback: Primary -> Secondary -> Local -> Human Review

## Governance-Level
L0 Analyse | L1 Vorschlag | L2 Vorbereitung (Standard) |
L3 Ausfuehrung mit Bestaetigung | L4 Automatisch
Human Approval Pflicht: Netzwerk, Rechte, Credentials, Firmware,
Datenloeschung, produktive Systeme

## Daten-Klassifizierung
PUBLIC (frei) | INTERNAL (Cloud ok) | CONFIDENTIAL (nur gepruefte Anbieter) |
RESTRICTED (lokal: Keys, Passwoerter, Netzwerkdetails, PII)

## PowerShell-Konventionen
- Vault-Variable: $vault = "$env:USERPROFILE\Documents\fu75ch1"
- Admin-Check immer als erster Schritt
- Pfade nie hardcoden -- immer $vault
- Jeder Block endet mit Verifikation
- Diagnoseskripte: nur OK/WARN, keine Rohdaten
- Tags via Linter automatisch in Mehrzeilen-YAML
- Multi-line Scripts: immer als .ps1 speichern, nie direkt in Konsole
- param() muss VOR Set-StrictMode stehen (Fehler #85)
- Downloads: immer WebClient mit Fortschrittsanzeige
- Silent Installer (--quiet): kein Fortschritt moeglich -- Hinweis + Dauer angeben

## Stolpersteine -- Kumulativ (Stand 2026-06-29)
| Thema | Erkenntnis |
|---|---|
| Store-App vs MSI | Store-Apps (AppX-Sandbox) ungeeignet fuer Admin-Ops -- immer MSI |
| Admin-Kontext | Terminal elevated != pwsh elevated -- pwsh direkt als Admin |
| PcaSvc | Geschuetzter Dienst -- nur via Registry Start=4 deaktivierbar |
| Telemetrie | Registry-Ebene robuster als reine Dienst-Deaktivierung |
| Obsidian Tags | Einzeilige YAML ungueltig -- Linter auf multi-line |
| Templater {{title}} | Wird nur via Plugin ersetzt, nicht via Out-File |
| Graph-Farben | Nur persistent wenn alle 18 Gruppen in graph.json explizit |
| Mullvad Kill-Switch | Laeuft ueber WFP, NICHT via Get-NetFirewallRule sichtbar |
| VirtualBox Adapter | Host-Only Adapter stoert VPN-Routing |
| Vault-Rename | Pfad nie hardcoden, sonst brechen alle Skripte |
| Prompt-Hygiene | Beobachtungen nie in Prompt-Text einbauen |
| edit_file + Emoji | MCP edit_file kann Emojis in oldText nicht matchen -- Out-File |
| PIIScrubber Pipeline | ValueFromPipeline ohne process{} verarbeitet nur letzten Wert |
| OpenRouter ZDR | Ueber Privacy Settings + Allowed Providers (nur Anthropic) |
| CredentialManager | v2.0 inkompatibel mit PS7 -- DPAPI stattdessen |
| Garak + LiteLLM | top_p + temperature gleichzeitig -> Anthropic-Fehler, auskommentieren |
| Garak Flags | --target_type/--target_name + --generations 1 |
| Garak Dan_11_0 | In v0.15.1 inaktiv (tier=9) -- Ablation_Dan_11_0 nutzen |
| PS Multi-line | Nie direkt in Konsole -- immer als .ps1 speichern |
| icacls Windows DE | Englische Flags (OI)(CI) schlagen fehl -- Vollzugriff F verwenden |
| npm + n8n | n8n als .cmd/.ps1 -- NSSM mit node direkt starten |
| PM2 auf Windows | pm2 startup kennt kein Windows Init-System -- NSSM verwenden |
| MCP npx -> node | npx-basierter MCP-Server disconnected bei langen Sessions -> node direkt |
| LangFuse S3 | MINIO_ROOT_PASSWORD Custom -> alle LANGFUSE_S3_*_SECRET_ACCESS_KEY mitsetzen |
| LangFuse v4 API | decorators/trace()/start_as_current_span() weg -> get_client() + start_as_current_observation() |
| Instructor max_tokens | min. 500 fuer Pydantic-Schema -- 300 zu niedrig -> IncompleteOutputException |
| websockets Konflikt | frida-tools <14, langgraph 15.x -> Frida in separatem venv |
| Python Script in PS | Nie direkt einfuegen -- immer Out-File + python <pfad> |
| $script: Scope | PS-Funktionen brauchen $script:variable statt $variable fuer globale Aenderungen |
| param() vor Set-StrictMode | param()-Block muss VOR Set-StrictMode stehen -- sonst Switch-Fehler (#85) |
| ParameterSetName sparsam | Nur bei wirklich exklusiven Sets -- Default-Aufruf bricht sonst (#86) |
| SQLite-Timestamps | ConvertFrom-Json kann ts als DateTime deserialisieren -- [string]-Cast vor Substring() (#87) |
| Python API-Keys | Python-Scripts brauchen Klartext-Keys -- PS-SecureString nicht lesbar (#88) |
| Scripts sofort committen | Neue Scripts nie nur im Chat zeigen -- sofort write_file + git commit (#89) |
| Offizielles Docs zuerst | Bei Problemen immer zuerst GitHub Issues + offizielle Doku pruefen |
| Autostart-Doppelpfad | Service nie ueber Task UND Start-Skript gleichzeitig starten -- Race Condition (#90) |
| WSL2 ohne Cap | Kein .wslconfig -> bis 50% RAM reservierbar, kein Reclaim -- immer memory= + autoMemoryReclaim setzen (#92) |
| Scheduled Tasks ohne -Hidden | Sichtbares Konsolenfenster -- beim Schliessen stirbt der Prozess mit STATUS_CONTROL_C_EXIT (#93) |

## Fahrplan (Stand 2026-06-29)
Phase 1   abgeschlossen -- Windows Haertung
Phase 2   abgeschlossen -- VPN OpSec
Phase 3   abgeschlossen -- LibreWolf
Phase MCP abgeschlossen -- Claude Desktop + Obsidian
Phase 4   abgeschlossen -- Cache Optimizer + PII-Scrubber
Phase 5   abgeschlossen -- AppSec (gitleaks + PSScriptAnalyzer)
Phase 6   abgeschlossen -- Reverse Engineering + Fire TV Hardening
Phase 7   abgeschlossen -- Hardware Forensik (Ghidra, Binwalk, Fire TV OTA RE)
Phase 8   abgeschlossen -- AI Red Teaming (Garak 38.43% ASR, DanInTheWild 512 Proben, Run 6 -- Pilot-Run zeigte 0% bei nur 3 Proben, nicht repraesentativ)
Phase 9   abgeschlossen -- Semi-Autonome Orchestrierung
Phase 10  abgeschlossen -- Infrastruktur (n8n, AnythingLLM, repomix)
Phase 11  abgeschlossen -- Agentic Loop (LLMLingua, LangFuse, Instructor, LangGraph, MCP)
Phase 12  abgeschlossen -- Haertung & Determinismus (pwsh Guardrails, SBOM, MCP)
Phase 13  abgeschlossen -- Kontrolliertes Vault-Wachstum (AgenticLoop v2.1, Telemetrie)
Phase 14  abgeschlossen -- RAG & Semantische Vault-Suche (AnythingLLM, search_vault)
Phase 15  abgeschlossen -- Content OS (alle Texte fertig, Plattformen offen)
Content OS Phase 1 offen -- Substack, Gumroad, Lemon Squeezy, GitHub live schalten

## Verknuepfte Notizen
- [[Master-Prompt]] _(sanitized)_
- [[Behaviour_Addendum_v1.1]]
- [[Tech-Stack-v2.0]]
- _(internal)_
- _(internal)_
- [[Fehler_Chronologie_Kumulativ]]
