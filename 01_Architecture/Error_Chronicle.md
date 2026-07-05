---
tags: [audit, fehler-chronologie, lessons-learned]
date: 2026-06-19
updated: 2026-07-04
status: ✅ Aktiv
title: Fehler-Chronologie — Kumulativ
---

# Fehler-Chronologie — Kumulativ

Alle Fehler werden hier laufend ergänzt. Niemals löschen — nur ergänzen.
Format: Nr | Fehler | Kategorie | Ursache | Lösung

---

## Addendum-Setup (2026-06-18)

| Nr | Fehler | Kategorie | Ursache | Lösung |
|---|---|---|---|---|
| A1 | Missing closing ')' | SYNTAX | Mehrzeiliger Admin-Check direkt in Konsole eingefügt | Als .ps1 speichern, mit -File ausführen |
| A2 | Script file not recognized | PFAD | Verweis auf nicht existierende Datei | Datei erst erstellen, dann referenzieren |
| A3 | Cannot bind argument Path - null | PFAD | Variable aus alter Session nicht verfügbar | $env:USERPROFILE inline auflösen |

---

## Phase 1 — Windows Härtung
Siehe Phase1_Retrospektive.md (Fehler 1–8)

---

## Phase 2 — VPN OpSec

| Nr | Fehler | Kategorie | Ursache | Lösung |
|---|---|---|---|---|
| 9 | SHA256 Encoding-Problem | SYNTAX | UTF8.GetString() falsch verwendet | Korrekter Encoding-Cast |
| 10 | local-settings.js fehlt | PFAD | Datei muss manuell angelegt werden | Out-File vor Konfiguration |
| 11 | Wi-Fi Metric = VPN Metric (beide 0) | KONFLIKT | Gleiche Interface-Metrik — kein klares Routing | Wi-Fi Metric auf 100 setzen |
| 12 | VPN Watchdog: *WireGuard* trifft nicht | KONFLIKT | Adapter heißt "Mullvad Tunnel", nicht "WireGuard" | Filter auf *Mullvad* |
| 13 | Get-Service PermissionDenied (WaaSMedicSvc) | BERECHTIGUNG | Geschützter Dienst | -ErrorAction SilentlyContinue |

---

## Phase MCP — Claude Desktop + Obsidian

| Nr | Fehler | Kategorie | Ursache | Lösung |
|---|---|---|---|---|
| 14a | Node MSI Exit Code 1603 | KONFLIKT | Neuere Node-Version bereits installiert | winget list vor Installation prüfen |
| 14b | nvm not recognized | PFAD | nvm-Befehl vor Installation | Erst installieren, dann Terminal neu starten |
| 14c | Node-Deinstallation versehentlich | PROZESS | Destruktiver Block ohne Bestätigung | Uninstall/Remove nur nach expliziter Freigabe |

---

## Phase 4 — Cache Optimizer / OpenRouter

| Nr | Fehler | Kategorie | Ursache | Lösung |
|---|---|---|---|---|
| 15 | Get-StoredCredential gibt null zurück | ABHÄNGIGKEIT | CredentialManager v2.0 — liest nur Generic, nicht Domain | Neu via New-StoredCredential -Type Generic |
| 16 | New-StoredCredential schlägt fehl | ABHÄNGIGKEIT | CredentialManager v2.0 inkompatibel mit pwsh 7 (.NET 6+) | DPAPI via ConvertFrom-SecureString + Out-File |
| 17 | API-Key Länge 23 statt 108 | SYNTAX | Strg+V in Read-Host hat Key abgeschnitten | Rechtsklick-Einfügen statt Strg+V |
| 18 | Anthropic API 402 | BILLING | Kein Guthaben | Credits laden oder OpenRouter nutzen |
| 19 | OpenRouter API 402 | BILLING | Kein Guthaben | Credits laden |
| 20 | Skript nicht gefunden (Invoke-AnthropicCached.ps1) | PFAD | Skript nur im Chat gezeigt, nicht auf Disk | Out-File explizit ausführen |
| 21 | -Verbose Konflikt in PIIScrubber | SYNTAX | [CmdletBinding()] + eigener -Verbose Parameter | -ShowMatches statt -Verbose verwenden |
| 22 | Master-Prompt Pfad v4.1 im Skript | PFAD | Invoke-AnthropicCached.ps1 referenzierte v4.1 | Pfad auf v4.2 korrigiert |

---

## Phase 5 — AppSec (2026-06-19)

| Nr | Fehler | Kategorie | Ursache | Lösung |
|---|---|---|---|---|
| 23 | C:\[USER]\Downloads nicht gefunden | PFAD | Verzeichnis existierte noch nicht | New-Item -Force vor Invoke-WebRequest |
| 24 | KeePassXC Hash: Boolean statt String | SYNTAX | -match auf Scalar gibt Boolean zurück | (Get-Content -First 1).Split()[0] verwenden |
| 25 | gitleaks winget "No upgrade" — nicht im PATH | ABHÄNGIGKEIT | winget hat Binary nicht installiert | Direktdownload GitHub + nach C:\[USER]\Scripts |
| 26 | edit_file scheitert bei Emoji/Sonderzeichen | ENCODING | MCP edit_file kann Emojis in oldText nicht matchen | Out-File zur kompletten Neuschreibung |
| 27 | PIIScrubber Regex-Replace für begin/process | SYNTAX | Regex zu komplex für mehrzeiligen -replace | Datei komplett neu schreiben |
| 28 | OpenRouter ZDR: zdr=$true doppelt + falsches Feld | SYNTAX | Copy-Paste + falscher Parameter-Name | provider = @{ data_collection = "deny" } |

