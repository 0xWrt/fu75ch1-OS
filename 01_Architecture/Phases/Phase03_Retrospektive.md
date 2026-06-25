---
tags: [phase3, librewolf, retrospektive, opsec]
date: 2026-06-18
status: abgeschlossen
phase: Phase 3
title: Phase 3 — Retrospektive
---

# Phase 3 — Retrospektive

## Was lief gut

- SHA256-Verifikation konsequent durchgeführt (Supply Chain Policy eingehalten)
- overrides.cfg + local-settings.js korrekt eingebunden
- Persistenz nach Neustart bestätigt
- Extensions (uBlock Origin + Canvas Blocker) installiert und konfiguriert
- Alle about:config Werte nach Vorgabe gesetzt

## Was war schwieriger als erwartet

- `Invoke-WebRequest` Byte-Array Problem beim Hash-Vergleich
  → Encoding-Bewusstsein für PowerShell geschärft
- `librewolf.overrides.cfg` greift ohne `local-settings.js` nicht
  → Dokumentationslücke in LibreWolf-Docs für Windows

## Erkenntnisse

- LibreWolf 152.x liefert keine `local-settings.js` mehr als Default
  → Muss bei Neuinstallationen immer manuell angelegt werden
- `[System.Text.Encoding]::UTF8.GetString()` als Standardmuster
  für Invoke-WebRequest Textinhalte merken
- Canvas Blocker + RFP (resistFingerprinting) ergänzen sich gut
  ohne Konflikte bei Preset `Stealth`

## Verbesserungspotenzial

- VPN Watchdog noch ausstehend (🔴 offener Punkt)
- KeePassXC für Credential Management noch nicht eingerichtet
- Backup 3-2-1 für Vault noch ausstehend

## Nächste Phase

Phase 4: Data Masking
- Identitätstrennung
- Pseudonymisierung
- Datenminimierung

## Verknüpfte Notizen

- [[Phase3_Block1_LibreWolf_Installation_Haertung]]
- [[Phase3_Fehleranalyse]]
- [[Phase3_FabricExport]]
- _(internal)_

## Graph-Gruppe

```json
{ "group": "04_PHASE3", "color": { "rgb": 15120384 } }
```
