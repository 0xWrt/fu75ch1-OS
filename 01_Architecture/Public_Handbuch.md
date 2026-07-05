---
status: L2-Pending
source: agentic-loop
date: 2026-06-24
title: Personal AI Operating System — Nutzerhandbuch (Public)
---

# Personal AI Operating System — Nutzerhandbuch (Public)

> Vollständige Referenz für Tools, Befehle und Agenten — Alle Phasen

---

## 0. Voraussetzungen — Bevor du mit AI arbeitest

> Dieses System setzt einen gehärteten Basis-Stack voraus. AI-Tools sind nur so vertrauenswürdig wie das System, auf dem sie laufen. Die folgenden Punkte sind keine Empfehlung — sie sind Grundbedingung.

| Bereich | Was erwartet wird | Warum |
|---|---|---|
| **Windows Härtung** | Attack Surface Reduction aktiv, UAC auf Maximum, unnötige Dienste deaktiviert | AI-Agenten haben Systemzugriff — ein ungepatchtes System ist ein Angriffspunkt |
| **Netzwerkebene** | Firewall-Regeln definiert, ausgehende Verbindungen kontrolliert | Verhindert ungewollte Datenabflüsse durch Tools oder Agenten |
| **DNS / VPN** | Privater DNS (z.B. NextDNS/Pi-hole), VPN aktiv bei sensiblen Sessions | DNS-Leaks und Metadaten-Tracking vermeiden |
| **KeePass** | Alle Credentials in verschlüsseltem Vault, keine Klartext-Keys im Filesystem | API-Keys für AI-Services sind hochwertige Angriffsziele |
| **Browser** | Gehärteter Browser (LibreWolf/Brave), separates Profil für AI-Web-Interfaces | Browser ist häufigster Angriffsvektor — kein Mix mit privatem Browsing |
| **Tools & Apps** | Nur geprüfte, notwendige Tools installiert — kein Software-Bloat | Jede App ist potenzielle Angriffsfläche |

**Kurzprüfung vor jeder Session:**

```powershell
# VPN aktiv?
Get-NetAdapter | Where-Object { $_.InterfaceDescription -like "*WireGuard*" -or $_.InterfaceDescription -like "*VPN*" } | Select-Object Name, Status

# Firewall aktiv?
Get-NetFirewallProfile | Select-Object Name, Enabled

# Keine unbekannten Prozesse mit Netzwerkzugriff?
Get-NetTCPConnection -State Established | Where-Object { $_.RemotePort -ne 443 -and $_.RemotePort -ne 80 } | Select-Object LocalPort, RemoteAddress, RemotePort
```

> Wer diesen Stack nicht hat, sollte ihn zuerst aufbauen — bevor AI-Tools produktiv eingesetzt werden. Der Rest dieses Handbuchs setzt ihn voraus.

---

## 1. Projektüberblick

### Phasen-Status

| Phase | Thema | Status |
|---|---|---|
| Phase 1 | Betriebssystem-Härtung | ✅ |
| Phase 2 | Netzwerk & Datenschutz (VPN, Leak-Tests) | ✅ |
| Phase 3 | Browser-Härtung & Content Blocking | ✅ |
| Phase 4 | Datenmaskierung & Scrubbing | ✅ |
| Phase 5 | Anwendungssicherheit & Secret Scanning | ✅ |
| Phase 6 | Reverse Engineering & Firmware-Analyse | ✅ |
| Phase 7 | Hardware-Forensik & Mobile-Sicherheit | ✅ (Erweiterungen offen) |
| Phase 8 | AI Red Teaming & Prompt Injection Tests | 🔄 in Evaluierung |
| Phase 9 | Halbautonome Orchestrierung | ✅ |
| Phase 10 | Infrastruktur & Workflow-Automation | ✅ |
| Phase 11 | Agentic Loop & Intelligente Agenten | ✅ |

---

## 2. Services & Infrastruktur

### 2.1 n8n — Workflow Automatisierung

n8n ist eine Plattform zur Automatisierung von Workflows zwischen verschiedenen Diensten und APIs.

