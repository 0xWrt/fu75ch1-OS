---
tags: [phase12, sbom, syft, grype, supply-chain, memos, abschluss]
date: 2026-06-23
status: ✅ Abgeschlossen
title: Phase 12 — Block B Abschluss (SBOM Pipeline)
---

# Phase 12 — Block B Abschluss (SBOM Pipeline)

## 🎯 Verifikations-Tabelle

| Schritt | Ergebnis |
|---|---|
| syft 1.45.1 (WSL2) | ✅ |
| grype 0.114.0 (WSL2) | ✅ |
| SBOM + CVE-Scan memos:0.24.0 | ✅ 12 Critical |
| SBOM + CVE-Scan memos:0.29.1 | ✅ 8 Critical (grpc + OpenSSL gefixt) |
| Memos Update 0.24.0 → 0.29.1 | ✅ läuft auf Port 5230 |

## 🧠 Konzepte & Hintergrund

### SBOM (Software Bill of Materials)
Vollständige Liste aller Komponenten eines Binaries oder Container-Images:
Pakete, Versionen, Lizenzen, Abhängigkeiten. Basis für CVE-Scanning.
syft erzeugt SBOMs aus Binaries, Docker Images, Filesystems.

### CVE-Scanning mit grype
grype prüft SBOM-Einträge gegen öffentliche Vulnerability-Datenbanken
(NVD, GitHub Advisory, Go Vulnerability DB). Liefert Severity,
betroffene Version, Fix-Version pro Paket.

### SBOM-Workflow (Standard ab Phase 12)
```
Download/Pull → syft (SBOM) → grype (CVE) → Entscheidung → erst dann produktiv
```

### Bewertung memos:0.29.1
- golang.org/x/crypto v0.50.0 → Fix in 0.52.0 (2 Minor-Versionen)
- golang.org/x/net v0.53.0 → Fix in 0.55.0 (2 Minor-Versionen)
- Akzeptabel: localhost-only, kein Internet-Exposure, nächstes Memos-Release fixt

## 🔷 PowerShell/Bash-Referenz

```bash
# WSL2 — SBOM erzeugen
syft <image_oder_binary> -o table

# WSL2 — CVE-Scan
grype <image_oder_binary>

# Nur Critical
grype <image> 2>/dev/null | awk '$6=="Critical" {print $1, $2, $3, $5}' | sort -u

# Severity-Übersicht
grype <image> 2>/dev/null | awk 'NR>1 {print $6}' | sort | uniq -c | sort -rn
```

```powershell
# Docker Image Update
docker pull neosmemo/memos:0.29.1
docker stop memos
docker rm memos
docker run -d --name memos -p 5230:5230 -v "C:\[USER]\Tools\memos-data:/var/opt/memos" neosmemo/memos:0.29.1

# Verifikation
docker ps --filter "name=memos" --format "{{.Image}} — {{.Status}}"
(Invoke-WebRequest "http://localhost:5230" -UseBasicParsing).StatusCode
```

## ⚠️ Fehleranalyse & Lösungen

### Install-Script schlägt fehl (syft/grype)
- **Kategorie:** NETZWERK / PERMISSIONS
- **Ursache:** `curl | sh` schlägt fehl wenn GitHub-Redirect nicht funktioniert
- **Lösung:** Manuell: Release-URL via API ermitteln → tar.gz downloaden → entpacken → mv nach /usr/local/bin
- **Prävention:** Bei Tool-Installation immer manuellen Fallback parat haben

### API-Endpoint geändert (memos v0.29.x)
- **Ursache:** `/api/v1/workspace/profile` gibt 404 in v0.29.x
- **Lösung:** HTTP 200 auf Root-URL als Liveness-Check ausreichend
- **Prävention:** Nach Major/Minor-Update API-Endpoints verifizieren

## Known Issues
- memos:0.29.1 hat noch 8 Critical (x/crypto, x/net) — localhost-only, akzeptiert
- Nächstes Memos-Release voraussichtlich mit Fix

## 🔗 Verknüpfte Notizen
- [[Phase12_Plan]]
- [[Phase12_BlockA_Abschluss]]
- _(internal)_
- _(internal)_

## Graph-Gruppe
phase12
