---
title: "Module 1 - Isolation & Trust Boundaries"
tags: [security-lab, module, isolation, sandbox, wsl2]
status: complete
---

# Module 1 - Isolation & Trust Boundaries​‌‍‍‌‌‍‍‌‌‍‍‍‌‍‌‍‌‌‍‍‌‍‍‍‌‌‍‍‌‍‌‍‌‍‍‌‌‌‍‍‌‍‍‌‍‌‌‌‌‌‍‍‌‌‌‍‌‍‍‍‍‍‌‌‌‍‍‍‌‌‍‍‌‍‍‌‌‍‌‍‌‍‍‌‌‌‍‍‌‍‍‍‌‍‌‍‌‍‍‍‌‌‍‌‌‍‍‌‍‌‌‍‌‍‍‍‌‍‌‌‌‍‍‍‍‌‌‍‌‌‍‌‍‍‌‍‌‍‍‌‍‍‌‌‌‍‍‌‌‌‌‍‌‍‍‌‌‌‍‌‌‍‍‍‍‍‌‌‌‍‌‌‌‌‍‍‌‍‌‌‌‌‍‍‌‌‍‌‍‍‌‍‌‍‌‌‌‌‍‌‌‍‌‍‍‌‌‍‌‌‍‌‍‍‌‍‌‍‌‌‍‍‍‌‌‍‌‌‌‌‍‍‌‌‍‌‍‍‌‍‌‌‍‍‌‍‌‌‌‌‍‌‍‍‍‌‌‌‍‍‌‌‌‌‌‍‍‍‍‍‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‌‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‍‍‌‌‌‍‌‍‍‌‍‌‌‍‍‌‌‌‌‌‌‍‍‌‍‍‍‌‌‍‌‍‍‌‍‌‌‍‍‌‌‌‍‌‌‍‍‌‌‌‍​

**Goal:** before you touch a single untrusted artifact, build the boundary that makes
being wrong survivable. By the end you can spin up a disposable analysis environment,
reason about what crosses its edges, and explain why isolation is the *first* control,
not a nice-to-have.

**Prerequisite:** none. This module gates every other module.

**Time:** ~45-60 min.

---

## 1.1 Concept: assume the artifact is hostile

Reverse engineering and dynamic analysis mean running or dissecting code whose behavior
you don't yet trust. The professional default is **presumption of hostility**: the
binary, the APK, the firmware image is treated as malware until you have evidence
otherwise. That single assumption reorganizes everything - where you run it, what it
can reach, what you carry back out.

A trust boundary is a line with a rule: data may cross it only under stated conditions.
Your job in analysis is to know exactly where those lines are and never cross one by
accident. The three we care about:

1. **Host <-> analysis environment** - the most important line. Nothing untrusted runs
   on your host, ever.
2. **Analysis environment <-> network** - off by default. Malware's first move is often
   to phone home or pull a second stage.
3. **Analysis environment <-> your data** - what you copy back out (and its hash) is a
   deliberate decision, not a reflex.

## 1.2 Two isolation mechanisms, two jobs

| Mechanism | Isolation strength | Best for | Teardown |
|---|---|---|---|
| **Windows Sandbox** | Strong (separate disposable VM) | running/instrumenting untrusted Windows binaries, Frida dynamic work | destroyed on window close |
| **WSL2 (disposable distro)** | Good (lightweight VM) | Linux tooling, Binwalk firmware extraction, static work | `wsl --unregister <distro>` |

Static analysis (decompiling, reading strings) is lower risk than dynamic analysis
(actually executing the thing). Match the mechanism to the risk: static in WSL2 is fine;
anything that *runs* an untrusted binary goes in Sandbox with networking off.

## 1.3 Lab: stand up the Sandbox

1. Enable the feature (Pro/Enterprise/Education only):
   ```powershell
   Enable-WindowsOptionalFeature -Online -FeatureName "Containers-DisposableClientVM" -All
   ```
   Reboot if prompted. (Windows Home: skip to 1.4, use WSL2 for everything and note that
   you cannot safely run untrusted Windows binaries without a full VM.)

2. Prepare a **read-only** host share for targets and installers:
   ```powershell
   New-Item -ItemType Directory -Path C:\lab-share -Force
   ```
   Put your *legal* target sample here (see SAFETY-and-LEGAL.md for what qualifies).

3. Edit `provision/re-lab/RE-Sandbox.wsb`: point `<HostFolder>` at `C:\lab-share`.
   Note what's already set for you and *why*:
   - `Networking = Disable` - the sample cannot reach the internet.
   - `ReadOnly = true` - the sample cannot alter your host copy.
   - `ClipboardRedirection = Disable` - no accidental data bridge.
   - `ProtectedClient = Enable` - hardened RDP client for the sandbox session.

4. Double-click the `.wsb`. You now have a throwaway Windows that vanishes on close.

**Checkpoint:** inside the sandbox, confirm the target is visible at `C:\lab` and that
you have no internet (`ping 1.1.1.1` should fail). If ping succeeds, your boundary #2 is
open - stop and fix the config.

## 1.4 Lab: a disposable WSL2 analysis distro

Keep RE work off your daily WSL distro. Create a dedicated, disposable one:

```powershell
wsl --install -d Ubuntu-24.04            # or your preferred distro
# ...set it up, do firmware work in it...
wsl --unregister Ubuntu-24.04            # destroys it completely when done
```

Inside it, the Binwalk toolchain from `Provision-RELab.ps1` handles firmware (Module 3).

**Checkpoint:** you can create and fully destroy a WSL distro without touching your host
filesystem or your main distro.

## 1.5 The exit rule: what you carry back out

When analysis is done, the only things that should cross back to your host are
**findings** (notes, screenshots you've scrubbed) - never the live artifact. If you must
extract a file (an unpacked resource, an extracted config):

1. Hash it on both sides and record the hash.
2. Know exactly why you're moving it.
3. Treat it as sensitive until proven inert.

## Exercise (do this before Module 2/3)

1. Stand up the Sandbox with networking **off** and confirm no egress.
2. Place a benign test file in `C:\lab-share`, confirm it appears read-only in the sandbox.
3. Write, in your own words, the three trust boundaries for *your* setup and the rule on
   each. If you can't state them, you're not ready to analyze anything hostile yet.

## Takeaway

Isolation is not the boring prerequisite before the "real" security work - it *is* the
security work. Every later module assumes you are operating inside a boundary you
understand. The analyst who skips this is the one whose "test malware" becomes "malware".

---

Next: `Module-4-AI-RedTeaming.md` (the other complete module), or `Module-2-Android-RE.md`
when v1.1 lands.