```powershell
# Service-Status prüfen
Get-Service -Name "n8n" | Select-Object Name, Status, StartType

# Service neu starten
Restart-Service -Name "n8n"

# Web-Interface öffnen
# → http://localhost:5678
```

**Typische Anwendungen:**
- API-Integrationen automatisieren
- Daten zwischen Systemen synchronisieren
- Zeitgesteuerte Tasks ausführen
- Webhook-basierte Automatisierung

---

### 2.2 Cloudflare Tunnel

Tunnel ermöglicht sichere Zugriffe auf lokale Services über das Internet, ohne Router-Konfiguration.

```powershell
# Service-Status prüfen
Get-Service -Name "cloudflared" | Select-Object Name, Status, StartType

# Status beider kritischen Services
Get-Service -Name "n8n","cloudflared" | Select-Object Name, Status, StartType
```

**Wichtig:**
- Die öffentliche Tunnel-URL ändert sich bei jedem Neustart (bei kostenlosen Tunneln)
- Konfigurationsdatei wird im Vault gespeichert
- Ermöglicht Zero-Trust-Zugriff ohne Port-Forwarding

---

### 2.3 AnythingLLM

AnythingLLM ist eine Desktop-Anwendung für Dokumentenverwaltung und RAG (Retrieval Augmented Generation).

```
Starttyp: Manuelle Aktivierung erforderlich
Backend: Verbunden mit OpenRouter (mit Zero-Data-Retention)
Einbettungen: Built-in (lokale Modelle)
Suchbereich: Semantische Suche über Vault-Inhalte
```

**Workflow:**
1. Dokumente hochladen oder Vault-Ordner konfigurieren
2. Embeddings werden lokal generiert
3. Semantische Suche mit Abfragen durchführen
4. Generierte Antworten mit LLM

---

### 2.4 repomix

repomix konvertiert GitHub-Repositories in strukturierte Markdown-Dateien für Kontext-Integration.

```powershell
npx repomix --remote https://github.com/USER/REPO `
    --output %TOOLS%/REPO_overview.md `
    --style markdown
```

**Nutzen:**
- Schneller Überblick über fremde Code-Repositories
- Einbindung in LLM-Kontexte
- Dokumentation automatisieren

---

### 2.5 Docker Desktop

Containerisierung für lokale Mikroservices (LangFuse, Memos, etc.).

```powershell
# Docker Desktop starten
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"
Start-Sleep -Seconds 20

# Container-Übersicht
docker ps --format "table {{.Names}}\t{{.Status}}"

# LangFuse Stack (starten)
Set-Location "%TOOLS%/langfuse"
docker compose up -d

# LangFuse Stack (stoppen)
docker compose down
```

---

### 2.6 Memos — Quick-Capture für Notizen

Memos ist eine leichte Notiz-App für schnelle Einträge, Snippets und Links — als Zwischenschicht vor strukturierten Notizen.

```powershell
# Container-Status prüfen
docker ps --filter "name=memos" --format "{{.Names}} | {{.Image}} | {{.Status}}"

# Container manuell starten (falls gestoppt)
docker start memos

# Auto-Start aktivieren (nur einmalig nötig)
docker update --restart unless-stopped memos
```

| Parameter | Wert |
|---|---|
| Container-Image | `neosmemo/memos:0.29.1` |
| Zugang | `http://localhost:5230` |
| Persistente Daten | `%TOOLS%/memos-data` |
| Auto-Restart | Ja (mit Docker Desktop) |

**Häufiges Problem & Lösung:**

Memos ist nach Neustart nicht erreichbar?
1. **Sicherstellen:** Docker Desktop läuft (Tray-Icon überprüfen)
2. **Container-Status:** `docker ps -a | grep memos`
3. **Manueller Start:** `docker start memos`
4. **Dauerlösung:** `docker update --restart unless-stopped memos`

---

### 2.7 Memos API — Integration in Workflows

Memos stellt eine REST-API bereit. Wichtige Punkte:

