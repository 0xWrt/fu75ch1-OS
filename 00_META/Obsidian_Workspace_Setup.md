---
date: 2026-06-25
tags: [meta, obsidian, setup, public-vault]
status: ✅ Konfiguriert
title: Obsidian Workspace Setup — fu75ch1_public
---

# Obsidian Workspace Setup — fu75ch1_public

Konfiguriert: 2026-06-25 via PowerShell (idempotent)

## Plugins

| Plugin | Status | Zweck |
|---|---|---|
| Dataview | ✅ aktiv | Analytics-Queries, Content-Tracking |
| File Explorer | ✅ (core) | Sidebar-Navigation |
| Graph | ✅ (core) | Vault-Visualisierung |
| Backlinks | ✅ (core) | Wikilink-Navigation |

Bewusst deaktiviert (kein Mehrwert im Public Vault):
Templater, Linter, Minimal Settings, Daily Notes, Sync, Bases

## Graph-Farben

| Pfad | Farbe | Bedeutung |
|---|---|---|
| 00_PROOF | 🔴 Rot | Beweis-Dokumente — im Vordergrund |
| 00_META | 🟢 Dunkelgrün | Meta / Config |
| 01_Architecture/Phases | 🟢 Grün | Alle 15 Phasen |
| 01_Architecture | 🔵 Blaugrün | Architektur |
| 02_.../LinkedIn | 🟢 Smaragd | LinkedIn Content |
| 02_.../Newsletter | 🔵 Blau | Substack |
| 02_.../Gumroad | 🟡 Orange | Produkte |
| 02_CONTENT_OS | 🟠 Dunkelorange | Content allgemein |
| 03_GitHub_Docs | 🟡 Gelb | GitHub |

## Start-Ansicht

Öffnet mit: 00_PROOF/Verified_Results.md (Preview-Modus)
Sidebar: Dateiexplorer (currentTab=0)

## Bekannte Einschränkung

Obsidian muss manuell geöffnet werden:
Obsidian → Open another vault → fu75ch1_public
Pfad: %USERPROFILE%\Documents\fu75ch1_public