---

## Phase 7 — Hardware Forensik (2026-06-20/21)

| Nr | Fehler | Kategorie | Ursache | Lösung |
|---|---|---|---|---|
| 29 | Binwalk Python 3.14 inkompatibel | ABHÄNGIGKEIT | Binwalk braucht Python ≤3.11, pip-Install schlägt fehl | WSL2 Ubuntu — dort Python 3.10 nativ |
| 30 | WSL1 nicht unterstützt | KONFIGURATION | Hardware-Virtualisierung nicht aktiviert | WSL2 via wsl --set-default-version 2 |
| 31 | ADB: device not found | ABHÄNGIGKEIT | USB-Debugging nicht aktiviert auf Fire TV | Settings → Developer Options → ADB on |
| 32 | Frida Server: permission denied | BERECHTIGUNG | Fire TV nicht gerootet — Frida Server braucht root | Frida ohne root: nur USB-Frida möglich |

---

## Phase 8 — AI Red Teaming (2026-06-21)

| Nr | Fehler | Kategorie | Ursache | Lösung |
|---|---|---|---|---|
| 33 | Garak + LiteLLM: temperature + top_p gleichzeitig | KONFLIKT | Anthropic API erlaubt nicht beide Parameter gleichzeitig | top_p in LiteLLM-Generator auskommentieren (Zeile 161) |
| 34 | Garak -m/-n deprecated | SYNTAX | Alte Flags nicht mehr unterstützt | --target_type / --target_name verwenden |
| 35 | API-Key im Terminal-Output exponiert | SECURITY | Key in Umgebungsvariable, im Output sichtbar | Sofortige Rotation, DPAPI-Speicherung |
| 36 | PyRIT datasets-Konflikt | ABHÄNGIGKEIT | datasets-Paket inkompatibel mit aktueller Umgebung | Separate venv für PyRIT (ausstehend) |
| 37 | Garak MitigationBypass: hohe False-Positive-Rate | INTERPRETATION | Detector sehr sensitiv — ASR-Zahlen irreführend | Raw-ASR mit Skepsis behandeln, manuell validieren |

---

## Phase 9 — Semi-Autonome Orchestrierung (2026-06-22)

| Nr | Fehler | Kategorie | Ursache | Lösung |
|---|---|---|---|---|
| 38 | Git Hook #!/bin/sh schlägt fehl auf Windows | KONFLIKT | Windows kennt kein sh — Shebang wird ignoriert | Hook als pwsh.exe Aufruf schreiben |
| 39 | Invoke-PhaseOrchestrator: Frontmatter in Blöcken | PARSING | Regex traf YAML-Frontmatter als Block | Frontmatter-Filter vor Block-Parsing |
| 40 | L3-Erkennung zu aggressiv | LOGIK | Pattern traf Wörter im Block-Body statt nur Titel | Regex nur gegen Schritt-Titel anwenden |
| 41 | Wikilinks in Blockinhalt störten Parsing | PARSING | [[Link]] wurde als Schritt-Titel erkannt | Wikilink-Filter (\[\[.*?\]\]) vor Auswertung |

---

## Phase 10 — Infrastruktur-Ausbau (2026-06-22)

| Nr | Fehler | Kategorie | Ursache | Lösung |
|---|---|---|---|---|
| 42 | icacls: Ungültiger Parameter (OI)(CI)M | SYNTAX | Deutsche Windows-Version akzeptiert keine englischen ACL-Flags | icacls /grant "[USER]:(OI)(CI)F" — F statt M |
| 43 | Move-Item: Access denied auf 16_ARCHIVE | BERECHTIGUNG | ACL Read-Only aus Phase 4 | icacls Vollzugriff grant vor Move, danach entfernen |
| 44 | PowerShell Heredoc $redirect11 not set | SYNTAX | Schließendes "@ nicht auf eigener Zeile ohne Leerzeichen | Heredoc korrekt abschließen oder @"..."@ trennen |
| 45 | n8n PM2: Init system not found | ABHÄNGIGKEIT | PM2 kennt kein Windows Init-System | NSSM statt PM2 für Windows Services |
| 46 | n8n Task Scheduler: status Queued | KONFLIKT | pwsh + .ps1 + Task Scheduler nicht zuverlässig für Node-Apps | NSSM direkt mit node.exe |
| 47 | cloudflared winget: nicht im PATH | PFAD | winget-Installation schlug still fehl | Direktdownload nach C:\[USER]\Tools\cloudflared.exe |
| 48 | MCP fu75ch1-vault: disconnect bei langen Sessions | NETZWERK | npx lädt Server neu bei jedem Start — Timeout möglich | @modelcontextprotocol/server-filesystem global installieren, node direkt in Config |
| 49 | Claude Desktop Pfad: claude.exe nicht gefunden | PFAD | Pfad war %USERPROFILE%\AppData\Local\Claude\ statt AnthropicClaude\ | Korrekt: %USERPROFILE%\AppData\Local\AnthropicClaude\claude.exe |
| 50 | AnythingLLM: LocalAI URL gefordert | KONFIGURATION | LocalAI ist separater Server — nicht built-in | Built-in Embedder wählen, nicht LocalAI |
| 51 | AnythingLLM: doppelte Dokumente (Obsidian + Local Dir) | DUPLIKAT | Beide Connectoren gleichzeitig aktiv | Nur Obsidian-Connector behalten (80 saubere MDs) |

