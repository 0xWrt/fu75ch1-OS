---
title: "fu75ch1: The Executable AI Architecture & Privacy Manifesto"
---
# fu75ch1: The Executable AI Architecture & Privacy Manifesto
## "Privacy for the Masses" — fu75ch1 für alle.

> English rewrite 2026-07-04 (Show-HN-ready). German original: [MANIFESTO_DE.md](MANIFESTO_DE.md)
> Honesty labels used throughout: ✅ built · 🟡 partial · 🔵 planned

---

### 1. THE CATALYST: THE TELEMETRY REALIZATION

This manifesto didn't come out of an academic lab or a funded startup. It came out of a simple frustration: the permanent, uncontrolled outflow of telemetry and metadata from a normal computer.

Every query against an unguarded cloud AI system transmits more than the prompt. IP addresses, system configuration, latency fingerprints, context footprints, behavioral patterns. That metadata trains multi-billion-dollar models, the resulting intelligence goes behind a paywall, and it gets sold back to you by the token.

fu75ch1 started as a counter-experiment on one ordinary laptop: how much of that outflow can a single person actually stop, without a server rack, in two weeks? The answer is documented in this repository — including everything that went wrong along the way (103 numbered errors and counting).

This is a call to change your default posture toward your own data streams — and to build your sovereign architecture on your own local disk instead of waiting for someone to sell it to you.

---

### 2. THE [USER] PRINCIPLE: THE 80/20 DUAL-CORE MATRIX

The codename `fu75ch1` comes from Berlin corner-bar culture — the "[USER]" (cheap brandy and cola), famous for its uncompromising heavy pour: 80% hard core, 20% filler. The architecture honors that ratio as the **80/20 Dual-Core Operating Principle**:

**1. The Heavy Pour (80% — local hardness & isolation)**
The supporting workloads — knowledge storage, semantic search, workflow automation, observability — run locally and sandboxed inside a plain-Markdown vault. For this share: no data leaves the machine, and no token costs accrue.

**2. The Filler (20% — zero-trust cloud connectivity)**
Workloads that need heavy reasoning — today, primarily the AI inference itself — go to external cloud APIs under strict zero-trust conditions: data is scrubbed and anonymized locally before it leaves the perimeter, transport is encrypted, and the provider is treated as a replaceable contractor, not an integration partner.

> **Honesty note:** the 80/20 split refers to the *number of supporting workloads* (RAG, automation, observability), not to the share of AI inference — inference currently runs primarily through the Anthropic cloud API. Details: [Before_After_Visual.md](../00_PROOF/Before_After_Visual.md).

---

### 3. THE [USER] INFLATION: THE ECONOMICS OF EFFICIENCY

There's a hard economic argument here, and it maps neatly onto the bar tab. A [USER] used to cost €1.80. Inflation has pushed it toward €4 — same drink, same glass.

The same dynamic is bleeding developer and IT budgets: what started as open AI research is now metered access. API token prices, proprietary compliance certificates, per-seat licenses — privacy is being repriced as a luxury good.

fu75ch1 pushes back on the share it can actually control: by handling the supporting workloads locally at exactly zero token cost, the architecture cuts recurring costs for that entire layer. No SaaS subscriptions for knowledge storage, search, or automation. Call it reclaiming the €1.80 tariff — for the parts of the stack where that's honestly achievable today.

---

### 4. AGAINST DATA CAPITALISM: THREE COMMITMENTS

This project is a deliberate act of digital self-defense, built on three commitments:

- **From consumer to operator:** refuse the role of free data supplier. The means of production — open-source model weights, semantic data structures, the vault itself — belong on your own machine, under your own control.
- **Shrink the metadata pipeline where technically possible:** every workload intercepted locally is telemetry that never existed. Not a total blockade (see the honesty note above — inference is still cloud today), but a measurable reduction, verified by scripts you can run yourself.
- **Democratize high-end security knowledge:** instead of locking compliance-grade architecture behind enterprise license fees, the €29 early-bird Blueprint makes deep CISO-level patterns accessible to anyone. "Privacy for the Masses" is the product spec, not a slogan.

---

### 5. THE "STRATEGY-AS-A-PRODUCT" ARCHITECTURE MODEL

