---
date: 2026-07-04
tags: [content, build-in-public, posts, reddit, x]
status: ✅ v1.0 — 3 Posts fertig (Teil 4 des Auftrags)
title: Build-in-Public — 3 Posts (Launch-Woche)
---

# Build-in-Public — 3 Posts

> Kanäle: X/Twitter (Thread-tauglich), Reddit-Kommentartauglich (r/privacy, r/selfhosted —
> dort NUR als Antwort/Kontext, nie als Selbstpromo-Post), HN-Kommentar unter dem eigenen
> Show-HN. Sprache: EN. Vor Posten: Zahlen gegen `metrics.json` prüfen.
> Screenshots: siehe `02_Shops\Produkt-Uebersicht.md` (PII-Regeln!).

---

## Post 1 — Die #103-Story (Launch-Tag, stärkster Post)

My side project's core claim is "every mistake numbered and documented." 103 entries.

Last week a consistency check found the chronicle jumped from #95 to #97.

Error #96 was real. Fixed, committed, referenced by number in the session log. The only place it never made it into: the error chronicle itself.

So now there's error #103: "the error chronicle lost an error." Category: PROCESS. Root cause: no automated gap check — the log relied on remembering, and remembering is not a system.

The fix is 15 lines of PowerShell that compare referenced error numbers against actual entries, running before every publication.

Lesson: if your project claims "we document everything," that claim is a system requirement, not a habit. Habits fail silently.

Full chronicle (all 103, root cause + prevention rule each) is public-ish — 20 free in the sampler, link in bio.

*(Screenshot-Slot: Chronik-Ausschnitt mit #103-Eintrag)*

---

## Post 2 — Die 0%-vs-38.43%-Story (Tag 2, nach Show HN)

I red-teamed my own AI system prompt with Garak and got 0% attack success rate.

Great number. Completely useless.

The 0% came from a 3-probe pilot run. Three attempts. I could have led every product page with it — "0% jailbreak success, verified!" — and it would have been technically true.

The real test: DanInTheWild, 512 actual community jailbreaks. Result: 38.43% got through.

Both numbers are published, side by side, on every page. Because the moment you publish only the flattering one, everything else you claim becomes suspicious too.

Bonus honesty: Run 7 showed 48.52% — and after reading the actual failures, most were false positives from an oversensitive detector. That analysis is public too. Raw scanner metrics lie in both directions.

If a security product only shows you one number, ask what the other runs said.

*(Screenshot-Slot: Garak-Terminal-Output Run 6)*

---

## Post 3 — Die €84/€29-Launch-Ansage (Tag 3, Conversion-Post)

Two weeks ago I started selling the parts of my local-first AI stack as standalone guides: hardening, DNS/VPN, browser config, credential setup, the audit script, the system prompt. Nine products, €84 combined.

Today the whole thing went live as one package: The Blueprint — all 15 phases, every script, every config, and the complete error chronicle (103 numbered mistakes with root cause and prevention rule each).

€29 for the first 50 buyers, €49 after. Yes, that's a third of the parts price — the standalone products are for people who need one specific fix; the Blueprint is for people who want the system.

One more thing, because transparency is the whole brand: every product file carries an invisible license watermark (zero-width Unicode). The verification script ships in every download so you can inspect it yourself. Nothing in these files is hidden from the buyer.

Free stuff first if you're skeptical: 20-error sampler + 5-check OpSec script + the sanitized repo. Links in bio.

*(Screenshot-Slot: Vault-Struktur des Blueprint-Zips oder Dashboard)*

---

## Posting-Regeln
1. Reddit: Posts 1+2 nur als organische Kommentare/Antworten einsetzen, Post 3 gar nicht (Selbstpromo-Ban-Risiko). Link in Bio, nicht im Text.
2. X: als Einzelposts oder Post 1 als Thread (Absätze = Tweets).
3. HN: Post 1 + 2 sind Rohmaterial für Antworten im eigenen Show-HN-Thread — nie copy-pasten, immer auf den konkreten Kommentar anpassen.
4. Zahlen (105, 38.43%, 35/38, €84) vor jedem Post gegen `metrics.json`.

© fu75ch1 — intern