---

## Phase 11 — Agentic Loop (2026-06-22)

| Nr | Fehler | Kategorie | Ursache | Lösung |
|---|---|---|---|---|
| 52 | LLMLingua: Token indices > 512 | ABHÄNGIGKEIT | BERT-Modell max 512 Token — Master-Prompt zu lang | Text in Chunks à 250 Wörter aufteilen vor Komprimierung |
| 53 | Python Script ParserError in PS-Konsole | SYNTAX | Python-Code direkt in PS-Konsole eingefügt | Immer Out-File + python <pfad> — nie direkt einfügen |
| 54 | LangFuse Web: Restarting nach S3 Upload Fehler | KONFIGURATION | MINIO_ROOT_PASSWORD Custom gesetzt aber S3-Keys noch auf Default | Alle LANGFUSE_S3_*_SECRET_ACCESS_KEY explizit in .env setzen |
| 55 | LangFuse v4: decorators nicht mehr vorhanden | API-ÄNDERUNG | v4 nutzt OpenTelemetry-basiertes API — alte Methoden entfernt | get_client() + start_as_current_observation(as_type="span") |
| 56 | LangFuse v4: trace() nicht vorhanden | API-ÄNDERUNG | Gleiche Ursache wie #55 | Gleiche Lösung wie #55 |
| 57 | LangFuse v4: start_as_current_span() nicht vorhanden | API-ÄNDERUNG | Gleiche Ursache wie #55 | start_as_current_observation() |
| 58 | LangFuse Export Timeout | NETZWERK | Docker Desktop nicht gestartet — Container offline | docker compose up -d vor Loop-Nutzung |
| 59 | Instructor IncompleteOutputException | ABHÄNGIGKEIT | max_tokens=300 zu niedrig für Pydantic-Schema-Generierung | max_tokens=500 Minimum für Instructor-Calls |
| 60 | websockets Konflikt: frida-tools vs langgraph | ABHÄNGIGKEIT | frida-tools erwartet websockets<14, langgraph zieht 15.x | Frida in separatem venv isolieren |
| 61 | Garak: Dan_11_0 inaktiv (tier=9) | KONFIGURATION | In Garak v0.15.1 deaktiviert | Ablation_Dan_11_0 oder AutoDANCached verwenden |
| 62 | Garak: ANTHROPIC_API_KEY nicht in venv gesetzt | KONFIGURATION | Key via DPAPI geladen aber nicht als Env-Var exportiert | $env:ANTHROPIC_API_KEY explizit setzen vor Garak-Aufruf |
| 63 | Garak: DanInTheWild hängt (kein Output) | ABHÄNGIGKEIT | Dataset-Download von HuggingFace via Mullvad zu langsam/blockiert | Ablation_Dan_11_0 verwenden (lokale Prompts, kein Download) |
| 64 | $script: Scope in PS-Funktionen | SYNTAX | $variable in Funktion ändert lokale Kopie, nicht globale | $script:variable statt $variable in Funktionen |
| 65 | MCP str_replace: Datei nicht gefunden nach read | PFAD | MCP-Server cached Pfade — str_replace findet Datei nicht | write_file statt str_replace für Vault-Dateien nutzen |

---

## Phase 12 — Härtung & Determinismus (2026-06-23)

| Nr | Fehler | Kategorie | Ursache | Lösung |
|---|---|---|---|---|
| 66 | Memos nicht erreichbar (localhost:5230) | KONFIGURATION | Container ohne --restart-Flag — nach Docker-Neustart gestoppt | `docker update --restart unless-stopped memos` |
| 67 | Memos API-Token im Chat exponiert | SECURITY | Token via Notepad als Zwischenspeicher, versehentlich mit Befehl eingefügt | Direkt KeePassXC → Terminal — kein Notepad, keine Editoren als Zwischenspeicher für sensitive Werte |

---

## Phase 13 — Kontrolliertes Vault-Wachstum (2026-06-24)

