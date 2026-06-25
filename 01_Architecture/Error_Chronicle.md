---
tags: [audit, fehler-chronologie, lessons-learned]
date: 2026-06-19
updated: 2026-06-23
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

## Prävention — Regeln (kumulativ, Stand 2026-06-24)

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
| Phase 14 — `execute_safe_pwsh` kein Output: `-Command` mit Multiline-Script bricht auf Windows — Fix: Script via Temp-Datei + `-File` | 73 |
| Phase 14 — `search_vault` HTML statt JSON: `docker exec curl` findet curl nicht im Node-PATH — Fix: absoluter Pfad `C:\Program Files\Git\mingw64\bin\curl.exe` | 74 |
| Phase 14 — Orchestrator `$steps.Count` Fehler: PowerShell unboxt List zu Einzelobjekt — Fix: `@(Get-PhaseSteps ...)` | 75 |
| Phase 14 — Orchestrator Parser 0 Schritte: Phase14_Plan.md nutzt `##` statt `###` — Fix: Regex `^#{2,3} ` | 76 |
| Phase 14 — Orchestrator Schritt-Regex: nummerierte Listen `1.` nicht erkannt — Fix: `(?:[-*]|\d+\.)` | 77 |

## Verknüpfte Notizen
- [[Projekt_Handbuch]]
- _(internal)_
- _(internal)_
