---
tags:
  - phase7
  - hardware-forensik
  - ghidra
  - binwalk
  - firetv
  - abschluss
date: 2026-06-25
status: ✅ Abgeschlossen (Block C offen)
title: Phase 7 — Hardware Forensik Abschluss
---

# Phase 7 — Hardware Forensik Abschluss

## 🎯 Ziel & Verifikationsergebnis

| Block | Aufgabe | Ergebnis |
|---|---|---|
| 0 | Java 21 Temurin + JADX-GUI 1.5.5 | ✅ GUI gestartet, APK-Decompilierung verifiziert |
| A | Ghidra 12.1.2 | ✅ Binary-Analyse verifiziert |
| B | Binwalk 2.3.3 (WSL2) | ✅ Fire TV RS8166 OTA-Image (698 MiB) analysiert |
| B2 | Fire TV AFTKM Hardening | ✅ VPN + DNS + Debloating aktiv |
| C | CH341A + Flashrom | ⏳ Hardware ausstehend |

## 🧠 Konzepte & Hintergrund

### Firmware-Analyse (Binwalk)
Binwalk extrahiert Dateisystem-Strukturen aus Firmware-Images.
Fire TV RS8166 OTA-Image: squashfs, ext4, CPIO-Archive.
Erkenntnisse: MediaTek MT8696 SoC, Android Verified Boot (AVB),
AES-256-XTS Verschlüsselung, Vendor Patch Level 2022.

### Statische APK-Analyse (JADX)
JADX konvertiert Dalvik-Bytecode (.dex) → Java/Kotlin Quellcode.
Stremio-Befund: bundelt Node.js Runtime (libnode.so) + eigene Library
(libstremio-server.so) + JavaScript-Servercode (assets/server.js im Klartext).
JNI-Bridge bidirektional via StremioServer.dispatch() / StremioServer.onMessage().

### Fire TV Hardening ohne Root
Debloating via `pm disable-user --user 0` (reversibel).
Geschützte Pakete → AppOps Hintergrundrechte entziehen (kein Root nötig).
DNS-Blocking via privates DNS (DoT): adblock.dns.mullvad.net.
Mullvad VPN: Always-On + Kill-Switch via ADB.

## 📊 Fire TV Hardening — Ergebnis

| Maßnahme | Befehl/Tool | Status |
|---|---|---|
| Mullvad Always-On VPN | ADB + adb shell | ✅ |
| Kill-Switch (lockdown=1) | ADB | ✅ |
| DNS over TLS | adb shell settings put global private_dns_* | ✅ |
| Telemetrie-Pakete | pm disable-user | ✅ 11 Pakete |
| Werbepakete | pm disable-user | ✅ 4 Pakete |
| DNS-Blocking verifiziert | ping device-metrics-us.amazon.com → NXDOMAIN | ✅ |

## ⚠️ Fehleranalyse

| # | Fehler | Ursache | Lösung |
|---|---|---|---|
| 29 | Binwalk Python 3.14 inkompatibel | Python >3.11 nicht unterstützt | WSL2 Ubuntu mit Python 3.10 nativ |
| 30 | WSL1 nicht unterstützt | Hardware-Virtualisierung deaktiviert | wsl --set-default-version 2 |
| 31 | ADB device not found | USB-Debugging nicht aktiviert | Settings → Developer Options → ADB on |
| 32 | Frida Server permission denied | Fire TV nicht gerootet | Frida ohne root via USB statt root-Server |
| — | ADB connect Fehler 10013 | Mullvad Kill-Switch blockiert LAN | Local network sharing aktivieren |
| — | frida-ps connection failed | Port 27042 nicht direkt erreichbar | adb forward tcp:27042 tcp:27042 |

**Präventionsregel:** Mullvad Local Network Sharing standardmäßig aktiv lassen für LAN-Tools (Fire TV, ADB).

## 🔧 PowerShell-Referenz

```powershell
# ADB verbinden
$env:PATH += ";C:\[USER]\Tools\ADB\platform-tools"
adb connect [IP-REDACTED]
adb devices

# ABI prüfen (vor APK-Installation immer!)
adb shell getprop ro.product.cpu.abilist  # AFTKM = armeabi-v7a

# Fire TV VPN + DNS hardening
adb shell settings put global always_on_vpn_app com.mullvad.vpn
adb shell settings put global always_on_vpn_lockdown 1
adb shell settings put global private_dns_mode hostname
adb shell settings put global private_dns_specifier "adblock.dns.mullvad.net"

# Paket deaktivieren / reaktivieren
adb shell pm disable-user --user 0 <paketname>
adb shell pm enable --user 0 <paketname>

# DNS-Blocking verifizieren
adb shell ping -c 1 device-metrics-us.amazon.com  # → unknown host ✅
```

## 🔗 Verknüpfte Notizen
- [[Phase7_BlockA_Ghidra]]
- [[Phase7_BlockB_Binwalk]]
- [[Phase7_BlockB2_FireTV_OTA_RE]]
- [[Phase6_Abschluss]]
- _(internal)_

## Graph-Gruppe
phase7
