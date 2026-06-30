---
tags: [meta, guidelines, public, export]
date: 2026-06-24
status: ✅ Aktiv
title: Public Content Guidelines
---

# Public Content Guidelines

## Was darf in fu75ch1_public?

| Kategorie | Erlaubt | Verboten |
|---|---|---|
| Konzepte & Guides | ✅ | — |
| PowerShell-Referenz (generisch) | ✅ | spezifische IPs/Pfade |
| Fehleranalysen (sanitized) | ✅ | Rohdaten, Logs |
| LinkedIn-Posts & Templates | ✅ | — |
| Stack-Beschreibungen | ✅ | API Keys, Credentials |
| Architektur-Diagramme | ✅ | Netzwerktopologie (intern) |
| Garak/Promptfoo Ergebnisse | ✅ | System-Prompt vollständig |

## Export-Prozess

```
fu75ch1 (privat)
  -> Invoke-PublicExport-v2.ps1 (Manifest-gesteuert, sanitiert automatisch)
  -> DryRun zur Kontrolle
  -> fu75ch1_public (Freigabe + Commit)
```

## Sanitierungs-Checkliste vor Export

- [ ] Keine IPs, MACs, Hostnamen
- [ ] Keine API Keys oder Tokens
- [ ] Keine persönlichen Pfade (USERPROFILE etc.)
- [ ] Keine internen Tool-Versionen die Angriffsfläche verraten
- [ ] Wikilinks auf private Notizen entfernt oder ersetzt
