# Gumroad P11 - The Security Lab

**Title:** `fu75ch1 Security Lab - Reverse Engineering + AI Red-Teaming (reproducible, isolated)`
**Price:** €27 (Early Bird €19, first 50)
**Slug:** `security-lab`
**Summary:** `A reproducible security lab you build from pinned, idempotent scripts: reverse engineering (Android + firmware) and AI red-teaming in one isolated environment. Built around a real, documented measurement failure - so you learn the part most courses skip: proving your test tested what you think it did.`

---

## DESCRIPTION

Most security courses hand you a tool and a number. This lab teaches the part that
number depends on: **isolation you can trust, and measurements you can prove.**

The fu75ch1 Security Lab combines two disciplines that are usually sold separately -
reverse engineering (Android + firmware) and AI red-teaming - into one isolated,
reproducible environment. You don't download a stale multi-gigabyte VM image. You
provision the lab from pinned, idempotent scripts that pull each tool from its official
source and verify it, then work through numbered modules against targets you're legally
entitled to analyze.

It's the same lab this project uses for its own Phases 6-8, packaged so you can rebuild
and verify every step yourself.

**What makes it different:** Module 4 is built around a real, documented measurement
failure from this project (error chronicle #114/#115). A red-team harness reported
attack-success numbers for months while never actually injecting the system prompt it
claimed to test - every published number measured the bare model. You reproduce that
class of bug, learn the payload-verification method that catches it, and build the habit
that no scanner number survives without it. No other lab ships its own worst measurement
mistake as a teaching module. This one does.

---

## WHAT YOU GET

- **Provisioning for two isolated tracks**
  - AI red-teaming: pinned Docker environment (garak 0.15.1, Promptfoo 0.121.17, PyRIT 0.14.0)
  - Reverse engineering: Windows Sandbox config + idempotent WSL2/tool provisioner (JADX 1.5.5, Ghidra 12.1.2, Frida 17.15.0, Binwalk 2.3.3)
- **A verifier** (`Verify-LabSetup.ps1`) that proves the whole toolchain is present at the pinned versions - not an exit code, an actual check (the #108 lesson)
- **Five numbered modules** with hands-on exercises (all five complete)
- **The payload-verification lesson** (#114/#115) - the measurement-integrity method, taught from a real failure
- **A safety & legal layer** that defines exactly what these tools may and may not be pointed at
- **Free updates** as the lab evolves - Early Bird pricing, then it goes up

---

## HONEST STATUS (read before buying)

This project labels what's built, partial, and planned - the lab included.

- **Module 1 (Isolation) - complete.** Windows Sandbox + WSL2, trust boundaries.
- **Module 2 (Android RE) - complete.** JADX static + Frida dynamic, the evidence-based static->dynamic loop, on legal training targets.
- **Module 3 (Firmware Forensics) - complete.** Binwalk extraction + entropy, secret-hunting; hardware read-out taught as concept, honestly labeled.
- **Module 4 (AI Red-Teaming + payload verification) - complete.** The centerpiece.
- **Module 5 (Capstone) - complete.** Extract a prompt via RE, then red-team it end to end.

All five modules are written and usable - this is a complete lab, not an MVP with a
roadmap. Two caveats stay visible rather than hidden, because that's how this project
works: hardware read-out (Module 3) is taught as concept and workflow, not a bench demo
(the project's own hardware chain is pending); and the portable-tool download hashes in
the RE provisioner are left as `CONFIRM` for you to verify against each vendor's official
checksum before install (error #113 - trust-on-first-use isn't good enough for tooling).
Future updates are free, but you're buying something finished.

---

## WHO IT'S FOR

- Practitioners who want a **reproducible** RE + AI-red-team bench, not a lecture
- People who already sense that a single benchmark number is not trustworthy and want the
  method to prove or disprove it
- Anyone building or shipping an AI system prompt who needs to test it **correctly**

Not for you if you want a click-to-run VM image, or if you're looking to attack systems
you don't own - this lab is explicitly, structurally defensive.

---

## WHAT YOU NEED

- Windows 11 Pro/Enterprise (Sandbox); Home users can run the WSL2 + Docker track
- Docker Desktop, ~30 GB free disk, virtualization enabled
- An API key for the AI module - injected via environment variable; the lab never ships
  or asks for a key in any file
- **Legal analysis targets** - your own apps/devices or open-source training targets. The
  lab supplies method and environment; you supply lawful targets.

---

## Format
`.zip` - all markdown modules, provisioning scripts, Dockerfile, Sandbox config, verifier.
**Updates:** free forever - you're buying the living lab, not a snapshot.
**Early Bird:** first 50 buyers €19, then €27.

---

## ZIP MANIFEST (nicht in Gumroad-Description uebernehmen)
```
SecurityLab/
├── README.md
├── SAFETY-and-LEGAL.md
├── provision/
│   ├── Verify-LabSetup.ps1
│   ├── ai-redteam/  (Dockerfile, docker-compose.yml, README.md)
│   └── re-lab/      (Provision-RELab.ps1, RE-Sandbox.wsb)
└── modules/         (Module-1 … Module-5 .md)
```
Cross-sell footer: "Full system → The Blueprint [LINK]". No key, no PII, no hostname in any file.
