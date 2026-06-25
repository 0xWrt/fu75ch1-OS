---
tags: [phase6, reverse-engineering, jadx, frida, firetv, adb, hardening]
date: 2026-06-20
status: ✅ Abgeschlossen
title: Phase 6 — Reverse Engineering Abschluss
---

# Phase 6 — Reverse Engineering Abschluss

## Ziel & Verifikationsergebnis

| Aufgabe | Ergebnis | Verifikation |
|---|---|---|
| JADX-GUI installieren | ✅ v1.5.5 with-jre-win | GUI gestartet |
| APK statisch analysieren | ✅ Stremio 1.10.2 | Manifest + 3 Kernklassen |
| Node.js-Architektur aufdecken | ✅ libnode.so + server.js | StremioServer.kt |
| ADB + Fire TV verbinden | ✅ AFTKM über WLAN | adb devices bestätigt |
| Frida installieren + verbinden | ✅ v17.15.0 | frida-ps Prozessliste |
| Fire TV debloaten | ✅ 11 Pakete deaktiviert | pm disable-user |
| DNS-Blocking konfiguriert | ✅ adblock.dns.mullvad.net | ping NXDOMAIN bestätigt |

## Konzepte & Hintergrund

### Statische Analyse (JADX-GUI)
JADX liest APK-Dateien (ZIP mit .dex-Bytecode) und wandelt
Dalvik-Bytecode → Smali → Java/Kotlin um. Kein Quellcode nötig.
APK-Struktur: AndroidManifest.xml + classes.dex + assets + lib/

### Stremio-Architektur (Kernbefund)
Stremio bundelt eine vollständige Node.js-Runtime als native Library:
- libnode.so: Node.js Runtime
- libstremio-server.so: Stremio-Logik
- assets/server.js: JavaScript-Servercode (Klartext in APK)

JNI-Bridge bidirektional:
- Java → Node.js: StremioServer.dispatch(channel, message)
- Node.js → Java: StremioServer.onMessage(channel, message)
- Protokoll: channel="status", message="ready" bei Serverstart

### Frida-Architektur
frida-server läuft auf Android-Gerät, frida-tools auf PC.
Kommunikation über Port 27042 (TCP).
ADB Port-Forward überbrückt Netzwerkzugang: adb forward tcp:27042 tcp:27042

### Fire TV Stick Hardening
Debloating via pm disable-user --user 0 (reversibel, kein Root).
Geschützte Pakete (protected) → DNS-Blocking als Äquivalent.
Root auf AFTKM/FireOS 8 nicht möglich (MediaTek MT8696, kein public exploit).

## PowerShell-Referenz

```powershell
$vault = "$env:USERPROFILE\Documents\fu75ch1"

# JADX starten
Start-Process "C:\[USER]\Tools\JADX\jadx-gui-1.5.5.exe"

# APK entpacken
Expand-Archive -Path "C:\[USER]\Mobile\<apk>" -DestinationPath "C:\[USER]\Tools\StremioExtract" -Force

# ADB Setup
$env:PATH += ";C:\[USER]\Tools\ADB\platform-tools"
adb connect [IP-REDACTED]
adb devices

# Architektur prüfen
adb shell getprop ro.product.cpu.abi

# Frida-Server pushen
adb push "C:\[USER]\Tools\Frida\frida-server" /data/local/tmp/frida-server
adb shell chmod 755 /data/local/tmp/frida-server
adb shell "nohup /data/local/tmp/frida-server > /dev/null 2>&1 &"
adb forward tcp:27042 tcp:27042
frida-ps -H [IP-REDACTED]

# Debloating
adb shell pm disable-user --user 0 <paketname>
adb shell pm enable --user 0 <paketname>  # Rollback

# DNS-Blocking
adb shell settings put global private_dns_mode hostname
adb shell settings put global private_dns_specifier "adblock.dns.mullvad.net"

# Verifikation DNS
adb shell ping -c 1 device-metrics-us.amazon.com  # → unknown host

# Cleanup
adb shell rm /data/local/tmp/frida-server
adb forward --remove tcp:27042
```

## Fehleranalyse & Lösungen

| # | Fehler | Ursache | Lösung |
|---|---|---|---|
| 1 | winget --scope user Java fehlgeschlagen | Kein User-Scope-Installer | JADX with-jre-win Variante |
| 2 | jadx-gui.bat nicht gefunden | with-jre-win liefert .exe direkt | jadx-gui-1.5.5.exe starten |
| 3 | adb nicht erkannt | Platform Tools nicht in PATH | Manuell download + $env:PATH |
| 4 | ADB connect Fehler 10013 | Mullvad Kill-Switch blockiert LAN | Local network sharing aktivieren |
| 5 | frida-ps connection failed | Port 27042 nicht direkt erreichbar | adb forward tcp:27042 tcp:27042 |
| 6 | frida-server stirbt nach Shell-Exit | Background-Prozess endet mit Shell | nohup verwenden |
| 7 | SELinux Policy Warning | Fire TV SELinux Enforcing | Warnung ignorieren, nicht kritisch |

**Präventionsregel:** Mullvad Local Network Sharing standardmäßig aktiv lassen für LAN-Tools.

## Deaktivierte Pakete (Rollback: pm enable --user 0 <pkg>)

| Paket | Kategorie |
|---|---|
| com.amazon.device.telemetry.emitter | Telemetrie |
| com.amazon.firebat | Telemetrie |
| com.amazon.imp | Telemetrie |
| com.amazon.alexa.externalmediaplayer.fireos | Alexa |
| com.amazon.alexamediaplayer.runtime.ftv | Alexa |
| com.amazon.tv.alexanotifications | Alexa |
| com.amazon.aca | Alexa |
| com.amazon.logan | Werbung |
| com.amazon.prism.android.service | Werbung |
| com.amazon.ceviche | Werbung |
| com.amazon.vizzini | Werbung |
| com.amazon.systemnotices | Sonstiges |
| com.amazon.whisperjoin.middleware.v2.np | Sonstiges |
| com.amazon.dialservice | Sonstiges |
| com.amazon.tv.developer.dataservice | Sonstiges |

## Verknüpfte Notizen
- [[Phase6_Plan]]
- [[StateTransfer_v7_2026-06-19]]
- [[Tech-Stack-v2.0]]
- _(internal)_

## Graph-Gruppe
group: 07_PHASE6
