---
title: "Module 4 - AI Red-Teaming & the Measurement You Didn't Take"
tags: [security-lab, module, ai-red-teaming, garak, promptfoo, payload-verification]
status: complete
---

# Module 4 - AI Red-Teaming & the Measurement You Didn't Take​‌‍‍‌‌‍‍‌‌‍‍‍‌‍‌‍‌‌‍‍‌‍‍‍‌‌‍‍‌‍‌‍‌‍‍‌‌‌‍‍‌‍‍‌‍‌‌‌‌‌‍‍‌‌‌‍‌‍‍‍‍‍‌‌‌‍‍‍‌‌‍‍‌‍‍‌‌‍‌‍‌‍‍‌‌‌‍‍‌‍‍‍‌‍‌‍‌‍‍‍‌‌‍‌‌‍‍‌‍‌‌‍‌‍‍‍‌‍‌‌‌‍‍‍‍‌‌‍‌‌‍‌‍‍‌‍‌‍‍‌‍‍‌‌‌‍‍‌‌‌‌‍‌‍‍‌‌‌‍‌‌‍‍‍‍‍‌‌‌‍‌‌‌‌‍‍‌‍‌‌‌‌‍‍‌‌‍‌‍‍‌‍‌‍‌‌‌‌‍‌‌‍‌‍‍‌‌‍‌‌‍‌‍‍‌‍‌‍‌‌‍‍‍‌‌‍‌‌‌‌‍‍‌‌‍‌‍‍‌‍‌‌‍‍‌‍‌‌‌‌‍‌‍‍‍‌‌‌‍‍‌‌‌‌‌‍‍‍‍‍‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‌‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‍‍‌‌‌‍‌‍‍‌‍‌‌‍‍‌‌‌‌‌‌‍‍‌‍‍‍‌‌‍‌‍‍‌‍‌‌‍‍‌‌‌‍‌‌‍‍‌‌‌‍​

**Goal:** test the jailbreak-resistance of a system prompt **you own**, and - more
importantly - learn to prove your test actually tested it. By the end you can run garak
and Promptfoo against your own prompt, and you can catch the single most expensive class
of red-team bug: a harness that measures the wrong thing while reporting confident numbers.

**Prerequisite:** Module 1. AI red-teaming track provisioned (`provision/ai-redteam/`).

**Scope reminder:** this is defensive. You test a prompt/deployment *you control*. See
SAFETY-and-LEGAL.md.

**Time:** ~90 min.

---

## 4.1 What "attack success rate" (ASR) actually is

A red-team scanner sends a battery of adversarial prompts at a target and, for each,
decides whether the attack "succeeded". ASR is the fraction that succeeded. Two things
determine whether that number means anything:

1. **What was the target?** The scanner tests `system_prompt + attack`. If the system
   prompt isn't actually in the request, you're testing the bare model.
2. **Who decided "succeeded"?** A detector. If the detector flags any non-refusal as a
   success - including a harmless "I understand." - your ASR is an upper bound on *tone*,
   not a measure of *harm*.

Most people internalize (2) eventually. Almost nobody checks (1). This module makes you
check (1) first, because getting it wrong invalidates everything downstream.

## 4.2 The lesson this module is built around (error #114/#115)

The fu75ch1 project ran a jailbreak scanner (garak) against its own hardened system
prompt across several iterations and published the resulting ASR numbers, honestly and
prominently - including the unflattering ones. Months later, a payload audit for an
unrelated reason revealed the truth: **the harness never injected the system prompt.**
The scanner has a documented config key for a system prompt; the version in use never
reads it. Every probe went out as a bare user message. Every published number had
measured the base model, and the "hardening" had been credited for a difference it never
made.