| Nr | Fehler | Kategorie | Ursache | Lösung |
|---|---|---|---|---|
| 68 | Memos API GET gibt leeres Array zurück trotz vorhandener Memos | AUTH | Bearer Token fehlte — Memos v0.29 verlangt Auth für alle Endpunkte inkl. GET | Authorization Header mit Memos PAT setzen |
| 69 | n8n PATCH: Authorization failed | AUTH | n8n API Token statt Memos PAT im Credential eingetragen | Memos PAT (`memos_pat_...`) — nicht n8n API Token |
| 70 | n8n PATCH: Bad request — update mask is required | API | Memos v0.29 verlangt `?updateMask=content` bei PATCH | URL: `.../memos/{id}?updateMask=content` |
| 71 | n8n HTTP Request: Auth via Credential schlägt fehl bei PATCH | N8N | n8n Generic Credential Type überträgt Header nicht korrekt bei PATCH | Send Headers manuell aktivieren + Authorization Header direkt setzen |
| 72 | Memos filter=tag='vault' gibt Fehler | API | Memos AIP-160 unterstützt keinen tag-Vergleich via filter-Parameter | Client-seitige Filterung auf tags-Array — alle Memos abrufen, dann filtern |

---

## Phase 14 — RAG & Semantische Vault-Suche (2026-06-24)

| Nr | Fehler | Kategorie | Ursache | Lösung |
|---|---|---|---|---|
| 73 | execute_safe_pwsh kein Output bei Multiline-Script | PFAD | `-Command` mit Multiline-Script bricht auf Windows | Script via Temp-Datei + `-File` |
| 74 | search_vault HTML statt JSON | PFAD | docker exec curl findet curl nicht in Node-PATH | Absoluter Pfad `C:\Program Files\Git\mingw64\bin\curl.exe` |
| 75 | Orchestrator `$steps.Count` Fehler | SYNTAX | PowerShell unboxt List zu Einzelobjekt | `@(Get-PhaseSteps ...)` |
| 76 | Orchestrator Parser 0 Schritte | PARSING | Phase14_Plan.md nutzt `##` statt `###` | Regex `^#{2,3} ` |
| 77 | Orchestrator Schritt-Regex: nummerierte Listen nicht erkannt | PARSING | `1.` nicht im Pattern | `(?:[-*]|\d+\.)` |

---

## Phase 15 — Content OS & Public Export (2026-06-25)

| Nr | Fehler | Kategorie | Ursache | Lösung |
|---|---|---|---|---|
| 78 | Invoke-PublicExport-v2.ps1 nicht erkannt aus System32 | PFAD | Relativer Pfad `.\Script.ps1` funktioniert nicht aus C:\Windows\System32 | `Set-Location` in Workflow-Ordner zuerst, oder absoluten Pfad via `pwsh -File` |
| 79 | Export meldet "30 exportiert" obwohl keine Dateien geschrieben | DRYRUN | Beide Befehle (DryRun + echter Run) enthielten `-DryRun` — zweiter Aufruf nicht bereinigt | DryRun-Zähler im Script von echtem Export-Zähler trennen (v2.2) |
| 80 | Git Commit durch gitleaks blockiert: `sk-DEMO-REDACTED` im Pitch-Deck | SECURITY | Beispiel-String im HTML-Code-Block hat `sk-` Pattern — gitleaks erkennt als API-Key | Demo-Keys nie mit echten Key-Präfixen (`sk-`, `Bearer`) — `DEMO-KEY-REDACTED` verwenden |
| 81 | Git Commit still fehlgeschlagen (kein neuer Hash) | PROZESS | Commit-Message enthielt Umlaute — in MCP-Kontext führte das zu stummem Fehler | ASCII-only Commit-Messages in execute_safe_pwsh |
| 82 | Gitleaks `--staged` Flag nicht unterstützt | SYNTAX | Diese gitleaks-Version kennt `git --staged` nicht | `detect --source <patch_file> --no-git` als Workaround |

---

## Prävention — Regeln (kumulativ, Stand 2026-06-25)

