---
date: 2026-07-05
tags: [newsletter, substack, issue, draft]
status: 📝 DRAFT — Issue #2, publizieren Woche nach Issue #1
title: Issue 02 — The 0% that would have been a lie
---

# The 0% that would have been a lie

*(Substack Issue #2 — DRAFT, ~550 Wörter, EN)*

---

I red-teamed my own AI system prompt and got a 0% attack success rate. I could have put that number on every product page. It would have been technically true, verifiable, and completely dishonest.

**Context in one sentence:** fu75ch1 is a local-first AI operating system built solo in two weeks; before shipping the hardened system prompt as a product, it had to survive an actual red-team.

The 0% came from a pilot: Garak (NVIDIA's LLM vulnerability scanner) running AutoDAN against the prompt — with all of three attempts. Three. A sample size that proves nothing except that the pipeline runs.

The real test came next: DanInTheWild, a probe built from **512 real jailbreaks collected from actual communities** — not synthetic attacks, the stuff people genuinely paste into chatbots. Result against the same prompt: **41.8% got through.**

One iteration later (v4.6, with new defenses against dual-output framing and authority framing), the number came down to **38.43%**. That's the number on the product pages. Next to the 0%. With labels.

**Then it got more interesting.** Run 7, against the improved v4.7 prompt, came back *worse*: 48.52%. Regression? I read the actual flagged responses instead of trusting the aggregate — and most "successes" were the MitigationBypass detector flagging *harmless refusals* as jailbreaks. False positives, plus sampling noise across 512 probabilistic generations.

```text
Run 4  AutoDAN        3 probes    0%     <- true and useless
Run 5  DanInTheWild   512 probes  41.8%
Run 6  DanInTheWild   512 probes  38.43% <- the published number
Run 7  DanInTheWild   512 probes  48.52% <- detector noise, documented
```

All four runs are public, including the embarrassing ones.

**The prevention rule, verbatim from the error chronicle (#37):** *never publish a raw scanner metric unvalidated — read the actual failures. Raw ASR numbers lie in both directions.*

**The honest part:** 38.43% is not a good number in absolute terms. Roughly 4 in 10 sophisticated community jailbreaks still get through a hardened prompt — prompt-level defense alone is a speed bump, not a wall. That's *why* the architecture has more layers, and why the docs label two of them "planned" instead of pretending they exist.

If a security product shows you exactly one benchmark number, ask two questions: what was the sample size, and what did the other runs say. If there are no other runs, that's your answer.

---

*The full red-team documentation (all runs, detector analysis, prompt iterations v4.3→v4.7) ships with [The fu75ch1 Blueprint](https://fu75ch1.gumroad.com/l/blueprint) — €29 Early Bird for the first 50. Free: the [20-error sampler] and the [sanitized repo](https://github.com/0xWrt/fu75ch1-OS).*

---

> **Redaktions-Notizen (vor Publikation löschen):**
> - Zahlen gegen `metrics.json` prüfen
> - Sampler-Link finalisieren (wie Issue #1)
> - Als Begleit-Visual: `02_Shops\_Assets\P2_opsec_audit_35of38.svg` (PNG-Export)
