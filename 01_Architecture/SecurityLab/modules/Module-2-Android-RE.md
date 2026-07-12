---
title: "Module 2 - Android Reverse Engineering (JADX + Frida)"
tags: [security-lab, module, android, jadx, frida, reverse-engineering]
status: complete
---

# Module 2 - Android Reverse Engineering​‌‍‍‌‌‍‍‌‌‍‍‍‌‍‌‍‌‌‍‍‌‍‍‍‌‌‍‍‌‍‌‍‌‍‍‌‌‌‍‍‌‍‍‌‍‌‌‌‌‌‍‍‌‌‌‍‌‍‍‍‍‍‌‌‌‍‍‍‌‌‍‍‌‍‍‌‌‍‌‍‌‍‍‌‌‌‍‍‌‍‍‍‌‍‌‍‌‍‍‍‌‌‍‌‌‍‍‌‍‌‌‍‌‍‍‍‌‍‌‌‌‍‍‍‍‌‌‍‌‌‍‌‍‍‌‍‌‍‍‌‍‍‌‌‌‍‍‌‌‌‌‍‌‍‍‌‌‌‍‌‌‍‍‍‍‍‌‌‌‍‌‌‌‌‍‍‌‍‌‌‌‌‍‍‌‌‍‌‍‍‌‍‌‍‌‌‌‌‍‌‌‍‌‍‍‌‌‍‌‌‍‌‍‍‌‍‌‍‌‌‍‍‍‌‌‍‌‌‌‌‍‍‌‌‍‌‍‍‌‍‌‌‍‍‌‍‌‌‌‌‍‌‍‍‍‌‌‌‍‍‌‌‌‌‌‍‍‍‍‍‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‌‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‍‍‌‌‌‍‌‍‍‌‍‌‌‍‍‌‌‌‌‌‌‍‍‌‍‍‍‌‌‍‌‍‍‌‍‌‌‍‍‌‌‌‍‌‌‍‍‌‌‌‍​

**Goal:** take an Android app you are authorized to analyze, read its logic statically,
then confirm your hypotheses dynamically. By the end you can run the standard
static->dynamic RE loop with evidence at every step, and you know why "the decompiler
suggested it" is a hypothesis, not a finding.

**Prerequisite:** Module 1. All dynamic work happens inside Windows Sandbox, offline.

**Legal targets only.** Practice on: (a) apps you wrote, (b) open-source,
**intentionally-vulnerable training apps** published for exactly this purpose. The
reference target for this module is the OWASP MAS crackme / a comparable open trainer
(e.g. a "Damn Insecure" style app) - built and licensed to be reverse-engineered.
**Never** decompile commercial apps to bypass licensing, extract paid content, defeat
DRM, or lift credentials. Reverse-engineering law varies by country; "for learning" is
not a universal defense. Re-read `SAFETY-and-LEGAL.md`.

**Time:** ~90-120 min.

---

## 2.1 Concept: the static -> dynamic loop

Reverse engineering an app is a loop, not a single pass:

1. **Static** - read the code without running it. Cheap, safe, and gives you a map plus
   a list of *hypotheses* ("this method looks like the license check").
2. **Dynamic** - run the app under instrumentation and watch reality. Confirms or kills
   each hypothesis with evidence.

Static alone is misleading: obfuscation, runtime-computed values, reflection, and
server-side logic all hide from a decompiler. Dynamic alone is blind: you don't know
where to look. You alternate - static to form a hypothesis, dynamic to test it, back to
static with what you learned.

This is the same evidence discipline as Module 4's payload proof: you do not believe a
claim until you've watched the running system produce it.

## 2.2 APK anatomy

An `.apk` is a zip. Know what's inside before you decompile:

| Part | What it is | Why you care |
|---|---|---|
| `AndroidManifest.xml` | components, permissions, entry points | where execution can start; attack surface |
| `classes*.dex` | compiled Dalvik bytecode | the logic - what JADX turns back into Java |
| `resources.arsc` / `res/` | strings, layouts, assets | hardcoded strings, endpoints, feature flags |
| `lib/` | native `.so` per ABI | logic that hides from a Java decompiler (note the ABI!) |
| `assets/` | bundled files | embedded configs, models, sometimes prompts (-> Module 5) |

> ABI reminder from the fu75ch1 stack: check the ABI before assuming a native lib is
> even loadable on your analysis device (`aapt dump badging`, or read `lib/` folder
> names). armeabi-v7a and arm64-v8a are not interchangeable.