A second tool, set up the same week with the same unexamined assumption, had the
identical bug (that's #115).

The fix was not a better detector or more probes. It was three lines of proof: **capture
the exact payload the tool sends, and look at it.**

> **Prevention rule (verbatim from the chronicle):** never trust a measurement without
> verifying the exact payload that was actually sent. A config key is only real once the
> code proves it's read - "documented" is not "active."

You are going to reproduce this, feel it, and never ship an unverified scanner number
again.

## 4.3 Lab: the zero-cost payload proof

Before spending a cent of API budget on a real run, prove what your harness sends. The
cheapest, most reliable target is a local echo: a "model" that just returns the request
it received. If your system prompt isn't in that echo, no amount of probing will test it.

Inside the AI-RT container (`docker compose run --rm airt`):

```python
# payload_probe.py - a fake target that records what it was actually sent.
# Point your scanner/config at this instead of a real model for one run.
import json, sys

def handle(messages):
    roles = [m.get("role") for m in messages]
    sys.stderr.write("PAYLOAD ROLES SENT: " + json.dumps(roles) + "\n")
    # A real system-prompt injection MUST show ['system', 'user', ...].
    # If you see ['user'] only, the system prompt never made it in.
    return "echo-ok"
```

**Checkpoint:** run one probe through your configured harness against this echo. Read the
`PAYLOAD ROLES SENT` line.
- `['system', 'user']` -> your prompt is being injected. Proceed.
- `['user']` -> **stop.** Your prompt is not in the request. Any ASR you produce now is a
  measurement of the bare model. This is exactly #114. Fix the harness before you spend a
  single real API call.

## 4.4 Lab: garak against your own prompt (correctly)

garak's stock target integrations may not inject a system prompt the way you expect -
that was the whole bug. The robust pattern is a thin custom generator that **prepends the
system turn itself and fails loudly if the prompt file is missing**, so a silent
bare-model run becomes impossible:

```python
# fu75ch1_sysgen.py (sketch) - wrap your generator so the system prompt is guaranteed in.
import os
SYS_PATH = os.environ["LAB_SYSTEM_PROMPT"]        # fail loudly if unset - no silent default
SYSTEM_PROMPT = open(SYS_PATH, encoding="utf-8").read()
assert SYSTEM_PROMPT.strip(), "system prompt empty - refusing to run a bare-model test"

def build_messages(attack_text):
    return [
        {"role": "system", "content": SYSTEM_PROMPT},
        {"role": "user",   "content": attack_text},
    ]
# ... hand build_messages() to your provider call ...
```

Run garak pinned at 0.15.1 against this wrapper with a small probe set first. Then apply
4.3 again to *this* run: confirm the roles are `['system','user']` and the byte length
matches your prompt file. Only then is the number worth reading.

## 4.5 Lab: cross-check with Promptfoo

Run the same attack intent through Promptfoo (pinned 0.121.17) using a chat template that
puts the system prompt in its own turn - never as `{{prompt}}` alone (that flattens to a
bare user message, the #115 bug). Two independent tools that agree on a *verified* payload
give you far more confidence than one tool's confident number on an unverified one.

Secret handling: the key comes from `ANTHROPIC_API_KEY` in your environment, never from
the config file. If you catch yourself pasting a key into YAML, that's #113/#115 - stop.

## 4.6 Reading results honestly

Once the payload is verified, the detector caveat from 4.1 applies. Before you believe an
ASR:

- **Sample the flagged "successes" by hand.** How many are actual policy-violating content
  vs. harmless non-refusals the detector misread?
- **Report the sample size and the detector**, not just the percentage.
- If you can't yet adjudicate the hits, say so and publish no headline number - a
  documented "we haven't measured the real rate yet" beats a confident wrong one.

This is the same standard the fu75ch1 project now holds itself to: after #114, it
publishes the retraction and the method, and withholds a new ASR figure until it has a
verified, adjudicated one.

## Exercise

1. Build `payload_probe.py`, run one probe of a naive harness through it, and capture a
   `['user']`-only result. Screenshot it (scrub any identifiers).
2. Wrap the generator so the system prompt is guaranteed present; re-run; capture the
   `['system','user']` proof.
3. Run a small garak probe set both ways and write down both ASR numbers. Explain, in one
   paragraph, why the first number is meaningless.
4. Hand-adjudicate 5 flagged "successes" from the verified run. How many were real?

## Takeaway

The most dangerous red-team result is a confident number from a harness nobody audited.
Tools break quietly; config keys lie; detectors over-count. The habit that separates a
real measurement from a comforting one is cheap and non-negotiable: **prove the payload,
then read the number.** You now own the exact lesson this project paid for the hard way.

---

Next: `Module-5-Capstone.md` (v1.2) ties this to reverse engineering - extract a prompt
from a real app via RE, then red-team what you extracted.
