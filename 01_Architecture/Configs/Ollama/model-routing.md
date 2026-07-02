---
date: 2026-07-02
tags: [config, ollama, advanced-configs, produkt3]
title: Ollama Model Routing Config
---

# Ollama Model Routing Config

> Teil von "fu75ch1 Advanced Configs" (Produkt 3, €12).
> Zwei Variablen zum Anpassen: `OLLAMA_HOST` (falls Remote) und die Modell-Namen
> unter `models:` (falls du andere Ollama-Modelle bevorzugst). Alles andere ist
> ready-to-deploy.

---

## ⚠️ Hardware-Realitätscheck zuerst — bevor du irgendwas installierst

Das hier ist der Unterschied zwischen diesem Config-Paket und einem generischen
Ollama-Tutorial: **lokale LLMs brauchen einen dedizierten GPU, um praktikabel
zu sein.** Auf reiner CPU/iGPU-Hardware (z. B. Intel UHD, wie im Referenzsystem
dieses Projekts) sind 7B+-Modelle spürbar langsam — für Chat-Interaktion oft
nicht mehr komfortabel nutzbar.

**Prüfe das zuerst:**

```powershell
# Schneller Hardware-Check vor der Ollama-Installation
Get-CimInstance Win32_VideoController | Select-Object Name, AdapterRAM, DriverVersion
```

- **Dedizierte GPU vorhanden (NVIDIA/AMD, ≥6GB VRAM):** Ollama läuft gut, lohnt sich.
- **Nur integrierte Grafik (Intel UHD/Iris, AMD APU ohne dGPU):** Kleine Modelle
  (≤3B, z. B. `phi3:mini`, `llama3.2:1b`) sind nutzbar für einfache Aufgaben
  (Zusammenfassung, Formatierung). Für alles, was echtes Reasoning braucht,
  bleibt Cloud-Routing (Claude/GPT) die praktikablere Wahl — das ist auch die
  im Referenzsystem dieses Projekts tatsächlich getroffene Entscheidung.

Diese Config ist so gebaut, dass beide Fälle funktionieren — sie routet nach
Aufgabenkomplexität, nicht dogmatisch "immer lokal".

---

## 1. Ollama Setup

```powershell
# Installation (Windows)
winget install Ollama.Ollama

# Dienst-Check
Get-Process ollama -ErrorAction SilentlyContinue

# Modell laden (klein, iGPU-tauglich)
ollama pull phi3:mini

# Modell laden (mittel, braucht dedizierte GPU für flüssige Nutzung)
ollama pull llama3.1:8b
```

## 2. Environment-Variablen (nur diese ggf. anpassen)

```powershell
# Falls Ollama auf einer anderen Maschine im Netzwerk läuft statt localhost:
$env:OLLAMA_HOST = "127.0.0.1:11434"   # <- ANPASSEN falls Remote-Setup

# Kontextfenster-Limit (Standard meist zu niedrig für Vault-Kontext)
$env:OLLAMA_CONTEXT_LENGTH = "8192"
```

## 3. Modell-Routing-Policy (`model-routing.json`)

Diese Datei definiert, welche Aufgabenklasse an welches Modell geht — lokal
zuerst versucht, mit Cloud-Fallback für alles, was Reasoning-Tiefe braucht.

```json
{
  "routing_policy": {
    "small": {
      "description": "Zusammenfassung, Formatierung, einfache Extraktion",
      "provider": "ollama",
      "model": "phi3:mini",
      "fallback_provider": "cloud",
      "fallback_model": "claude-haiku",
      "max_context_tokens": 4000
    },
    "medium": {
      "description": "Dokumentation, Code-Review, Standardanalyse",
      "provider": "ollama",
      "model": "llama3.1:8b",
      "requires_gpu": true,
      "fallback_provider": "cloud",
      "fallback_model": "claude-sonnet",
      "max_context_tokens": 8000
    },
    "large": {
      "description": "Architektur, Security-Analyse, komplexes Reasoning",
      "provider": "cloud",
      "model": "claude-opus",
      "note": "Bewusst nie lokal geroutet -- Reasoning-Tiefe auf Consumer-Hardware nicht erreichbar"
    }
  },
  "decision_logic": "Aufgabenklasse manuell oder heuristisch (Tokenlaenge, Schluesselwoerter) bestimmen -> Route probieren -> bei Ollama-Fehler oder Timeout (>30s) automatisch auf fallback_provider wechseln"
}
```

## 4. Einfacher Router (PowerShell-Beispiel)

```powershell
function Invoke-ModelRoute {
    param(
        [Parameter(Mandatory)][ValidateSet('small','medium','large')]
        [string]$Tier,
        [Parameter(Mandatory)][string]$Prompt
    )

    $policy = Get-Content "$PSScriptRoot\model-routing.json" | ConvertFrom-Json
    $route = $policy.routing_policy.$Tier

    if ($route.provider -eq 'ollama') {
        try {
            $response = ollama run $route.model $Prompt 2>&1
            if ($LASTEXITCODE -eq 0) { return $response }
        } catch {
            Write-Warning "Ollama-Route fehlgeschlagen, wechsle auf Cloud-Fallback"
        }
    }

    # Cloud-Fallback (Platzhalter -- eigene API-Anbindung einsetzen)
    Write-Host "-> Route: Cloud-Fallback verwenden"
}
```

## 5. Open WebUI (optional, für Browser-Zugriff auf lokale Modelle)

```powershell
docker run -d -p 3000:8080 `
  --add-host=host.docker.internal:host-gateway `
  -v open-webui:/app/backend/data `
  --name open-webui `
  ghcr.io/open-webui/open-webui:main
# Zugriff: http://localhost:3000
```

---

## Verknüpfte Dateien
- `../n8n/docker-compose.yml` — n8n kann diese Ollama-Instanz als AI-Node ansprechen
- `Gumroad-P3-Advanced-Configs.md` — Produktbeschreibung