| Regel | Abgeleitet aus |
|---|---|
| Mehrzeilige Skripte als .ps1 speichern, nie direkt einfügen | A1, 53 |
| $env:USERPROFILE inline auflösen, nie Session-Variablen | A3 |
| winget list VOR jeder Installation prüfen | 14a |
| Destruktive Blöcke (Uninstall/Remove) nur nach expliziter Freigabe | 14c |
| CredentialManager v2.0 nicht unter pwsh 7 nutzen — DPAPI bevorzugen | 15+16 |
| API-Keys via Rechtsklick einfügen, nicht Strg+V in Read-Host | 17 |
| Credits prüfen bevor API-Integration gestartet wird | 18+19 |
| Skripte immer sofort via Out-File speichern | 20 |
| New-Item -Force vor Invoke-WebRequest auf neue Pfade | 23 |
| edit_file bei Emojis: Out-File zur Neuschreibung nutzen | 26 |
| Komplexe Regex-Replace in PS: Datei komplett neu schreiben | 27 |
| OpenRouter ZDR: Privacy Settings + Allowed Providers (nur Anthropic) | 28 |
| winget-Installation via Binary-Version prüfen | 25 |
| Python >3.11 für Binwalk: WSL2 verwenden | 29 |
| Garak: top_p + temperature nicht gleichzeitig — top_p auskommentieren | 33 |
| Garak: --target_type/--target_name + --generations 1 | 34 |
| API-Keys nie in Terminal-Output sichtbar lassen | 35 |
| Git Hooks auf Windows: pwsh.exe statt #!/bin/sh | 38 |
| Regex-Pattern nur gegen Schritt-Titel, nicht Block-Body | 40 |
| icacls auf deutschem Windows: F statt M/OI/CI | 42 |
| Windows Services: NSSM statt PM2 oder Task Scheduler | 45+46 |
| MCP-Server: node direkt statt npx — kein Disconnect | 48 |
| Nur einen Dokumenten-Connector in AnythingLLM aktiv lassen | 51 |
| LLMLingua: Chunks à 250 Wörter — Modell-Limit 512 Token | 52 |
| LangFuse Docker: vor Loop immer docker compose up -d prüfen | 58 |
| Instructor: min. max_tokens=500 für Pydantic-Schema | 59 |
| Frida in separatem venv — websockets-Konflikt mit langgraph | 60 |
| Garak Dan_11_0 inaktiv → Ablation_Dan_11_0 nutzen | 61 |
| $script: Scope in PS-Funktionen für globale Variablen | 64 |
| Vault-Dateien: write_file statt str_replace — zuverlässiger | 65 |
| Docker-Container immer mit --restart unless-stopped starten/updaten | 66 |
| Sensitive Werte nie via Notepad als Zwischenspeicher — direkt KeePassXC → Terminal | 67 |
| Memos v0.29 verlangt Bearer Token für alle API-Calls inkl. GET | 68 |
| n8n Credential für Memos: Memos PAT (`memos_pat_...`) — nicht n8n API Token | 69 |
| Memos PATCH immer mit `?updateMask=content` | 70 |
| n8n PATCH Auth: Send Headers manuell — nicht via Generic Credential | 71 |
| Memos tag-Filter: client-seitig auf tags-Array — filter-Parameter nicht verwenden | 72 |
| Scripts aus Workflow-Ordner immer mit absolutem Pfad oder Set-Location aufrufen | 78 |
| DryRun-Zähler im Script von echtem Export-Zähler trennen | 79 |
| Demo-Keys nie mit echten Präfixen (sk-, Bearer) — DEMO-KEY-REDACTED verwenden | 80 |
| Commit-Messages in execute_safe_pwsh: ASCII-only, keine Umlaute | 81 |
| gitleaks staged: `detect --source <patch> --no-git` statt `git --staged` | 82 |
| Ein Service nur ueber EINEN automatisierten Mechanismus starten (nie Task + Start-Skript) | 90 |

## Verknüpfte Notizen
- [[Projekt_Handbuch]]
- _(internal)_
- _(internal)_
- [[Phase15_SecurityAudit_2026-06-25]]

## Phase 15 / Session 2026-06-29 — AnythingLLM

| Nr | Fehler | Kategorie | Ursache | Loesung | Praeventionsregel |
|---|---|---|---|---|---|
| 83 | AnythingLLM login schlaegt fehl: Could not validate login | KONFIGURATION | JWT_SECRET nicht als Container-ENV gesetzt — AUTH_TOKEN allein reicht nicht | Container neu mit -e JWT_SECRET=... erstellen | AUTH_TOKEN und JWT_SECRET immer zusammen setzen |
| 84 | AnythingLLM OpenRouter Modellname ungueltig | KONFIGURATION | claude-haiku-4-5-20251001 und claude-haiku-4-5 nicht mehr gueltig auf OpenRouter | anthropic/claude-haiku-4.5 (mit Punkt) verwenden | OpenRouter Modellnamen immer auf openrouter.ai pruefen |

## Session 2026-06-29 — Autostart / Telemetrie / AgenticLoop v2

| Nr | Fehler | Kategorie | Ursache | Loesung | Praeventionsregel |
|---|---|---|---|---|---|
| 85 | Get-fu75ch1-Stats.ps1: Switch-Variable kann nicht abgerufen werden | SYNTAX | Set-StrictMode -Version Latest VOR param() — Switch-Parameter werden als undefiniert behandelt | param()-Block immer als allererstes nach #Requires und Comment-Block, Set-StrictMode danach | In allen PS-Scripts mit param(): param() zuerst, Set-StrictMode nach param() |
| 86 | Install-fu75ch1-Autostart.ps1: ParameterSet kann nicht aufgeloest werden | SYNTAX | [Parameter(ParameterSetName='Install')] mit explizitem $Install-Switch — Default-Aufruf ohne Parameter bricht | ParameterSetName-Attribute entfernen, einfache [switch]-Parameter ohne Sets verwenden | ParameterSetName nur wenn wirklich moeglich exklusive Sets benoetigt werden |
| 87 | Get-fu75ch1-Stats.ps1 -Live: Substring() auf DateTime-Objekt | SYNTAX | SQLite row_factory liefert ts als Python-Objekt, ConvertFrom-Json deserialisiert als DateTime statt String | [string]$r.ts -replace 'T',' ' vor Substring() — expliziter Cast zu String | SQLite-Timestamps immer mit [string]-Cast behandeln |
| 88 | AgenticLoop /generate-note: API-Key als SecureString nicht lesbar | KONFIGURATION | .anthropic_key enthaelt PowerShell-SecureString (01000000...) statt Klartext — Loop benoetigt Klartext | API-Key als Klartext in .anthropic_key speichern (separate Datei, nur user-readable) | Fuer Python-Scripts: API-Keys als Klartext in dedizierten Key-Files, nicht als PS-SecureString |
| 89 | Invoke-AgenticLoop.py nicht persistent — ging nach Session-Ende verloren | PROZESS | Script wurde nur im Arbeitsspeicher der Session erstellt, nie als Datei gespeichert | Script via write_file dauerhaft in 10_Workflows/ speichern | Neue Scripts immer sofort committen — nie nur im Chat zeigen |

