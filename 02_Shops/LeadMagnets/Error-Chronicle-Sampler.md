# The fu75ch1 Error Chronicle — Free Sampler
## 20 of 103 documented mistakes from building an AI operating system solo, in two weeks

> **What this is:** fu75ch1 is a local-first AI operating system built by one person
> in two weeks — with every single mistake numbered, root-caused, and documented.
> This sampler contains 20 hand-picked entries from the full chronicle of 103.
> No fluff, no theory: each of these actually broke, on a real machine, and each
> prevention rule below exists because it had to.
>
> **The full chronicle (all 103, plus every script and config) ships with
> [The fu75ch1 Blueprint](https://fu75ch1.gumroad.com/l/blueprint) — €29 Early Bird.**
> Free sanitized repo: [github.com/0xWrt/fu75ch1-OS](https://github.com/0xWrt/fu75ch1-OS)

Format per entry: **What broke → Root cause → Prevention rule**

---

### Networking & VPN

**#11 — VPN routed nothing, leaked everything.**
Wi-Fi and VPN interface both had metric 0 — Windows had no idea which route to prefer.
→ *Root cause:* identical interface metrics = undefined routing priority.
→ **Rule: after VPN setup, always verify interface metrics explicitly (Wi-Fi to 100). "Connected" is not "routed".**

**#12 — The VPN watchdog watched the wrong adapter.**
The watchdog filtered for `*WireGuard*`. The adapter is named "Mullvad Tunnel". The watchdog happily reported a tunnel that wasn't there.
→ *Root cause:* assumed adapter naming instead of checking it.
→ **Rule: never hardcode adapter/service names from documentation — enumerate them on the actual machine first.**

**#102 — The containers that would not die.**
LangFuse containers kept coming back after manual stops — RAM warnings twice in one session, *after* the autostart had already been removed in an earlier fix.
→ *Root cause:* `restart: always` in docker-compose.yml resurrects containers on every Docker daemon restart (sleep/wake, WSL2 restart, Desktop update) — independent of any autostart setting.
→ **Rule: "on-demand" is only real when BOTH the autostart entry AND the container's own restart policy say so. Docker persists its own opinion.**

---

### Security & Secrets

**#17 — The API key that was 23 characters long.**
`Ctrl+V` into PowerShell's `Read-Host` silently truncated a 108-character API key. Everything downstream failed with auth errors that looked like billing problems.
→ **Rule: paste secrets via right-click in PowerShell prompts, then verify the length before using them.**

**#35 — The key that printed itself.**
An API key loaded into an environment variable appeared in plain text in terminal output. In a logged session.
→ *Fix:* immediate rotation, DPAPI storage.
→ **Rule: a key that has ever been visible in output is burned. Rotate first, investigate second.**

**#67 — Notepad as a clipboard is a leak.**
A service token was parked in Notepad "for a second" — and got pasted into a chat along with a command.
→ **Rule: sensitive values travel KeePassXC → terminal directly. No editors, no intermediate stops, ever.**

**#80 — The demo key that triggered the alarm.**
A commit was blocked by gitleaks: an example string in documentation used the `sk-` prefix. The scanner (correctly) can't tell a fake key from a real one.
→ **Rule: demo credentials never use real prefixes (`sk-`, `Bearer`). Use `DEMO-KEY-REDACTED`. Your own security tooling should never need an exception for your own docs.**

---

### PowerShell & Windows

**#38 — The git hook that Windows ignored.**
A `#!/bin/sh` shebang does exactly nothing on Windows. The hook "ran" — as in, it silently didn't.
→ **Rule: git hooks on Windows invoke `pwsh.exe` explicitly. A hook that can fail silently will.**

**#42 — Localized Windows rejects textbook ACLs.**
`icacls` with the standard `(OI)(CI)M` flags failed on a German Windows install.
→ **Rule: localized Windows versions localize more than the UI. Test permission commands on the actual locale, use `F` instead of `M` where needed.**

**#85 — StrictMode ate the parameters.**
`Set-StrictMode -Version Latest` placed *before* `param()` makes switch parameters undefined — the script broke before its first real line.
→ **Rule: `param()` comes first, always. StrictMode directly after. Order is not style, it's semantics.**

**#81 — The commit that silently never happened.**
A commit message with German umlauts failed silently inside an automation wrapper — no error, no new hash, no commit.
→ **Rule: ASCII-only commit messages in automated contexts. And verify the new hash exists — "no error" is not "success".**

---

### AI Stack & Automation

**#26 — The editor that couldn't handle emojis.**
An MCP file-edit tool failed to match text containing emojis/special characters — edits kept "succeeding" against nothing.
→ **Rule: when partial edits misbehave on special characters, rewrite the whole file. Fighting an encoding bug costs more than avoiding it.**

**#29 — Binwalk vs. Python 3.14.**
Binwalk needs Python ≤3.11. The host had 3.14. pip install died in dependency hell.
→ **Rule: version-pin awareness before installing — and keep WSL2 ready as the escape hatch for Linux-native tooling.**

**#33 — Two parameters, one API, zero runs.**
Garak sent `temperature` and `top_p` simultaneously — the Anthropic API accepts only one. Red-team run dead on arrival.
→ **Rule: know your target API's parameter constraints before wiring a framework to it; patch the generator, not your expectations.**

**#37 — The red-team number that lied (in both directions).**
Garak's MitigationBypass detector produced heavy false positives — raw ASR numbers looked dramatic and meant little.
→ **Rule: never publish a raw scanner metric unvalidated. Read the actual failures. (This rule is why fu75ch1 publishes 38.43% honestly instead of a flattering 0% from a 3-probe pilot.)**

**#51 — RAG indexed everything twice.**
Two document connectors (Obsidian + local directory) pointed at the same vault. Every document existed twice; retrieval quality collapsed.
→ **Rule: one source of truth per knowledge base — exactly one connector per corpus.**

**#90 — Two starters, one port, random death.**
A background service was started by a scheduled task AND a startup script — a race condition on the same port killed it at random intervals.
→ **Rule: one service, one start mechanism. Never task + script for the same process.**

**#93 — The hidden task that wasn't hidden.**
Background tasks registered ad-hoc with `Hidden=False` opened visible console windows. Closing the window killed the service — "random" crashes with 14–60 min lifetimes.
→ **Rule: background scheduled tasks are ALWAYS registered `-Hidden`, via a saved installer script — never ad-hoc in a session.**

**#97 — The dashboard that reported ancient history.**
The dashboard parsed the OpSec score with "first regex match" — and found the outdated baseline value in the chronological log section, not the current one.
→ **Rule: in append-only documents, current state lives at the end. Never take the first match; anchor parsing to the "current state" section.**

---

### The one about the errors themselves

**#103 — The error chronicle lost an error.**
Error #96 was fixed, committed, referenced in the session log — and never entered into the chronicle. The chronicle jumped from #95 to #97 while the project's core claim is "every mistake numbered". Found during a review on 2026-07-04, backfilled, and — obviously — logged as its own error.
→ *Root cause:* no automated gap check between referenced error numbers and actual chronicle entries.
→ **Rule: every referenced error number MUST have a chronicle entry — now enforced by an automated consistency check (`Invoke-MetricsCheck.ps1`) before every publication.**

If a project's error log can't even trust itself without tooling, neither can yours. That's the whole point of this document.

---

## Want all 103?

- **[The fu75ch1 Blueprint](https://fu75ch1.gumroad.com/l/blueprint)** — the complete system: all 15 phases, every script, every config, and the full error chronicle with root cause + fix + prevention rule for each entry. €29 Early Bird (first 50), then €49.
- **Standalone components** (€7–14): [fu75ch1.gumroad.com](https://fu75ch1.gumroad.com)
- **Free sanitized repo:** [github.com/0xWrt/fu75ch1-OS](https://github.com/0xWrt/fu75ch1-OS)
- **Weekly build notes (new errors included):** Substack — launching soon

*Transparency note: fu75ch1 product files carry an invisible license watermark (zero-width Unicode signature); the verification script `Verify-GhostMark.py` is included with every purchase so you can inspect it yourself. This free sampler is watermark-free.*

© fu75ch1 — CC BY-NC 4.0 — share freely with attribution, non-commercial use.
