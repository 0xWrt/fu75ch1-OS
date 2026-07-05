---
date: 2026-07-05
tags: [newsletter, substack, pipeline, planung]
status: ✅ v1.0 — 6 Issues geplant (nach Template schreibbar in je ~45 min)
title: Issue-Pipeline #3–#8 — Werbe-Newsletter, 6 Wochen Vorlauf
---

# Newsletter-Pipeline: Issues #3–#8

> Jedes Issue folgt `Issue_Templates\Issue-Template.md` (Hook → Kontext → Kern →
> Regel → Ehrlichkeits-Moment → Blueprint-CTA). Ein Issue = eine Chronik-Story.
> Fertige Drafts: Issue #1 (#103-Story) + Issue #2 (0% vs 38.43%).
> Rhythmus: Freitag publizieren. Vor jedem Versand: `Invoke-MetricsCheck.ps1`.

---

## Issue #3 — "The containers that would not die"
- **Chronik:** #102 (+#91 als Vorgeschichte)
- **Hook:** RAM-Warnung um 2 Uhr nachts — von Containern, die zweimal manuell gestoppt und deren Autostart bereits entfernt war.
- **Kern:** `restart: always` überlebt jeden manuellen Stop, weil Docker die Policy beim Daemon-Neustart (Sleep/Wake, WSL2) selbst durchsetzt. Fix auf zwei Ebenen: `docker update --restart no` + docker-compose.yml.
- **Regel:** On-Demand ist nur real, wenn Autostart UND Container-Restart-Policy es sagen.
- **Ehrlichkeit:** Der erste Fix (#91) war unvollständig und wurde als gelöst markiert — der zweite Vorfall ist dokumentiert.
- **CTA-Produkt:** P3 Advanced Configs. **Visual:** docker-compose-Diff.

## Issue #4 — "The scrubber that broke on an empty string"
- **Chronik:** #96 (+Rückverweis #103 — Cross-Promo für Issue #1)
- **Hook:** Der PII-Scrubber, der Hostnamen vor jedem API-Call maskiert, konnte an einer leeren Umgebungsvariable scheitern — eine leere Regex-Alternative matcht, wie sie will.
- **Kern:** Env-Vars nie ungeprüft in Regex-Alternationen; Empty/Null-Guards; wie der Scrubber verdrahtet ist (jeder Call, automatisch).
- **Regel:** #96 wörtlich.
- **Ehrlichkeit:** Genau dieser Fix wurde vergessen zu protokollieren → #103. Zwei Fehler, eine Lektion.
- **CTA-Produkt:** P1 Master-Prompt / Blueprint. **Visual:** Guard-Code-Snippet.

## Issue #5 — "31 of 34, and the three I can't fix"
- **Chronik/Quelle:** OpSec-Audit-Gaps (IPv6-Disable strukturell, Git-dirty-Workflow, NetBIOS)
- **Hook:** Mein Security-Score ist 91%. Hier sind die 9%, die ich nicht wegbekomme — und warum ich sie trotzdem veröffentliche.
- **Kern:** Was die drei offenen Checks konkret prüfen, warum strukturelle Gründe (Hardware/Workflow) sie blocken, was das Rest-Risiko real bedeutet.
- **Regel:** Ein Audit, das immer 100% zeigt, prüft nichts.
- **Ehrlichkeit:** Ist der Kern des Issues selbst.
- **CTA-Produkt:** P2 OpSec Checklist. **Visual:** `P2_opsec_audit_31of34.svg` (das [X] ist der Star).

## Issue #6 — "The invisible watermark I tell you about"
- **Quelle:** Ghost-Mark-System + Transparenznote
- **Hook:** Jede verkaufte Datei enthält eine unsichtbare Signatur. Der Decoder liegt im Download bei. Absichtlich.
- **Kern:** Zero-Width-Unicode als Lizenz-Watermark; warum verstecktes DRM einer Security-Marke schadet und offengelegtes Watermarking Vertrauen baut; `Verify-GhostMark.py` Schritt für Schritt.
- **Regel:** Wenn dein Kopierschutz ein Geheimnis sein muss, ist er dein Feind.
- **Ehrlichkeit:** Watermarks überleben Copy-Paste nicht immer — Grenzen benennen.
- **CTA:** alle Produkte. **Visual:** Decoder-Output-Screenshot.

## Issue #7 — "130 log files I finally deleted (and 10 I didn't)"
- **Quelle:** Bulk-Cleanup 2026-07-05
- **Hook:** Append-only-Disziplin erzeugt Beweise UND Müll. Der Unterschied entscheidet, ob dein Vault ein Audit-Trail oder eine Müllhalde ist.
- **Kern:** Kriterien: aktive Service-Logs (nie anfassen), Beweis-Logs der publizierten Zahlen (behalten), Session-Rauschen (Quarantäne statt Löschen). DryRun-first-Prozedur.
- **Regel:** Erst DryRun mit Behalten-Liste, dann verschieben, nie direkt löschen.
- **Ehrlichkeit:** Ein Duplikat der Fehler-Chronik lag monatelang unbemerkt in den Logs.
- **CTA-Produkt:** P9 Tool Stack / Blueprint. **Visual:** DryRun-Output.

## Issue #8 — "Why my product costs €9 here and €19 there"
- **Quelle:** Whop-Bundle-Entscheidung (Launch_Plan)
- **Hook:** Dasselbe Produkt auf zwei Plattformen zu zwei Preisen ist entweder Betrug oder ein ehrlich erklärbares Bundle. Der Unterschied ist eine Designentscheidung.
- **Kern:** Plattform-Preisniveaus (Whop AI-Prompts €24–50 vs. Gumroad), warum identische Solo-Listings Preisarbitrage sind, wie das P1+P2-Bundle den Unterschied ehrlich begründet.
- **Regel:** Jeder Preisunterschied muss in einem Satz erklärbar sein, den der Käufer selbst findet.
- **Ehrlichkeit:** Der ursprüngliche Plan WAR das identische Solo-Listing — im Review gekippt.
- **CTA:** Blueprint (€84-für-€29-Anker als Gegenbeispiel: aggressive Preise, offen erklärt). **Visual:** Preis-Matrix.

---

## Werbe-Mechanik (alle Issues)

1. Fester Footer lt. Template: Blueprint-CTA + Sampler + Repo — genau EIN Kauf-CTA
2. Jedes Issue recycelt zu: 1 X-Thread (Absätze = Tweets) + 1 LinkedIn-Post (Kalender-Pillar "Prompt Engineering"/"Build in Public")
3. Chronik-Nummern sind die Serien-Klammer — Leser können jede Story im Repo nachprüfen
4. Nach Issue #8: Themenspeicher aus neuen Fehlern ≥#104 (die Pipeline schreibt sich selbst, solange gebaut wird)
