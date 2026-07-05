---
date: 2026-07-04
tags: [newsletter, substack, issue, draft]
status: 📝 DRAFT — Issue #1, publizieren nach Substack-Livegang
title: Issue 01 — The error log that lost an error
---

# The error log that lost an error

*(Substack Issue #1 — DRAFT, ~600 Wörter, EN)*

---

My project has one core claim: every mistake gets a number, a root cause, and a prevention rule. 103 entries so far, published, nothing deleted.

Last Friday I found out the claim was false.

**The context, in one sentence:** fu75ch1 is a local-first AI operating system I built solo in two weeks on a normal Windows laptop — and the error chronicle is the product's spine, because the mistakes are where the actual knowledge lives.

During a full review of the public docs, a consistency pass walked the error numbers in sequence. #94, #95 — then #97. No #96.

Error #96 existed. It was real: a guard clause for the PII scrubber that masks hostnames before anything leaves the machine — the scrub regex broke when `$env:COMPUTERNAME` came back empty, because an empty string in a regex alternation matches in ways you don't want. The fix was written, committed, referenced in the session log by number. Everything about #96 was documented.

Except the chronicle entry. The one place whose entire job is to hold it.

**The root cause is boring, which is the point.** There was no automated check connecting "error numbers referenced anywhere" to "error numbers that exist in the chronicle." The chronicle relied on the same mechanism as every manual process: remembering. And a solo builder at 1 a.m., mid-fix, with the commit already pushed, does not remember.

Here's what the gap check looks like now — it runs before every publication:

```powershell
# Every number 9..latest must exist in the chronicle
$missing = 9..$metrics.error_latest_number |
    Where-Object { $chronicle -notmatch "^\|\s*$_\s*\|" }
```

Fifteen lines of PowerShell that the project should have had from entry #10.

**The prevention rule, verbatim from the chronicle:** *every referenced error number MUST have a chronicle entry — enforced by an automated consistency check before every publication.*

And yes: forgetting to log #96 is itself error **#103** now, category PROZESS, backfilled with a note saying exactly when and why. The chronicle documents its own failure. Anything else would make the whole thing decorative.

**The honest part:** the check only catches gaps in the sequence. If I ever fix something and never reference it *anywhere* — no commit, no log, no number — no tool will find it. Tooling narrows the trust gap; it doesn't close it. That limitation stays in the docs.

The meta-lesson, if you're building anything with a "we document everything" claim: the claim is a system requirement, not a habit. Habits fail silently. Systems fail loudly, and loud is what you want.

---

*Error #103 of 103 — the full chronicle (all entries, root cause + fix + prevention rule each) ships with [The fu75ch1 Blueprint](https://fu75ch1.gumroad.com/l/blueprint), €29 Early Bird for the first 50.*
*Free: [20-error sampler](https://github.com/0xWrt/fu75ch1-OS) · [the repo](https://github.com/0xWrt/fu75ch1-OS)*

---

> **Redaktions-Notizen (vor Publikation löschen):**
> - Fehlerzahl "103" gegen metrics.json prüfen (steigt vermutlich bis Publikationstag)
> - Sampler-Link auf echten Download-/Landing-Link umstellen sobald vorhanden
> - Code-Block gegen finale Invoke-MetricsCheck.ps1-Zeilen abgleichen (sinngemäß korrekt, wörtlich vereinfacht)
