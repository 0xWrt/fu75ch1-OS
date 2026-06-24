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

## Export-Prozess (Phase 13 Pipeline)

```
fu75ch1 (privat)
  → 16_AUTO/ (Staging)
  → L2-Kuratierung (manuell)
  → fu75ch1_public (commit)
```

## Sanitierungs-Checkliste vor Export

- [ ] Keine IPs, MACs, Hostnamen
- [ ] Keine API Keys oder Tokens
- [ ] Keine persönlichen Pfade (USERPROFILE etc.)
- [ ] Keine internen Tool-Versionen die Angriffsfläche verraten
- [ ] Wikilinks auf private Notizen entfernt oder ersetzt