| Punkt | Detail |
|---|---|
| **Authentifizierung** | Alle API-Calls (GET, POST, PATCH) benötigen Bearer-Token |
| **Token-Format** | Personal Access Token mit Format `[MEMOS-PAT-REDACTED]` |
| **Tag-Filterung** | Nicht via URL-Parameter — client-seitig auf `tags`-Array prüfen |
| **PATCH-Requests** | Erfordern `?updateMask=content` im URL-Query |
| **n8n-Integration** | Header manuell aktivieren (Generic Credential Type ist fehleranfällig) |

**Beispiel-Workflow (n8n):**

```
1. Schedule Trigger (alle 15 Min)
   ↓
2. HTTP GET → http://localhost:5230/api/v1/memos
   Header: Authorization: Bearer <[MEMOS-PAT-REDACTED]>
   ↓
3. Code-Node (JavaScript-Filter)
   Bedingung: tags.includes('vault') && !tags.includes('vault-done')
   ↓
4. HTTP PATCH → http://localhost:5230/api/v1/memos/{id}?updateMask=content
   Header: Authorization: Bearer <[MEMOS-PAT-REDACTED]>
   Body: {"content": "{{ $json.content + ' #vault-done' }}"}
```

**Token-Unterscheidung (kritisch!):**

| Token-Typ | Verwendung | Format | Quelle |
|---|---|---|---|
| Memos PAT | Memos API | `memos_pat_...` (42 Zeichen) | Memos WebUI → Settings |
| n8n API Key | n8n-interne Verwaltung | Anderes Format | n8n Admin Panel |

⚠️ Diese nicht verwechseln — häufige Fehlerquelle bei PATCH-Requests.

---

## 3. Shell & System

### 3.1 PowerShell 7

Modernes Scripting für Automation und Systemverwaltung.

```powershell
# Version überprüfen
$PSVersionTable

# Sollte anzeigen: PowerShell 7.4.x oder neuere
```

**Wichtige Features:**
- Cross-Platform (Windows, Linux, macOS)
- Objekt-basierte Pipeline
- Moderne Error-Handling

---

### 3.2 Claude Desktop neu starten

Die Desktop-Anwendung für Claude API-Integration mit lokal installierten Tools.

```powershell
# Prozess beenden
Stop-Process -Name "claude" -Force
Start-Sleep -Seconds 3

# Neue Instanz starten
Start-Process "%APPDATA%\Local\AnthropicClaude\claude.exe"
```

---

## 4. Netzwerk & Datenschutz (OpSec)

### 4.1 VPN Diagnose

Überprüfung der VPN-Konfiguration und Netzwerk-Grundlagen.

```powershell
# Netzwerk-Adapter und Status
Get-NetAdapter | Select-Object Name, InterfaceDescription, Status

# DNS-Server prüfen (sollte VPN-DNS sein, nicht ISP)
Get-DnsClientServerAddress | 
    Where-Object { $_.ServerAddresses } | 
    Select-Object InterfaceAlias, ServerAddresses
```

**Worauf zu achten ist:**
- VPN muss aktiv sein
- DNS-Server sollten nicht dem ISP entsprechen
- Keine DNS-Leaks nach externen Tests

---

### 4.2 OpSec Audit — Umfassende Systemprüfung

Ein automatisiertes Audit-Tool überprüft Sicherheitskonfiguration.

```powershell
pwsh -NoProfile -ExecutionPolicy Bypass `
    -File "%TOOLS%/Invoke-OpSecAudit.ps1"
