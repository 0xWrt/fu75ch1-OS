---
title: P11 Security Lab - Screenshot Capture Guide
tags: [shops, assets, screenshots, p11]
date: 2026-07-11
---

# P11 Security Lab - Screenshot Capture Guide

Three shots for the Gumroad/Polar/Whop listings. **Real captures only** - no mockups
(the whole product sells authenticity). Same PII rules as every other product: no
hostname in the window title, no user paths, tray/taskbar hidden, dark terminal theme,
1280x720 PNG, saved to `02_Shops\_Assets\P11_<name>.png`.

## Shot 1 - the payload proof (the #114 lesson) — HIGHEST PRIORITY

This is the money shot. It's fully reproducible offline, no API key, no cost:

```
python 01_Architecture\SecurityLab\provision\ai-redteam\payload_probe_demo.py
```

Frame the terminal so both lines are visible:
- `naive harness:   ... ['user']           >>> BARE MODEL - the #114 bug <<<`
- `verified harness: ... ['system','user']  PROMPT INJECTED (real test)`

This single frame communicates the product's whole thesis. Caption idea:
*"Same scanner, same attack - one of these was never actually testing the prompt."*

Save as `P11_payload_proof.png`.

## Shot 2 - the verifier

After provisioning at least one track:

```
pwsh -File 01_Architecture\SecurityLab\provision\Verify-LabSetup.ps1
```

Frame the `Track / Tool / Expected / Found / Status` table with the PASS rows visible.
If you haven't provisioned everything, that's fine - a mix of PASS and CHECK is honest and
on-brand (it literally shows the tool telling the truth about what's missing).

Save as `P11_verifier.png`.

## Shot 3 - the module index (honesty visual)

Open `01_Architecture\SecurityLab\` in Obsidian (or Explorer). Show the five modules with
their `status: complete` frontmatter visible, or the README status table. The point: a
buyer sees all five modules are real, and the two honest caveats (hardware = concept,
hashes = confirm) are right there, not buried.

Save as `P11_modules.png`.

## Cover

Text banner, black/green, matching the P1-P10 style:
`"Reverse engineering + AI red-teaming. Reproducible. Isolated."`
Subline: *"built around a real measurement failure - so you learn to prove your tests"*

---

Note: Shot 1 is the only one that needs no setup - capture it first. Shots 2-3 need the
lab provisioned. If you want to ship the listing before full provisioning, Shot 1 + cover
+ the module index (Shot 3, Explorer view) are enough to launch; add Shot 2 after you run
a track.