## Session 2026-06-30 — AgenticLoop Race Condition

| Nr | Fehler | Kategorie | Ursache | Loesung | Praeventionsregel |
|---|---|---|---|---|---|
| 90 | fu75ch1-AgenticLoop Task terminiert mit STATUS_CONTROL_C_EXIT (0xC000013A) nach erfolgreichem Bind auf Port 5231 | PROZESS | Zwei unabhaengige Start-Mechanismen fuer denselben Service: dedizierter Task 'fu75ch1-AgenticLoop' (+20s nach Login) UND Start-AllServices-Funktion in Invoke-fu75ch1-Start.ps1 (aufgerufen vom Autostart-Wrapper, +27s), beide pruefen/starten auf Port 5231 -- Race Condition bei ungluecklichem Timing | Start-Process-Aufruf aus Start-AllServices entfernt (nur noch Status-Check via Test-Port); AgenticLoop wird jetzt ausschliesslich vom dedizierten Task gestartet. Zusaetzlich: HTTPServer-Bind in try/except gekapselt (OSError -> sauberer Log-Eintrag statt unbehandelter Crash), serve_forever() in try/except mit Shutdown-Logging (v2.3) | Ein Service darf nur ueber EINEN automatisierten Mechanismus gestartet werden -- nie ueber Task UND Start-Skript gleichzeitig |

## Session 2026-06-30 -- Performance-Optimierung (RAM/CPU)

| Nr | Fehler | Kategorie | Ursache | Loesung | Praeventionsregel |
|---|---|---|---|---|---|
| 91 | LangFuse-Stack (6 Container) verbraucht ~2.2 GB RAM dauerhaft im Leerlauf (0-2% CPU) | PERFORMANCE | docker compose up -d fuer LangFuse lief bei jedem Login automatisch in Start-AllServices, unabhaengig von tatsaechlicher Nutzung | LangFuse-Autostart aus Invoke-fu75ch1-Start.ps1 entfernt, on-demand via neuem Schalter 'fu75 -LangFuse' (Docker-Volumes/Daten bleiben erhalten, kein Funktionsverlust) | Services mit seltener Nutzung (Observability/Tracking-Tools) grundsaetzlich on-demand statt Autostart |
| 92 | WSL2/Docker-VM (vmmemWSL) ohne Speicher-Cap -- bis zu 50% RAM (7.58 GiB) reservierbar, kein automatisches Memory-Reclaim | PERFORMANCE | Keine .wslconfig vorhanden -- WSL2-Standardverhalten gibt einmal belegten Speicher nicht automatisch zurueck | .wslconfig erstellt: memory=6GB, processors=4, swap=2GB, autoMemoryReclaim=gradual -- per 'wsl --shutdown' aktiviert, RAM-Limit verifiziert auf 5.79 GiB gesunken | Bei Docker Desktop/WSL2-Nutzung immer .wslconfig mit explizitem Cap + autoMemoryReclaim setzen |

Hinweis: ToDo-Eintrag "Get-Credits Duplikat im PS-Profil" war bei Pruefung (2026-06-30) bereits falsch -- nur eine Definition in PS7-Profil vorhanden, keine in PS5.1 oder im L2Curation-Modul. Als erledigt/obsolet markiert, kein Code-Fehler.

## Session 2026-06-30 -- Telemetry-Stabilitaet (Folgefehler zu #90)

| Nr | Fehler | Kategorie | Ursache | Loesung | Praeventionsregel |
|---|---|---|---|---|---|
| 93 | fu75ch1-Telemetry Task terminiert ebenfalls mit STATUS_CONTROL_C_EXIT (0xC000013A), OBWOHL kein Doppelstart-Pfad existiert wie bei #90 -- AgenticLoop und Telemetry beide betroffen, Lebensdauer 14-60 Min variabel | PROZESS | Beide Tasks (fu75ch1-AgenticLoop, fu75ch1-Telemetry) wurden nie ueber ein gespeichertes Installer-Skript registriert (ad-hoc aus frueherer Session, gleiches Muster wie #89) und liefen mit Settings.Hidden=False -- jeder Start oeffnete ein SICHTBARES Konsolenfenster. Wird dieses geschlossen, terminiert der Prozess mit genau diesem Fehlercode | Neues Skript Install-fu75ch1-BackgroundTasks.ps1 erstellt: registriert beide Tasks idempotent MIT -Hidden. Laufende Tasks live per Register-ScheduledTask -Force auf Hidden=True umgestellt, ueber 4+ Min ohne Absturz verifiziert | Scheduled Tasks fuer Hintergrunddienste IMMER mit -Hidden registrieren UND als Installer-Skript speichern, nie ad-hoc in der Session anlegen |

