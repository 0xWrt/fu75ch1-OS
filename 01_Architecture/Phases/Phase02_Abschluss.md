---
tags: [phase2, vpn, opsec, abgeschlossen]
datum: 2026-06-18
status: abgeschlossen
title: "Phase 2 – VPN OpSec: Abschlussdokument"
---

# Phase 2 – VPN OpSec: Abschlussdokument

## Ergebnis
Phase 2 VPN Leak-Test erfolgreich abgeschlossen.

## Diagnose-Befunde
| Check | Ergebnis | Datum |
|-------|----------|-------|
| DNS | ✅ [IP-REDACTED] auf allen Adaptern | 2026-06-18 |
| IPv6 | ✅ Keine globalen Adressen aktiv | 2026-06-18 |
| Kill-Switch | ✅ WFP aktiv | 2026-06-18 |
| Default-Route | ✅ Mullvad IF[49] Metric 0 gewinnt | 2026-06-18 |
| VirtualBox | ✅ Kein Routing-Konflikt (keine Default-Route) | 2026-06-18 |

## Re-Verifikation 2026-06-19
| Check | Ergebnis |
|-------|----------|
| VPN aktiv (Mullvad Exit) | ✅ |
| Mullvad DNS | ✅ |
| IPv6 deaktiviert | ✅ (fix 19.06.2026) |
| Default-Route via VPN | ✅ |
| Mullvad-Dienst läuft | ✅ |

Fix: IPv6-Binding auf allen aktiven physischen Adaptern via
`Disable-NetAdapterBinding -ComponentID ms_tcpip6` deaktiviert.

## Ursache Routing-Konflikt
Wi-Fi-Adapter hatte Metric 0 – identisch mit Mullvad-Adapter.
Windows wählte Default-Route willkürlich → Traffic konnte VPN umgehen.

## Fixes angewendet
- Wi-Fi IF[6] Metric auf 100 gesetzt
- DNS auf allen Adaptern → [IP-REDACTED]
- VirtualBox: kein Eingriff nötig (Fehlverdacht bestätigt)

## Artefakte
- Phase2-Diagnose-REDACTED-20260618-155105.log → 13_AUDIT ablegen

## Retrospektive
VirtualBox war Fehlverdacht. Eigentliche Ursache war Wi-Fi-Adapter
mit gleicher Metric wie VPN-Adapter. DNS-Leak-Risiko durch
Router-DNS auf Wi-Fi/Ethernet ebenfalls geschlossen.

## Nächste Phase
Phase 3: LibreWolf – Datenschutz-Browser einrichten
