---
title: fu75ch1 Security Lab
tags: [product, security-lab, reverse-engineering, ai-red-teaming, phase06, phase07, phase08]
version: "1.0"
date: 2026-07-11
status: complete (all 5 modules)
license: CC BY-NC 4.0
---

# fu75ch1 Security Lab​‌‍‍‌‌‍‍‌‌‍‍‍‌‍‌‍‌‌‍‍‌‍‍‍‌‌‍‍‌‍‌‍‌‍‍‌‌‌‍‍‌‍‍‌‍‌‌‌‌‌‍‍‌‌‌‍‌‍‍‍‍‍‌‌‌‍‍‍‌‌‍‍‌‍‍‌‌‍‌‍‌‍‍‌‌‌‍‍‌‍‍‍‌‍‌‍‌‍‍‍‌‌‍‌‌‍‍‌‍‌‌‍‌‍‍‍‌‍‌‌‌‍‍‍‍‌‌‍‌‌‍‌‍‍‌‍‌‍‍‌‍‍‌‌‌‍‍‌‌‌‌‍‌‍‍‌‌‌‍‌‌‍‍‍‍‍‌‌‌‍‌‌‌‌‍‍‌‍‌‌‌‌‍‍‌‌‍‌‍‍‌‍‌‍‌‌‌‌‍‌‌‍‌‍‍‌‌‍‌‌‍‌‍‍‌‍‌‍‌‌‍‍‍‌‌‍‌‌‌‌‍‍‌‌‍‌‍‍‌‍‌‌‍‍‌‍‌‌‌‌‍‌‍‍‍‌‌‌‍‍‌‌‌‌‌‍‍‍‍‍‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‌‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‍‍‌‌‌‍‌‍‍‌‍‌‌‍‍‌‌‌‌‌‌‍‍‌‍‍‍‌‌‍‌‍‍‌‍‌‌‍‍‌‌‌‍‌‌‍‍‌‌‌‍​

A reproducible, isolated lab for two disciplines that are usually taught separately:
**reverse engineering** (Android + firmware) and **AI red-teaming** (testing a system
prompt's robustness). You provision the environment from pinned, idempotent scripts,
work through numbered modules against *legal* targets, and finish with a capstone that
connects both halves.

This is not a video course and not a pile of slides. It is the same lab the fu75ch1
project uses for Phases 6-8, packaged so you can rebuild it on your own machine and
verify every step yourself.

---

## What makes this different

Most red-teaming material hands you a tool and a number. This lab teaches the part
that number depends on: **did your test actually measure what you think it measured?**

Module 4 is built around a real, documented measurement failure from this project
(error chronicle #114/#115): a red-team harness that reported attack-success numbers
for months while never actually injecting the system prompt it claimed to be testing.
Every published number measured the bare model. You will reproduce that class of bug,
see the payload-verification method that catches it, and build the habit that no
scanner output survives without it.

No other lab ships its own worst measurement mistake as a teaching module. This one does.

---

## Honest status (read before buying)

This project labels what is built, what is partial, and what is planned. The lab is
no exception.

| Module | Topic | Status |
|---|---|---|
| 1 | Isolation & trust boundaries (Windows Sandbox + WSL2) | **Complete** |
| 2 | Android RE (JADX static, Frida dynamic) | **Complete** |
| 3 | Firmware forensics (Binwalk; hardware read-out as concept) | **Complete** |
| 4 | AI red-teaming + payload verification (the #114/#115 lesson) | **Complete** |
| 5 | Capstone: extract a prompt, then red-team it | **Complete** |

All five modules are written and usable. Two honest caveats remain visible rather than
hidden: hardware read-out in Module 3 is taught as **concept and workflow** (the project's
own hardware chain is pending), and the portable-tool download hashes in the RE provisioner
are left as `CONFIRM` for you to verify against each vendor's official checksum before
install - trust-on-first-use isn't good enough for tooling (error #113). Free updates
continue, but there is no roadmap gap: you're buying a complete lab.

Hardware read-out (Module 3, Flashrom/CH341A) is taught as **concept and workflow**,
not as a shipped capability - the fu75ch1 project itself has this marked "pending", and
the lab says so rather than pretending otherwise.

---

## Design: scripts, not images

This lab does **not** ship multi-gigabyte VM images or bundle third-party tools. That
would mean redistributing software under licenses that don't allow it, and shipping
stale, unverifiable binaries.

Instead you get **idempotent provisioning scripts** that build the environment from
official sources at pinned versions, and a verifier that proves the result. This is
slower on first run and dramatically more honest: you can read every line, you download
each tool from its own vendor, and you verify each hash yourself. It mirrors the
project's own supply-chain rule - *verify source, pin version, verify hash, enable
rollback*.

Two isolated tracks, chosen to match each tool's nature:

- **AI red-teaming** -> Docker (OS-agnostic, clean teardown): `provision/ai-redteam/`
- **Reverse engineering** -> Windows Sandbox + WSL2 (real isolation for untrusted
  binaries): `provision/re-lab/`

---

## Pinned toolchain

| Tool | Version | Track | Source |
|---|---|---|---|
| garak | 0.15.1 | AI RT | PyPI |
| Promptfoo | 0.121.17 | AI RT | npm |
| PyRIT | 0.14.0 | AI RT | PyPI |
| JADX | 1.5.5 | RE | GitHub releases |
| Frida | 17.15.0 | RE | PyPI + GitHub |
| Ghidra | 12.1.2 | RE | official release |
| Binwalk | 2.3.3 | RE (WSL2) | apt / source |

Versions are pinned deliberately. When you upgrade, you upgrade on purpose and
re-verify - you don't drift.

---

## Start here

1. Read `SAFETY-and-LEGAL.md` first. It is not boilerplate - it defines what you may
   and may not point these tools at. The lab only works on targets you are legally
   entitled to analyze.
2. Pick a track and run its provisioning (`provision/ai-redteam/` or `provision/re-lab/`).
3. Run `provision/Verify-LabSetup.ps1` - it confirms every pinned tool is present at the
   correct version before you start.
4. Work the modules in `modules/` in order. Module 1 (isolation) is a prerequisite for
   everything else. All five modules are complete.

---

## Module index

- `modules/Module-1-Isolation.md` - trust boundaries, Sandbox + WSL2, why isolation is the first control
- `modules/Module-2-Android-RE.md` - JADX static decompilation + Frida dynamic instrumentation
- `modules/Module-3-Firmware-Forensics.md` - Binwalk extraction, entropy, hardware read-out concept
- `modules/Module-4-AI-RedTeaming.md` - garak + Promptfoo against your own prompt, and the payload-verification lesson
- `modules/Module-5-Capstone.md` - extract an embedded prompt via RE, then red-team it

---

## What you need to bring

- Windows 11 Pro or Enterprise (Windows Sandbox requires Pro+; Home users can use the
  WSL2 track and Docker Desktop, with Sandbox steps noted as optional)
- Docker Desktop (AI red-teaming track)
- ~30 GB free disk, virtualization enabled in BIOS
- An Anthropic (or other provider) API key for the AI red-teaming module - the lab
  never ships or asks for a key in any file; you inject it via environment variable
- Legal analysis targets (your own apps, or the open-source deliberately-vulnerable
  training targets named in Module 2)

---

© fu75ch1 - CC BY-NC 4.0. Non-commercial use with attribution. This lab is for
defensive security education and testing systems you own or are authorized to test.
