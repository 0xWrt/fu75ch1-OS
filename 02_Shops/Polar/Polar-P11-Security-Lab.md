# Product 11 — Security Lab (Reverse Engineering + AI Red-Teaming)​‌‍‍‌‌‍‍‌‌‍‍‍‌‍‌‍‌‌‍‍‌‍‍‍‌‌‍‍‌‍‌‍‌‍‍‌‌‌‍‍‌‍‍‌‍‌‌‌‌‌‍‍‌‌‌‍‌‍‍‍‍‍‌‌‌‍‍‍‌‌‍‍‌‍‍‌‌‍‌‍‌‍‍‌‌‌‍‍‌‍‍‍‌‍‌‍‌‍‍‍‌‌‍‌‌‍‍‌‍‌‌‍‌‍‍‍‌‍‌‌‌‍‍‍‍‌‌‍‌‌‍‌‍‍‌‍‌‍‍‌‍‍‌‌‌‍‍‌‌‌‌‍‌‍‍‌‌‌‍‌‌‍‍‍‍‍‌‌‌‍‌‌‌‌‍‍‌‍‌‌‌‌‍‍‌‌‍‌‍‍‌‍‌‍‌‌‌‌‍‌‌‍‌‍‍‌‌‍‌‌‍‌‍‍‌‍‌‍‌‌‍‍‍‌‌‍‌‌‌‌‍‍‌‌‍‌‍‍‌‍‌‌‍‍‌‍‌‌‌‌‍‌‍‍‍‌‌‌‍‍‌‌‌‌‌‍‍‍‍‍‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‌‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‍‍‌‌‌‍‌‍‍‌‍‌‌‍‍‌‌‌‌‌‌‍‍‌‍‍‍‌‌‍‌‍‍‌‍‌‌‍‍‌‌‌‍‌‌‍‍‌‌‌‍​

> **Polar listing.** Mirror of the Gumroad P11 copy, Polar-formatted. Price €19 EB → €27.
> Slug: `security-lab`. Status: Polar channel prepared (paused until Polar relaunch).

---

## Summary

A reproducible security lab you build from pinned, idempotent scripts: reverse
engineering (Android + firmware) and AI red-teaming in one isolated environment. Built
around a real, documented measurement failure — so you learn the part most courses skip:
proving your test tested what you think it did.

## Description

Most security courses hand you a tool and a number. This lab teaches the part that number
depends on: **isolation you can trust, and measurements you can prove.**

The fu75ch1 Security Lab combines reverse engineering (Android + firmware) and AI
red-teaming into one isolated, reproducible environment. No stale multi-gigabyte VM image
— you provision the lab from pinned, idempotent scripts that pull each tool from its
official source and verify it, then work five numbered modules against targets you're
legally entitled to analyze. It's the same lab this project uses for its own Phases 6–8.

**What makes it different:** Module 4 is built around a real, documented measurement
failure from this project (error chronicle #114/#115). A red-team harness reported
attack-success numbers for months while never actually injecting the system prompt it
claimed to test — every published number measured the bare model. You reproduce that class
of bug, learn the payload-verification method that catches it, and build the habit that no
scanner number survives without it. No other lab ships its own worst measurement mistake as
a teaching module. This one does.

## What you get

- **Two isolated tracks:** AI red-teaming (Docker: garak 0.15.1, Promptfoo 0.121.17, PyRIT 0.14.0) and reverse engineering (Windows Sandbox + WSL2 provisioner: JADX 1.5.5, Ghidra 12.1.2, Frida 17.15.0, Binwalk 2.3.3)
- **A verifier** that proves the toolchain is present at pinned versions — an actual check, not an exit code (the #108 lesson)
- **Five complete numbered modules** with hands-on exercises
- **The payload-verification lesson** (#114/#115) — measurement integrity, taught from a real failure
- **A safety & legal layer** defining exactly what these tools may and may not be pointed at

## Honest status

All five modules are complete — this is a finished lab, not an MVP with a roadmap. Two
caveats stay visible rather than hidden: hardware read-out (Module 3) is taught as concept
and workflow, not a bench demo (the project's own hardware chain is pending); and the
portable-tool download hashes are left as `CONFIRM` for you to verify against each vendor's
official checksum before install (error #113). Future updates are free.

## Who it's for

Practitioners who want a reproducible RE + AI-red-team bench, not a lecture — and anyone
shipping an AI system prompt who needs to test it *correctly*. Explicitly defensive: not
for attacking systems you don't own.

## What you need

Windows 11 Pro/Enterprise (Sandbox) or Home + WSL2/Docker, Docker Desktop, ~30 GB free,
virtualization enabled, an API key (injected via env var — never shipped in any file), and
legal analysis targets.

---

**Format:** `.zip` — all modules, provisioning scripts, Dockerfile, Sandbox config, verifier.
**Updates:** free forever.
**Early Bird:** first 50 buyers €19, then €27.

© fu75ch1 — CC BY-NC 4.0. Defensive security education; test only systems you own or are authorized to test.