## Session 2026-06-30 -- Garak Run 5 (DanInTheWild + HijackHateHumans)

| Nr | Fehler | Kategorie | Ursache | Loesung | Praeventionsregel |
|---|---|---|---|---|---|
| 94 | execute_safe_pwsh-gestartete Hintergrundprozesse (Start-Process) brechen nach exakt ~20-25s ohne Fehlermeldung ab | PROZESS | MCP-Shell-Wrapper killt vermutlich die eigene Prozessgruppe/Job-Object inkl. aller Kindprozesse nach internem Timeout, unabhaengig davon ob Start-Process genutzt wird | Lange Laeufe (>20s) ueber einmaligen Scheduled Task entkoppeln (gleicher Mechanismus wie Fehler #93), dann separat per Folge-Aufrufen pollen statt im selben Call warten | Jeder Prozess, der laenger als ~20s laufen soll, MUSS ueber Scheduled Task entkoppelt werden -- niemals direkt per Start-Process im MCP-Shell-Call erwarten |
| 95 | litellm.UnsupportedParamsError: anthropic does not support parameters presence_penalty/frequency_penalty, trotz self.litellm.drop_params=True im Generator-Code | KOMPATIBILITAET | drop_params=True greift in dieser litellm-Version nicht zuverlaessig fuer alle Probes/Prompts; --generator_option_file mit suppressed_params wurde ebenfalls nicht angewendet (Ursache ungeklaert) | Direkter Patch in garak/generators/litellm.py: presence_penalty/frequency_penalty Zeilen im optional_params-Dict auskommentiert (gleiches Muster wie vorheriger top_p-Patch in derselben Datei) | Bei wiederholten Config-Fixes, die nicht greifen: lieber einmal sauber an der Quelle patchen statt mehrfach CLI-Flags durchprobieren -- Backup vor jedem Patch |

## Session 2026-07-01 -- PIIScrubber-Verdrahtung (nachgetragen 2026-07-04, siehe #103)

| Nr | Fehler | Kategorie | Ursache | Loesung | Praeventionsregel |
|---|---|---|---|---|---|
| 96 | Invoke-PIIScrubber: Hostname-Scrub-Regex fehlerhaft bei leerem $env:COMPUTERNAME | LOGIK | Der Wert von $env:COMPUTERNAME wurde ungeprueft in die Scrub-Regex eingesetzt -- ist die Variable leer, entsteht eine leere Regex-Alternative mit fehlerhaftem Match-Verhalten | Guard eingebaut: Hostname-Pattern wird nur in die Regex aufgenommen, wenn $env:COMPUTERNAME nicht leer ist (Invoke-AnthropicCached.ps1 v2.1, commit 6c34b46) | Umgebungsvariablen nie ungeprueft in Regex-Alternativen einsetzen -- immer Empty/Null-Guard davor |

## Session 2026-07-01 -- Streamlit Dashboard

| Nr | Fehler | Kategorie | Ursache | Loesung | Praeventionsregel |
|---|---|---|---|---|---|
| 97 | Dashboard zeigt OpSec Score 25/34 statt 30/34 | LOGIK | re.search() trifft ersten Match von 'OpSec Score: N/34' in Offene_Punkte_ToDo.md -- dieser liegt im chronologischen 'Erledigt'-Verlauf (Baseline-Wert 25/34 vor Fixes), nicht im massgeblichen Abschnitt 'Aktueller Stand' (30/34) | Suche auf Text nach '## Aktueller Stand' eingegrenzt; Fallback auf letzten Match im Gesamtdokument | Bei Parsing von Markdown-Dateien mit chronologischem Verlauf: nie ersten Match nehmen -- Status-Werte stehen im 'Aktueller Stand'-Abschnitt am Ende, nicht am Anfang |
| 98 | RAM-Auslastung und AgenticLoop zeigen 'n/a' -- PerfCheck-Subprocess liefert kein valides JSON | PARSING | PS-Profil schreibt WARNING-Zeile (Invoke-L2Curation unapproved verbs) + ANSI-Farbcodes vor den JSON-Output; subprocess.run mit capture_output mischt stderr/stdout -- json.loads() bricht an den Sonderzeichen ab | pwsh -NoProfile verhindert Profil-WARNING; ANSI-Escape-Regex-Strip (\x1b\[[0-9;]*m) vor json.loads(); ab erstem '{' im Output parsen | PS-Subprocesses aus Python immer mit -NoProfile aufrufen; stdout vor JSON-Parse immer ANSI-strippen |
| 99 | JSON-Parse bricht bei verschachteltem docker-Array ab (char 1022) | LOGIK | Zweiter Fix-Versuch nutzte zeilenweisen '}'-Detektor als JSON-Ende-Marker -- traf erste innere Klammer im docker-Array statt abschliessende aeussere | Gesamten stdout ab erstem '{' nehmen (json_start = clean_out.find('{'); json_str = clean_out[json_start:]) -- Python's json.loads() parst selbst korrekt bis zum Ende | Nie eigenen JSON-Ende-Detektor bauen -- json.loads() ist zustaendig; nur Praefixe (nicht-JSON-Zeilen) entfernen |

## Session 2026-07-01 -- OpSec Fixes + Audit-Patch

| Nr | Fehler | Kategorie | Ursache | Loesung | Praeventionsregel |
|---|---|---|---|---|---|
| 100 | Invoke-OpSecFix-v1.0.ps1: Check 31 wirft 'The property Count cannot be found on this object' | SYNTAX | Where-Object gibt bei genau einem Treffer ein einzelnes Objekt zurueck, kein Array -- .Count existiert nicht auf einzelnen Objekten in PowerShell | @() um Where-Object-Ausdruck erzwingt Array-Typ unabhaengig von Trefferzahl (0/1/n) | PowerShell: Where-Object-Ergebnis IMMER in @() einwickeln wenn .Count benoetigt wird |
| 101 | Check 31 meldet [X] obwohl keine fremden Eintraege in der ACL vorhanden sind -- OpSec Score bleibt 30/34 nach Fix | LOGIK | Audit- und Fix-Skript prueften alle ACL-Eintraege inkl. geerbter (IsInherited=True); Username-Match gegen '[USER]' traf nicht auf '[HOSTNAME]\[USER]' weil Regex-Match gegen vollen String lief und geerbte Eintraege nicht gefiltert wurden | IsInherited-Filter hinzugefuegt (geerbte Eintraege sind OS-Standard, kein Risiko); Username-Match als Suffix-Pattern gegen $userSuffix statt Exact-Match | ACL-Checks in PowerShell: IsInherited-Eintraege explizit herausfiltern; IdentityReference immer als 'Domain\User'-Suffix matchen, nie als Exact-Match gegen $env:USERNAME |

## Session 2026-07-02 -- LangFuse RAM-Drift (wiederholt)

| Nr | Fehler | Kategorie | Ursache | Loesung | Praeventionsregel |
|---|---|---|---|---|---|
| 102 | LangFuse-Container liefen wiederholt trotz manuellem 'docker compose stop' und trotz Fehler-#91-Fix (Autostart entfernt) -- RAM-WARN (85-94%) zweimal in derselben Session erneut aufgetreten | KONFIGURATION | docker-compose.yml setzte 'restart: always' auf allen 6 Services -- diese Policy startet Container bei jedem Docker-Daemon-Neustart automatisch neu (WSL2-Neustart, Sleep/Wake, Docker-Desktop-Update), unabhaengig vom manuellen Stop-Zustand. Fehler #91 hatte nur den expliziten Autostart-Eintrag entfernt, nicht die Container-eigene Restart-Policy | 1) Laufende Container: 'docker update --restart no' auf alle 6 LangFuse-Container. 2) Quelle: docker-compose.yml -- 'restart: always' auf allen 6 Services zu 'restart: \"no\"' geaendert (Backup vor Aenderung erstellt), damit kuenftige 'docker compose up' (via fu75 -LangFuse) die Policy nicht zuruecksetzen | Bei on-demand-Diensten IMMER pruefen: (a) kein Autostart-Task/-Setting UND (b) Container-Restart-Policy selbst auf 'no' -- ein On-Demand-Prinzip ist nur an einer Stelle zu setzen unvollstaendig, wenn Docker selbst eine gegenteilige Policy persistiert |

## Session 2026-07-04 -- Chronik-Audit (Review-Session)

| Nr | Fehler | Kategorie | Ursache | Loesung | Praeventionsregel |
|---|---|---|---|---|---|
| 103 | Fehler #96 (PIIScrubber COMPUTERNAME-Guard) wurde nie in die Fehler-Chronologie eingetragen -- Chronik sprang von #95 auf #97, waehrend Session_State und Commits #96 referenzierten. Widerspricht dem Kernclaim 'jeder Fehler nummeriert und dokumentiert' | PROZESS | Fehler wurde in Session_State und Commit-Message (6c34b46) dokumentiert, der Chronik-Eintrag aber vergessen -- kein automatischer Abgleich zwischen referenzierten Fehlernummern und tatsaechlich vorhandenen Chronik-Eintraegen | #96 nachgetragen (2026-07-04); Luecken-Check als Pruefpunkt in den Metrik-Konsistenz-Workflow aufgenommen (metrics.json + Invoke-MetricsCheck.ps1) | Fehlernummern-Sequenz regelmaessig auf Luecken pruefen -- jede in Session_State/Commits referenzierte Nummer MUSS einen Chronik-Eintrag haben |