fu75ch1 is deliberately not a SaaS product. It is an **executable architectural blueprint**: structural foundations, logic patterns, and architecture decision records that developers and teams can adapt and embed into their own infrastructure. The Obsidian vault is the human-readable, text-based user interface.

The architecture is organized as five defensive layers. Three exist today, two are planned — this distinction is disclosed instead of blurred:

```
[ INPUT PROMPT ]
      |
      v
+------------------------------------------------------+
| LAYER 1: IDENTITY & CONTEXT SEPARATION      ✅ BUILT  |
+------------------------------------------------------+
      |
      v
+------------------------------------------------------+
| LAYER 2: LOCAL GOVERNANCE & POLICY          ✅ BUILT  |
+------------------------------------------------------+
      |
      v
+------------------------------------------------------+
| LAYER 3: ENGINE-AGNOSTIC DECISION & ROUTER  🟡 PARTIAL|
+------------------------------------------------------+
      |
   +--+--------+
   |           |
   v           v
 LOCAL      CLOUD (primary today)
   |           |
   v           v
+------------------------------------------------------+
| LAYER 4: SECURITY CONTROLS & KILL-SWITCHES  🔵 PLANNED|
+------------------------------------------------------+
      |
      v
+------------------------------------------------------+
| LAYER 5: GITOPS AUDIT SYSTEM (team vision)  🔵 PLANNED|
+------------------------------------------------------+
```

**The five layers:**

1. **Identity & Context Separation** ✅ Built and auto-wired (`Invoke-PIIScrubber.ps1`): regex-based scrubbing of API keys, IPs, MAC addresses, paths, hostnames and usernames. Since 2026-07-01, session state and user messages are scrubbed automatically before every API call (errors #96 and #101 in the chronicle document exactly how this went wrong first).
2. **Local Governance & Policy** ✅ Built: autonomy model L0–L4 (L2 "prepare, then wait for approval" as default) controls which actions may run without explicit confirmation — documented in the master prompt.
3. **Engine-Agnostic Decision & Pareto Router** 🟡 Partial: supporting workloads run locally; primary AI inference runs through the Anthropic API today. Ollama is installed as the local option; automatic complexity-based routing between cloud and local does not exist yet.
4. **Local Security Controls & Telemetry Kill-Switches** 🔵 Planned: an automatic kill-switch on cloud failure and shadow-AI discovery are the next expansion stage — not implemented today.
5. **Zero-Conflict GitOps Audit System** 🔵 Planned (team/enterprise vision): a PR-based approval workflow for non-technical staff is designed but not built — relevant only once fu75ch1 runs in a team instead of solo.

---

### 5.1 GDPR / EU AI ACT COMPLIANCE: THE HONEST VERSION

**What fu75ch1 GIVES you:** local architecture removes a large share of typical GDPR friction — no cloud data-processing agreements for the local layer, no data-residency questions, no cloud-provider audits, no cross-border transfer delays for what never leaves the disk.

**What fu75ch1 does NOT give you (your responsibility):**

| Requirement | Description | fu75ch1 support |
|---|---|---|
| Access logging | Who accessed which data, when? | Framework + templates |
| Data retention | How long may data be stored? | Policy templates |
| Encryption at rest | Is data on disk encrypted? | Recommendation: BitLocker / VeraCrypt |
| Audit-trail integrity | Can logs be tampered with? | Git-based immutability |
| Subject access requests | "Show me my data" — exportable? | Export script template |
| Data processing agreements | If you use external model providers | "Model Provider DPA" template |

**The critical insight:** local processing means *compliance-ready*, not *compliance-achieved*. You still need legal documentation and internal governance. fu75ch1 is the technical wall, not the lawyer.

---

### 6. GAMIFIED SOVEREIGNTY: CHECKPOINT QUIZZES

Dry security material doesn't stick. Every phase of the architecture ships with checkpoint quizzes inside the vault — hard on wrong answers, generous with context on right ones.

**Sample question:** An automated analysis script wants to send metadata from an internal financial analysis to an external cloud API for preprocessing. How does the fu75ch1 protocol respond?

- **A)** The script forwards the raw data — it's an automated pipeline. → 🔴 **WRONG.** You just fed the telemetry pipeline. This is exactly what Layer 4 is designed to catch as shadow-AI activity — once built (today: planned, see chapter 5). Back to the bar, re-read chapter 4.
- **B)** The transfer is blocked locally, classification is enforced, and cloud transfer requires anonymized metadata. → 🟢 **CORRECT.** The identity layer (built, chapter 5) masks sensitive data locally before anything leaves the machine.
- **C)** The system waits for a manual click-certificate in a cloud dashboard. → 🟡 **WRONG.** Click-ops in external dashboards means you've already lost control of your governance.

