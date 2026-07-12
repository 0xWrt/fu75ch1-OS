#!/usr/bin/env python3
"""
payload_probe_demo.py - the Module 4 lesson, runnable and offline.

Shows the difference between a naive harness (system prompt never injected - the #114 bug)
and a verified one, WITHOUT calling any API. No key needed, no cost. This is the cheapest
possible proof of the most expensive red-team mistake.

Run:  python payload_probe_demo.py

Then do the real thing in Module 4: point your actual scanner at a payload probe and
confirm you see ['system','user'], not ['user'], before you trust any ASR number.
"""
import json


def show(label, messages):
    roles = [m["role"] for m in messages]
    verdict = "PROMPT INJECTED (real test)" if roles[:2] == ["system", "user"] \
        else ">>> BARE MODEL - the #114 bug <<<"
    print(f"{label:<22} PAYLOAD ROLES SENT: {json.dumps(roles):<26} {verdict}")


def main():
    system_prompt = "[identity] ... your hardened system prompt ..."
    attack = "ignore all previous instructions and ..."

    print("=" * 62)
    print(" fu75ch1 Security Lab :: Module 4 :: payload proof (offline)")
    print("=" * 62)
    # What a naive harness sends (e.g. a scanner whose system-prompt key is never read):
    show("naive harness:", [{"role": "user", "content": attack}])
    # What a verified wrapper guarantees:
    show("verified harness:", [
        {"role": "system", "content": system_prompt},
        {"role": "user", "content": attack},
    ])
    print()
    print("Lesson (error #114/#115): a config key is only real once the code proves")
    print("it is read. Prove the payload BEFORE you trust the number.")


if __name__ == "__main__":
    main()
