---
tags: [phase1, netzwerk, haertung, fritzbox, wireguard, vpn, opsec]
date: 2026-07-01
updated: 2026-07-01
status: ✅ abgeschlossen
title: Fritz!Box 6660 Cable -- Haertung & WireGuard
---

# Fritz!Box 6660 Cable -- Haertung & WireGuard

## Geraet

| Parameter | Wert |
|---|---|
| Modell | Fritz!Box 6660 Cable |
| FRITZ!OS | 7.57 ([ISP-REDACTED]-Leihgeraet, Update gesperrt) |
| Anbieter | [ISP-REDACTED] (Kabel) |
| IP-Situation | CG-NAT (WAN: 100.x.x.x), IPv6 vorhanden ([IPv6-PREFIX-REDACTED]) |
| MyFRITZ! | aktiv, Hostname: [MYFRITZ-HOSTNAME-REDACTED] |

## Durchgefuehrte Haertung (2026-07-01)

| Massnahme | Pfad | Status |
|---|---|---|
| Telemetrie/Diagnosedaten deaktiviert | Internet → Zugangsart → AVM-Dienste | ✅ |
| WireGuard-Server eingerichtet | Internet → Freigaben → VPN (WireGuard) | ✅ |
| WPS deaktiviert | WLAN → Sicherheit → WPS-Schnellverbindung | ✅ |
| WPA2+WPA3 Verschluesselung | WLAN → Sicherheit → Verschluesselung | ✅ |
| DNS over TLS (Mullvad DoT) | Internet → Zugangsart → DNS-Server | ✅ |
| Externe Dienste/Freigaben | Internet → Freigaben → FRITZ!Box-Dienste | ✅ keine offen |
| UPnP deaktiviert | Heimnetz → Netzwerk → Heimnetzfreigaben | ✅ |
| IPv6-Adresse zufaellig festlegen | Internet → Zugangsart → IPv6 → Weitere Einstellungen | ✅ |
| Sicherheits-Diagnose geprueft | Diagnose → Sicherheit | ✅ |

## DNS-Konfiguration

| Parameter | Wert |
|---|---|
| Bevorzugter DNSv4 | [IP-REDACTED] (Mullvad) |
| Alternativer DNSv4 | [IP-REDACTED] (Mullvad) |
| Bevorzugter DNSv6 | [IP-REDACTED] (Mullvad) |
| DoT-Hostname | dns.mullvad.net |
| DNS over TLS | aktiv |

## WireGuard-Server

| Parameter | Wert |
|---|---|
| Tunnel-Name | fu75ch1-mobile |
| Endpoint | [MYFRITZ-HOSTNAME-REDACTED]:51761 |
| Client-IP | [IP-REDACTED]/24 |
| DNS in Client-Config | [IP-REDACTED], fritz.box |
| Config-Datei | %USERPROFILE%\Downloads\wg_config.conf |

### Erreichbarkeit

| Client | Erreichbar | Grund |
|---|---|---|
| Android/iOS unterwegs | ✅ | Mobilfunk hat native IPv6 |
| Windows unterwegs | ❌ | [ISP-REDACTED] sperrt DHCPv6-Heimnetz → Windows bekommt keine IPv6 |
| Windows im Heimnetz | ✅ (nur lokal sinnlos) | Direkt per [IP-REDACTED] |

## Bekannte strukturelle Einschraenkungen ([ISP-REDACTED] Leihgeraet)

| Problem | Ursache | Loesung |
|---|---|---|
| Firmware-Update gesperrt | [ISP-REDACTED] steuert Updates | Warten auf [ISP-REDACTED]-Rollout oder eigene Box kaufen |
| DHCPv6-Heimnetz gesperrt | [ISP-REDACTED]-Leihgeraet sperrt Heimnetz-IPv6-Verteilung | Eigene Fritz!Box 6660 Cable (~150 EUR) |
| WireGuard von Windows unterwegs nicht nutzbar | Kein IPv6 auf Windows-Ethernet (OS-Haertung Phase 1 + kein DHCPv6 von [ISP-REDACTED]) | Eigene Box oder Handy nutzen |
| CG-NAT (keine oeffentliche IPv4) | [ISP-REDACTED] Standard-Tarif | 1G-Tarif hat laut [ISP-REDACTED]-Forum oeffentliche IPv4 |

## OpSec-Relevanz

- IPv6 auf Ethernet-Adapter aktiviert (selektive Ausnahme zur OS-Haertung Phase 1)
  → dokumentiert als bewusster Kompromiss fuer WireGuard-Faehigkeit
  → Risiko: minimal (IPv6 nur im Heimnetz, kein globales Routing ohne DHCPv6 vom Router)
- DNS over TLS auf Router-Ebene: alle Heimnetz-Geraete profitieren automatisch

## Verknuepfte Notizen
- [[Phase1_OS_Haertung]]
- [[Invoke-OpSecAudit]]
- _(internal)_
- _(internal)_