🌟 **[USER] fun fact:** the original [USER] was invented in post-war Berlin workers' bars because cheap brandy needed the sweetness of cola to mask it. Our scrubbing layer works the same way — sensitive data is masked locally before the cloud API ever tastes it.

---

### 7. THE LIVING HANDBOOK: THE SYSTEM'S BAR MENU

A blueprint only matters if it's operational. The vault ships with an integrated reference — **the Living Handbook** (currently v1.5, manually curated; auto-generation from vault documents is a mid-term goal, not built yet). Excerpt with real commands:

| Command / tool | Description | Risk class | Typical use |
|---|---|---|---|
| `fu75` | Starts all core services (AgenticLoop, telemetry, containers) | 🟢 Low | From anywhere in the terminal |
| `Get-fu75ch1-PerfCheck.ps1` | Hardware/service health check (RAM, CPU, containers, tasks) | 🟢 Low (read-only) | Before and after major changes |
| `Invoke-OpSecAudit.ps1` | 34 automated security checks v2.0 (VPN, telemetry, AppSec, hardening, AI stack) | 🟢 Low (read-only) | Regularly, before every release |
| `Invoke-PublicExport-v2.ps1 -DryRun` | Simulates the sanitized public-repo export without writing | 🟢 Low (simulation) | Before every real export |
| `Invoke-PIIScrubber.ps1` | Masks API keys, IPs, paths, hostnames before transmission/logging | 🟢 Low (automatic) | Runs before every API call |

---

### 8. ANONYMITY AS A BRAND: THE DIGITAL MASK

This project deliberately has no human face. The author operates entirely under a pseudonym — as the **fu75ch1 operator**.

In a world obsessed with total transparency and tracking, the developer's anonymity is not hide-and-seek — it is the most consistent implementation of the manifesto itself. If you build a system against pervasive surveillance, you don't feed your own identity to the face-recognition and search pipelines you're defending against.

No personal brand, no glossy videos. The terminal logs, the error chronicle, and the uncompromising tone of the documents are the only face of the project. fu75ch1 belongs to no one exclusively — **fu75ch1 für alle.**

---

### 9. THE 3-TIER VALUE LADDER: THE ROADMAP

Distribution follows a simple, economically sustainable ladder. Honest status per tier:

**Tier 1: The Solo-Developer Executable Blueprint — €29 early bird (first 50), then €49** ✅ active
The complete, ready-to-run Obsidian vault: all 15 phases, master prompt v4.7 + security addendum, the 34-check OpSec audit script, hardening scripts, the full error chronicle (103 entries), phase quizzes and the Living Handbook. Not included: personal support, custom implementation.

**Tier 2: Enterprise Implementation Package — €1,499** 🔵 designed, not actively offered yet
Guided implementation for teams: custom vault setup, dashboard with ROI metrics, 10 hours async architect support, CI/CD deployment scripts. Will be activated once the project has organic sales and testimonials — an anonymous brand asking four figures without a public track record would be asking for trust it hasn't earned yet.

**Tier 3: Bespoke Architecture Workshop — from €9,500** 🔵 designed, not actively offered yet
Deep, custom integration of the defensive layers into complex enterprise infrastructure (Kubernetes, air-gapped networks, multi-cloud), via text-only channels. Same activation condition as Tier 2.

---

# CLOSING

The system is running. The tools are on the disk. The scripts are executable, the mistakes are numbered, and nothing in this document claims more than the repository can prove.

Get the vault. Harden your machine. Drink your [USER] locally.

**Privacy for the Masses. fu75ch1 für alle.**

---

© fu75ch1 — CC BY-NC 4.0
