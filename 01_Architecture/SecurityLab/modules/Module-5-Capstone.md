---
title: "Module 5 - Capstone: Extract a Prompt, Then Red-Team It"
tags: [security-lab, module, capstone, reverse-engineering, ai-red-teaming]
status: complete
---

# Module 5 - Capstone: Extract a Prompt, Then Red-Team It​‌‍‍‌‌‍‍‌‌‍‍‍‌‍‌‍‌‌‍‍‌‍‍‍‌‌‍‍‌‍‌‍‌‍‍‌‌‌‍‍‌‍‍‌‍‌‌‌‌‌‍‍‌‌‌‍‌‍‍‍‍‍‌‌‌‍‍‍‌‌‍‍‌‍‍‌‌‍‌‍‌‍‍‌‌‌‍‍‌‍‍‍‌‍‌‍‌‍‍‍‌‌‍‌‌‍‍‌‍‌‌‍‌‍‍‍‌‍‌‌‌‍‍‍‍‌‌‍‌‌‍‌‍‍‌‍‌‍‍‌‍‍‌‌‌‍‍‌‌‌‌‍‌‍‍‌‌‌‍‌‌‍‍‍‍‍‌‌‌‍‌‌‌‌‍‍‌‍‌‌‌‌‍‍‌‌‍‌‍‍‌‍‌‍‌‌‌‌‍‌‌‍‌‍‍‌‌‍‌‌‍‌‍‍‌‍‌‍‌‌‍‍‍‌‌‍‌‌‌‌‍‍‌‌‍‌‍‍‌‍‌‌‍‍‌‍‌‌‌‌‍‌‍‍‍‌‌‌‍‍‌‌‌‌‌‍‍‍‍‍‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‌‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‍‍‌‌‌‍‌‍‍‌‍‌‌‍‍‌‌‌‌‌‌‍‍‌‍‍‍‌‌‍‌‍‍‌‍‌‌‍‍‌‌‌‍‌‌‍‍‌‌‌‍​

**Goal:** run the whole lab end to end. Reverse engineer an application **you're
authorized to analyze**, extract the AI system prompt it embeds, then red-team *that
extracted prompt* with the verified methodology from Module 4. Two disciplines, one
workflow, one finding.

**Prerequisites:** Modules 1-4. This is where they combine.

**Time:** ~2-3 hours (a real mini-assessment).

**Why this is the capstone:** reverse engineering tells you what a system is *instructed*
to do; red-teaming tells you how well those instructions *hold*. Neither half answers the
whole question. An app can have a beautifully strict prompt that a decompile reveals is
never actually sent; or a prompt that's present and correct but trivially bypassed. Only
running both, in order, gives you the truth.

---

## 5.1 Legal framing (non-negotiable, first)

More apps now embed an LLM with a system prompt. Extracting that prompt **from an app you
own or are explicitly authorized to test** is legitimate assessment. Doing it to a third
party's production app to lift their prompt or attack their service is unauthorized access
- different act, different law, not this lab. The capstone uses your own app or an
open-source training target that ships an embedded prompt. `SAFETY-and-LEGAL.md` governs
every step. If you cannot name your right to the target, stop.

## 5.2 Phase A - Extract (Modules 1-3)

1. **Isolate** (M1). Everything runs inside Sandbox/WSL2, offline unless a step needs the
   network.
2. **Locate the prompt.** It usually lives in one of:
   - an app resource/asset (`assets/`, string resources) -> JADX static search (M2)
   - a value assembled at runtime -> Frida hook to capture it live (M2)
   - a packed blob or firmware payload -> Binwalk extraction (M3)
3. **Verify you have the real, current prompt.** A static string can be stale, partial, or
   a decoy. Confirm it with a dynamic observation: Frida-hook the actual request the app
   builds and read the system content it sends. Static find + dynamic confirmation - the
   same "prove it, don't assume it" standard as every other module.

**Checkpoint:** you hold the exact system prompt the app sends at runtime, confirmed by a
live observation, not just a decompiled string.

## 5.3 Phase B - Red-team the extracted prompt (Module 4)

1. **Payload proof first.** Load the extracted prompt into the M4 harness and run the
   zero-cost payload probe. Confirm `['system','user']` and that the byte length matches
   the extracted prompt. *Yes, error #114 applies even here - especially here. It would be
   a perfect irony to reverse-engineer a prompt correctly and then test the bare model.*
2. **Measure resistance.** Run garak/Promptfoo against the verified prompt with a real
   probe set.
3. **Adjudicate by hand.** Sample the flagged successes: real policy violations vs.
   detector false positives. Report sample size and detector, never a bare percentage.

**Checkpoint:** an ASR you can defend - verified payload, adjudicated hits, stated
methodology.

## 5.4 Phase C - The write-up (assessment-grade)

Produce a report a real engagement would deliver:

- **What the app instructs its model to do** (from the extracted prompt).
- **How robust those instructions are** (from the verified red-team, with method).
- **The gap** - where extraction revealed something the prompt's authors probably didn't
  intend to expose, or where red-teaming shows the prompt doesn't hold.
- **What you'd fix**, and - if this affects other people and you found it in-scope -
  **responsible disclosure** to the vendor before any public write-up.

## 5.5 What the capstone actually tests (about you)

Every habit the lab teaches has to fire at once:

- **Isolation** (M1) - you didn't run untrusted code on your host.
- **Evidence-based RE** (M2/M3) - every claim about the app is backed by static + dynamic proof.
- **Payload verification** (M4) - you tested the extracted prompt, not the bare model.
- **Honest measurement** (M4) - you adjudicated hits and reported method, not a headline number.
- **Legal discipline** (throughout) - you only touched a target you had the right to.

If any one is weak, the capstone exposes it. That's the design.

## Exercise

1. On your own app (or a training target with an embedded prompt), extract the system
   prompt and confirm it live with a Frida hook.
2. Run the payload proof; capture the `['system','user']` evidence for the extracted prompt.
3. Red-team it; hand-adjudicate 5-10 flagged hits.
4. Write the four-part finding (instructs / robustness / gap / fix). Keep it scrubbed and
   disclosure-ready.
5. One paragraph: what did combining RE and red-teaming reveal that neither would have
   alone?

## Takeaway

This is the whole job in miniature: understand what a system is told to do, prove how well
it holds, and stay honest and lawful throughout. The two halves of this lab were never
separate skills - they're two questions about the same system, and the capstone is where
you finally ask both at once.

---

You've completed the fu75ch1 Security Lab. The discipline that runs through all five
modules - *prove it, don't assume it* - is the transferable skill. The tools change; that
habit doesn't.
