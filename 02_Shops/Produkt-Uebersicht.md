---
date: 2026-07-04
tags: [shops, produkte, uebersicht, screenshots]
status: ✅ v1.0 — Teil 2 des System-Admin/Produkt-Auftrags
title: Produkt-Übersicht — alle 11 Produkte + Screenshot-Plan
---

# fu75ch1 Produkt-Übersicht (P1–P11)

> Kanonische Übersicht aller Produkte über alle Kanäle. Zahlen-Quelle: `00_META\metrics.json`.
> Screenshot-Platzhalter: `[SCREENSHOT: beschreibung]` — vor Upload durch echte PNGs ersetzen
> (1280×720, dunkles Terminal-Theme, KEINE Pfade/Hostnamen/Keys sichtbar — vor jedem
> Screenshot `Invoke-PIIScrubber`-Blick: Fenstertitel, Taskleiste, Tray ausblenden).

---

## Matrix (Stand 2026-07-04)

| # | Produkt | Preis | Gumroad | Whop | Polar | LemonSqueezy | Status |
|---|---|---|---|---|---|---|---|
| P1 | Master-Prompt v4.7 | €9 | 🟢 live | 🔶 im Bundle €19 | ⏸ vorbereitet | — | live |
| P2 | OpSec Checklist (38 Checks) | €7 | 🟢 live | 🔶 im Bundle €19 | ⏸ vorbereitet | — | live |
| P3 | Advanced Configs | €12 | 🔜 Sprint | — | ⏸ | — | upload-bereit |
| P4 | Phase 12 Playbook | €14 | 🔜 Sprint | — | ⏸ | — | upload-bereit |
| P5 | Windows Hardening Guide | €9 | 🔜 Sprint | — | ⏸ | — | upload-bereit |
| P6 | DNS/VPN Guide | €7 | 🔜 Sprint | — | ⏸ | — | upload-bereit |
| P7 | Browser Hardening | €7 | 🔜 Sprint | — | ⏸ | — | upload-bereit |
| P8 | KeePass Blueprint | €7 | 🔜 Sprint | — | ⏸ | — | upload-bereit |
| P9 | Tool Stack Guide | €12 | 🔜 Sprint | — | ⏸ | — | upload-bereit |
| P10 | **The Blueprint** (enthält P1–P9) | €29 EB → €49 | 🔜 Sprint (zuerst!) | — | — | 🔜 Woche 2 | Copy fertig, Zip packen |
| P11 | **Security Lab** (RE + AI-Red-Teaming) | €19 EB → €27 | 🔜 neu | — | — | — | alle 5 Module komplett |
| — | Error-Chronicle-Sampler | **frei** | Lead-Magnet | — | — | — | fertig (`02_Shops\LeadMagnets\`) |

Einzelsumme P1–P9: **€84** → Blueprint-Anker: "€84 of parts for €29 Early Bird".

---

## Screenshot-Plan pro Produkt

### P1 — Master-Prompt v4.7
- Cover: Text-Banner schwarz/grün "Master-Prompt v4.7 — red-team tested"
- [SCREENSHOT: Prompt-Struktur in Obsidian — Gliederung der Blöcke [identity]…[self_check], eingeklappt]
- [SCREENSHOT: Garak-Terminal-Output Run 6 mit 38.43%-Zeile (Pfad-Zeile croppen)]

### P2 — OpSec Checklist
- Cover: "38 checks. 60 seconds. Your real score."
- [SCREENSHOT: Invoke-OpSecAudit.ps1 Output — [OK]/[X]-Liste + "OpSec Score: 36/38 (95%)"]
- [SCREENSHOT: Kategorie-Breakdown-Abschnitt]

### P3 — Advanced Configs
- Cover: "Ollama · n8n · WireGuard — ready to deploy"
- [SCREENSHOT: docker-compose.yml mit Inline-Kommentaren (Ausschnitt)]
- [SCREENSHOT: n8n Workflow-Canvas mit AI-Pipeline]

### P4 — Phase 12 Playbook
- Cover: "Hardening & Determinism — the honest playbook"
- [SCREENSHOT: Fehler-Chronik-Tabelle (3–4 Zeilen, Phase-12-Einträge)]
- [SCREENSHOT: Chronik #114/#115 -- wie der Harness den Prompt nie injizierte (ASR-Zahlen zurueckgezogen)]

### P5 — Windows Hardening Guide
- Cover: "Harden Windows 11. Verify every step."
- [SCREENSHOT: ASR-Rules-Ausgabe Get-MpPreference (GUIDs teilweise sichtbar ok)]
- [SCREENSHOT: Schritt-Format im Guide: Command → Why → Verify]

### P6 — DNS/VPN Guide
- Cover: "Your DNS is leaking. Fix it in 30 minutes."
- [SCREENSHOT: DNS-Leak-Test-Script Output — sauberes Ergebnis]
- [SCREENSHOT: WireGuard-Client verbunden + Kill-Switch-Firewallregel]

### P7 — Browser Hardening
- Cover: "Stop fingerprinting at the config level"
- [SCREENSHOT: LibreWolf user.js Ausschnitt mit Kommentaren]
- [SCREENSHOT: uBlock-Origin-Dashboard mit Filterlisten]

### P8 — KeePass Blueprint
- Cover: "Offline credentials. Key-file concept."
- [SCREENSHOT: KeePassXC Gruppenstruktur (API Keys/System/Services/Personal) — Einträge unkenntlich/Demo-DB!]
- [SCREENSHOT: PowerShell-Snippet API-Key-Load zur Laufzeit]

### P9 — Tool Stack Guide
- Cover: "Every tool. Every decision. Every rejection."
- [SCREENSHOT: Tool-Tabelle aus dem Guide (AI & Automation Sektion)]
- [SCREENSHOT: "Rejected tools and why"-Abschnitt]

### P10 — The Blueprint
- Cover: "The complete system — 15 phases, 115 mistakes, every script"
- [SCREENSHOT: Vault-Ordnerstruktur des Blueprint-Zips (Explorer/Obsidian-Sidebar)]
- [SCREENSHOT: Streamlit-Dashboard (OpSec, Fehler-Count, RAM/CPU) — Prunkstück, auch fürs README]
- [SCREENSHOT: Fehler-Chronik-Übersicht — Scroll-Länge als Visual ("this is 115 documented mistakes")]

### P11 — Security Lab
- Cover: "Reverse engineering + AI red-teaming. Reproducible. Isolated."
- [SCREENSHOT: Verify-LabSetup.ps1 Output — Toolchain-Tabelle mit PASS/CHECK-Spalte]
- [SCREENSHOT: payload_probe Output — die ['user']-only vs ['system','user']-Zeile (die #114-Lektion visuell)]
- [SCREENSHOT: Modul-Index in Obsidian — 5 Module, Status-Spalte complete/roadmap ehrlich sichtbar]

---

## Regeln für alle Screenshots
1. **Vor jedem Shot:** kein Hostname im Fenstertitel, keine Pfade mit Usernamen, Tray/Taskleiste raus, Demo-Daten statt echter Einträge (v.a. P8!).
2. Format: PNG 1280×720, dunkles Theme, konsistente Schriftgröße.
3. Ablage: `02_Shops\_Assets\P<nr>_<beschreibung>.png` (Ordner bei Bedarf anlegen).
4. Nach Erstellung: gitleaks über den Assets-Ordner (Bilder werden nicht gescannt — deshalb Regel 1 doppelt ernst nehmen).

© fu75ch1 — intern