## 2.3 Lab: static analysis with JADX (pinned 1.5.5)

1. Get a **legal** target: download the reference training app from its official
   open-source project into `C:\lab-share` (read-only into the sandbox, per Module 1).
   Do not use anything you're not licensed to analyze.

2. Open it in JADX (`jadx-gui`). Start with the map, not the code:
   - **Manifest first.** Read entry points (activities, services, receivers) and the
     permission list. Permissions telegraph intent - a "flashlight" app requesting
     `READ_SMS` is a hypothesis waiting to happen.
   - **Strings + resources.** Use JADX's search across all sources for endpoints,
     `http`, `token`, `secret`, `debug`, feature-flag names. On a training target this
     is where the intentionally-planted weaknesses announce themselves.
   - **Navigate by entry point.** From an activity's `onCreate`, follow the call graph
     into the logic you care about.

3. **Form hypotheses, don't conclude.** Write them down as testable statements:
   - "Method `X.validate()` decides whether feature Y unlocks."
   - "The value in `assets/config.json` is read at startup by class Z."
   Each becomes a dynamic test in 2.4. A hypothesis you can't state as "if I observe A,
   it's confirmed" is too vague - sharpen it.

**Checkpoint:** you have a one-page static map (entry points, interesting strings,
call paths) and at least three sharply-stated hypotheses.

## 2.4 Lab: dynamic analysis with Frida (pinned 17.15.0)

Everything here runs **inside Windows Sandbox** (Module 1), on an emulator or a device
you own, offline unless a step needs network.

1. Set up Frida in a dedicated venv (never system Python):
   ```
   python -m venv .re-venv
   .re-venv\Scripts\Activate.ps1
   pip install frida==17.15.0 frida-tools
   ```

2. **Hook to observe, not to modify - first.** The initial goal is evidence: attach to
   the running app and trace the methods your hypotheses named, printing arguments and
   return values. A generic method-trace hook (concept):
   ```javascript
   // observe a method: what goes in, what comes out. Evidence, not tampering.
   Java.perform(function () {
     var Target = Java.use("com.example.trainer.SomeClass");
     Target.validate.implementation = function () {
       var ret = this.validate.apply(this, arguments);   // call the real one
       console.log("[observe] validate() args=" + JSON.stringify(Array.prototype.slice.call(arguments)) + " -> " + ret);
       return ret;                                        // return it unchanged
     };
   });
   ```
   Run it, exercise the app, read the trace. Does reality match your static hypothesis?

3. **Confirm or kill each hypothesis** with the trace output. This is the point of the
   exercise - not "make the app do X," but "prove what the app actually does." On a
   training target, altering a return value to see the effect is a legitimate learning
   step *because you own the boundary and the target is built for it* - but the skill
   being taught is observation and proof, which transfers to any legitimate assessment.

**Checkpoint:** every hypothesis from 2.3 is now marked confirmed or rejected, each with
a line of hook output as evidence. No "I think" left unproven.

## 2.5 The discipline that carries into Module 5

Hypothesis -> static evidence -> dynamic proof -> written finding. Never a claim without
a hook that shows it. This is deliberately the same standard as Module 4: a decompiler's
suggestion is as untrustworthy as a scanner's number until the running system confirms
it. Module 5's capstone makes you do both at once - RE an app to extract its embedded
prompt, then red-team what you extracted.

## Exercise

1. Produce the one-page static map of the reference training app (entry points, strings,
   call paths). Scrub any identifiers before saving.
2. State three hypotheses as testable "if I observe A, it's confirmed" statements.
3. Write a Frida observe-hook for each; run inside Sandbox; capture the trace.
4. Write a short finding for each: hypothesis, static evidence, dynamic proof, verdict.
5. One reflection sentence: which hypothesis did the dynamic step *kill*, and what did
   static analysis miss that made you wrong?

## Takeaway

Static tells you where to look; dynamic tells you what's true. The competent RE loop
alternates between them and treats every decompiled line as a lead to verify, not a fact.
The analyst who "reads the code and knows" is the one who gets fooled by obfuscation and
runtime behavior. Prove it with a hook - or you don't know it yet.

---

Next: `Module-3-Firmware-Forensics.md`, or jump to `Module-5-Capstone.md` once Modules 3
lands, to combine this with AI red-teaming end to end.
