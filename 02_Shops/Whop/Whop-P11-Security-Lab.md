# fu75ch1 Security Lab — Whop listing

> **Whop standalone listing.** Price €19 EB → €27. Slug: `security-lab`.
> Community/creator-platform framing; content mirrors Gumroad P11.

---

**Tagline:** Reverse engineering + AI red-teaming in one reproducible, isolated lab —
built around a real measurement failure so you learn to prove your tests, not just run them.

## The short version

Most security material hands you a tool and a number. This lab teaches what that number
depends on: isolation you can trust, and measurements you can *prove*. Five complete
modules — Android RE (JADX + Frida), firmware forensics (Binwalk), AI red-teaming
(garak/Promptfoo/PyRIT), and a capstone that combines them — provisioned from pinned,
idempotent scripts, not a stale VM image.

## The hook

Module 4 is built on a real, documented failure from this project (#114/#115): a red-team
harness that reported jailbreak numbers for months while never injecting the prompt it
claimed to test. Every number measured the bare model. You reproduce that bug, learn the
payload-verification method that catches it, and never ship an unverified scanner number
again. No other lab teaches from its own worst mistake.

## What's inside

- Two isolated tracks: Docker (AI red-team) + Windows Sandbox/WSL2 (RE), pinned versions
- A verifier that *proves* the toolchain (the #108 lesson: exit 0 ≠ passed)
- 5 complete numbered modules with exercises
- A safety & legal layer — explicitly defensive, test only what you own/are authorized to
- Free updates forever

## Honest status

All 5 modules complete. Two caveats stay visible, not hidden: hardware read-out is taught
as concept (project's own chain is pending); tool-download hashes are `CONFIRM`-before-install
(error #113). That transparency is the product.

## Need

Windows 11 Pro/Home + Docker/WSL2, ~30 GB, an API key (env var only — never in a file),
and legal analysis targets.

**€19 Early Bird (first 50) → €27.** `.zip`, updates free.

Part of the fu75ch1 system — see **The Blueprint** for the full 15-phase build.

© fu75ch1 — CC BY-NC 4.0.