```

**Geprüfte Aspekte:**
- VPN-Verbindungsstatus
- DNS-Leak-Tests (IPv4 & IPv6)
- WireGuard-Tunnel-Stabilität
- Browser-Sicherheitsrichtlinien (LibreWolf)
- Firewall-Status
- Secret-Scanner-Logs (gitleaks)
- Netzwerk-Latenz und -Durchsatz

**Bewertungsskala:**

| Prozentbereich | Einstufung | Symbol |
|---|---|---|
| ≥ 90% | Sehr gut | 🟢 |
| 75–89% | Gut | 🟡 |
| 60–74% | Befriedigend | 🟠 |
| 40–59% | Ausreichend | 🔴 |
| < 40% | Ungenügend | 💀 |

---

## 5. Datenmaskierung & APIs

### 5.1 Sichere API-Keys verwalten

API-Keys werden lokal verschlüsselt gespeichert und aus dem Home-Verzeichnis geladen.

```powershell
# Allgemeines Muster zum Laden verschlüsselter Keys:
function Get-EncryptedKey($filename) {
    $path = "$env:USERPROFILE\$filename"
    $ss = Get-Content $path | ConvertTo-SecureString
    $ptr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($ss)
    return [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($ptr)
}

# Beispiele für verschiedene Services:
# $anthropic_key = Get-EncryptedKey ".anthropic_key"
# $openrouter_key = Get-EncryptedKey ".openrouter_key"
```

**Best Practice:**
- Keys **nie** im Chat oder Logs anzeigen
- Nur in verschlüsselten Password-Vaults (KeePass, etc.) nachschlagen
- Rotation regelmäßig durchführen
- Separate Keys für verschiedene Umgebungen (Dev/Prod)

---

### 5.2 PII-Scrubber — Automatische Datenmaskierung

Skript zur Entfernung von Personally Identifiable Information (PII) aus Texten.

```powershell
# Beispiel 1: Text scrubben
"Mein Name ist Max Mustermann, E-Mail: max@example.de" | 
    Invoke-PIIScrubber

# Beispiel 2: Gefundene Pattern anzeigen
"Mein Name ist Max Mustermann" | 
    Invoke-PIIScrubber -ShowMatches
```

**Erkannte Pattern:**
- Vollständige Namen
- E-Mail-Adressen
- Telefonnummern
- IP-Adressen
- Kreditkarten-Pattern
- Sozialversicherungsnummern (landesspezifisch)

---

## 6. Anwendungssicherheit

### 6.1 gitleaks — Secret Scanning

Automatisierte Suche nach versehentlich committeten API-Keys, Passwörtern und anderen Secrets.

```powershell
# Umfassender Scan des git-Repositorys
gitleaks git --report-format json --report-path "%LOGS%/gitleaks-scan.json"

# Pre-Commit Hook: Blockiert Secrets vor Commit
gitleaks protect --staged
```

**Erkannte Secret-Typen:**
- AWS Keys, Azure Credentials
- API-Keys (OpenAI, Anthropic, etc.)
- Datenbank-Connection-Strings
- Private SSH/RSA Keys
- Bearer Tokens

---

### 6.2 PSScriptAnalyzer — PowerShell Linting

Statische Code-Analyse für PowerShell-Skripte, erkennt Best-Practice-Verletzungen und potenzielle Fehler.

```powershell
$vault = "%HOME%/Documents/vault"
Get-ChildItem "$vault/workflows" -Filter "*.ps1" |
    ForEach-Object { 
        Invoke-ScriptAnalyzer -Path $_.FullName -Severity Warning,Error 
    }
```

**Geprüfte Kategorien:**
- Best Practices (z.B. Cmdlet-Naming)
- Design (z.B. zu komplexe Funktionen)
- Sicherheit (z.B. hardcodierte Credentials)
- Performance (z.B. ineffiziente Loops)

---

## 7. Reverse Engineering & Malware-Analyse

### 7.1 JADX-GUI — Android App Decompiler

Dekompilierung von Android APK-Dateien in lesbaren Java-Code.

```powershell
Start-Process "%TOOLS%/jadx/jadx-gui-1.5.5.exe"
```

**Workflow:**
1. APK-Datei öffnen
2. Quellcode browsen (Java/Kotlin)
3. Resource-Dateien analysieren
4. Strings und Konstanten suchen

---

### 7.2 Ghidra — Binary Reverse Engineering

Professionelle Reverse-Engineering-Suite für Binaries und Firmware.

```powershell
$ghidraRoot = Get-ChildItem "%TOOLS%/ghidra" -Directory | 
    Select-Object -First 1
Start-Process "$($ghidraRoot.FullName)\ghidraRun.bat"
```

**Hauptfunktionen:**
- Disassembly (x86, ARM, MIPS, etc.)
- Decompiling in pseudocode
-