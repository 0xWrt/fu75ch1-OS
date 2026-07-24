---
date: 2026-07-24
tags: [gumroad, upload, felder, checkliste, launch]
status: Arbeitsblatt -- Quelle sind die Copy-Dateien in 02_Shops\Gumroad\
title: Gumroad Feldbelegung -- was gehoert in welches Feld (P1-P11)
---

# Gumroad Feldbelegung -- P1 bis P11

> **Kanonische Quelle bleiben die `Gumroad-P*.md`-Dateien.** Dieses Blatt ist die
> Uebersetzung Copy-Datei -> Gumroad-Formularfeld. Bei Widerspruch gewinnt die
> Copy-Datei. Nach jedem Upload: Live-Seite gegen die Copy-Datei diffen.

---

## 0. Die Universalregel (gilt fuer ALLE Produkte)

Jede Copy-Datei hat die gleiche Struktur. Die Zuordnung ist immer identisch:

| Block in der `.md` | Gumroad-Feld | Tab |
|---|---|---|
| `# Title:` | **Name** (oben auf der Seite) | Product |
| `## SUMMARY` | **Summary** | Product |
| `## DESCRIPTION` + `## GET THE FULL SYSTEM` | **Description** (Rich-Text-Editor) | Product |
| `## DETAILS` | **Additional details** (Key/Value-Paare) | Product |
| `# Slug:` | **URL** | Product |
| `# Price:` | **Pricing -> Amount** | Product |
| Paketordner aus `_UPLOAD_READY\zips\` | Datei-Upload | **Content** |

**Nicht uebernehmen** (interne Bloecke): `## ZIP-MANIFEST`, `## ZIP MANIFEST`,
`> Strategie-Notiz`, `# STATUS:`.

**Ebenfalls streichen: die Zeile `**-> Buy now on Gumroad**`** am Ende jeder
Copy-Datei. Gumroad rendert seinen eigenen Call-to-Action-Button (auswaehlbar,
nicht frei textbar) -- eine eigene Buy-now-Zeile ist doppelt und sieht nach
kopierter Fremdplattform-Copy aus. Erbe der geteilten Polar-/LemonSqueezy-Fassung.

### Additional details -- wie das Feld funktioniert

Linke Spalte = Ueberschrift, rechte Spalte = Text. Aus den fett gesetzten
Zwischenueberschriften im `## DETAILS`-Block wird links der Schluessel, aus den
darunterliegenden Stichpunkten rechts der Wert (zu einer Zeile zusammengezogen,
Kommas statt Bullets).

### Description kann mehr als Fliesstext

Der Editor beherrscht Bilder, Zitate, **Code-Bloecke** und Media-Embeds.
Beispiel-Outputs (`[OK] Check 23 ...` in P2) und Skript-Header (P4/P5) gehoeren
als Code-Block gesetzt, nicht als Fliesstext.

### Einstellungen, die ueberall gleich sind

| Feld | Wert | Warum |
|---|---|---|
| Integrations (3 Toggles) | alle aus | keine Community angebunden |
| Limit product sales | aus | -- |
| Allow customers to choose a quantity | aus | digitales Einzelprodukt |
| Publicly show number of sales | aus (vorerst) | bei 0 Sales schadet die Anzeige |
| Require shipping information | aus | -- |
| Custom domain | leer | -- |
| Versions | keine | -- |
| Display 1-5 star rating | **an** | Pflicht fuer Discover-Listung |
| Adult content (NSFW) | aus | -- |
| Mark as e-publication for VAT | **aus** | siehe 1.3 |

---

## 1. Entscheidungen -- Stand 2026-07-24

### 1.1 Wasserzeichen -- ERLEDIGT

Die Transparenznote in den Copies ist jetzt gedeckt. Vorgehen war: Ghost-Mark auf
die **Paketkopien** in `02_Shops\_UPLOAD_READY\zips\`, **nicht** auf die
Repo-Quelle -- die liegt gratis auf GitHub und waere sonst gegen das Paket
diffbar.

- 10 Produkte gestaged, 31 Dateien mit per `Verify-GhostMark.py` bestaetigter
  Signatur `fu75ch1|<slug>|CC-BY-NC-4.0|2026-07-24`
- `Verify-GhostMark.py` liegt in jedem Paket bei
- Neuer Encoder `10_Workflows\Apply-GhostMark-Code.py` fuer Nicht-Markdown
  (Signatur in Kommentarzeile: .ps1/.yml/.conf/.template/.py/.wsb/Dockerfile)
- Alle .ps1 nach dem Markieren parse-verifiziert -- Kaeufer fuehren die aus
- **Ausnahme P3:** die zwei JSON-Configs koennen keine Signatur tragen, JSON hat
  keine Kommentarsyntax. Die P3-Note benennt das jetzt explizit.

Dokumentiert als Fehler #120 und #121.

### 1.2 Gumroad Discover -- greift noch nicht

Discover kostet 30 % Gebuehr pro Sale. Laut Hilfeartikel 79 ist ein Account aber
erst teilnahmeberechtigt mit hinterlegten Payout-Daten, mindestens 10 USD
Guthaben aus **echten** Verkaeufen (Selbstkaeufe zaehlen nicht) und einer
Risk-Team-Pruefung (im Schnitt ~3 Wochen danach). Ein Produkt erscheint zusaetzlich
nur mit mindestens einem Verkauf, gesetzter Kategorie und aktivierten Ratings.

Bei aktuell 0 bestaetigten Verkaeufen ist Discover ohnehin nicht erreichbar. Die
Gebuehrenfrage stellt sich spaeter -- Kategorie und Ratings trotzdem jetzt sauber
setzen, sonst verlierst du hinterher Wochen.

Discover ist per Default aktiv; Abschalten geht ueber Loeschen der Kategorie.
Discover-Produkte sind automatisch im Gumroad-Affiliate-Programm.

„Other" ist die schlechteste Kategoriewahl. Discover hat rund 18 Kategorien --
die passendste unter Software/Development bzw. Education nehmen. Welche Labels
genau angeboten werden, ist nur live im Dropdown sichtbar. Trick: in der Kategorie
die Sektion „Popular tags" ansehen, bevor du eigene Tags festlegst.

### 1.3 e-publication / VAT + Refund Policy

- **„Mark product as e-publication for VAT purposes" -- aus lassen.** Der
  Hilfeartikel „EU & UK VAT on Gumroad" fuehrt die EU-Definition auf: Buecher,
  Zeitungen und Zeitschriften, Mal- und Zeichenbuecher fuer Kinder, gedruckte oder
  handschriftliche Musik, Landkarten und hydrographische Karten. Ein System-Prompt,
  ein PowerShell-Skript oder ein technischer Guide ist nichts davon. Der Schalter
  senkt zusaetzlich UK-E-Publikationen auf 0 % -- falsch gesetzt keine Kleinigkeit.
  Gilt fuer **alle Produkte**, nicht nur die Skripte. Gumroad sagt selbst: im
  Zweifel lokalen Steuerberater fragen.
  > Kontext: Gumroad ist Merchant of Record und zieht die Umsatzsteuer selbst ein.
  > Der Schalter betrifft den Satz, den dein Kaeufer zahlt -- nicht deine Meldung.
- **„Specify a refund policy"** -- eigener Hilfeartikel vorhanden. Empfehlung:
  einschalten, kurze klare Policy.

---

## 2. Reihenfolge

1. **P1-P9 + P11** -- Pakete liegen fertig in `_UPLOAD_READY\zips\`, nur noch
   zippen und hochladen
2. **P10** -- braucht erst den Vault-Export (`Invoke-PublicExport`, Header v2.6)
3. Cover erzeugen (fehlen bei allen)
4. Profil-Section anlegen, **bevor** das erste Produkt live geht

---

## 3. Feldbelegung pro Produkt

Content-Spalte = der fertige Paketordner unter
`fu75ch1_public\02_Shops\_UPLOAD_READY\zips\`.

### P1 -- Master-Prompt v4.7

| Feld | Wert |
|---|---|
| **Name** | `fu75ch1 Master-Prompt v4.7 -- Production AI System Prompt` |
| **URL** | `master-prompt-v47` |
| **Amount** | `9` EUR |
| **Summary** | The system prompt powering a complete AI operating system -- built over 4.7 versions, red-team tested, production-hardened. |
| **Content** | `zips\P01_master-prompt-v47\` (2 Dateien) |

**Achtung, richtige Datei:** In `01_Architecture` liegen vier Master-Prompt-
Fassungen. Nur `Master-Prompt-v4.7.md` (12,4 KB, Titel „Public Release") ist
durchgehend englisch **und** ohne Fire-TV-/Umgebungsblock. `-Public-EN.md` und
`-Public.md` enthalten beide noch den `MANAGED DEVICES`-Block, `-Public.md`
zusaetzlich deutsche Reste. Im Paket liegt bereits die richtige.

**Additional details:**

| Key | Value |
|---|---|
| `**What's inside:**` | *(leer, dient als Ueberschrift)* |
| `[identity]` | Role definition: Chief AI Architect / Cyber Security Specialist / AIOps Analyst |
| `[governance]` | Autonomy levels L0-L4 with explicit human approval gates |
| `[decision_engine]` | Risk, sensitivity, complexity and cost evaluated before every task |
| `[data_classification]` | Public / Internal / Confidential / Restricted with storage rules |
| `[prompt_security]` | 10 jailbreak resistance patterns (persona hijack, authority framing, dual-output, evil persona, from-now-on override, and more) |
| `[security]` | RAG security, supply chain rules, agent permission model |
| `[directives]` | PowerShell guardrails, idempotency enforcement, phase completion protocol |
| `[output_format]` | MECE structure, explanation principle, audience calibration |
| `[self_check]` | 30-point pre-response checklist |
| `Red-team testing` | Earlier versions of this listing quoted Garak ASR percentages. A later audit found the harness never injected the system prompt, so those figures measured the bare model. It's logged as its own numbered error, the harness was rebuilt to verify the exact payload before every run, and the corrected methodology ships in the public repo. |
| `Format & compatibility` | Single .md file, ready to paste as system prompt. Works with Claude, GPT-4, any API with a system prompt field. |

> Die Copy nennt zusaetzlich „Includes: Buyer setup guide + adaptation
> instructions". Ein solcher Setup-Guide existiert nicht. Entweder schreiben oder
> die Zeile weglassen -- sonst ist es dieselbe Klasse Behauptung wie #120.

---

### P2 -- OpSec Checklist

| Feld | Wert |
|---|---|
| **Name** | `fu75ch1 OpSec Checklist -- 38-Point Security Audit (PowerShell, v2.0)` |
| **URL** | `opsec-checklist` |
| **Amount** | `7` EUR |
| **Summary** | 38 automated security checks for Windows 11. Run it, get a real score in under 60 seconds -- including the gaps that look green but aren't. |
| **Content** | `zips\P02_opsec-checklist\` (3 Dateien) |

| Key | Value |
|---|---|
| `38 checks across 6 categories` | VPN & Network (5), System Security (5), System Hardening (4), Tools & AppSec (8), AI Stack Security (3), Anti-Tracking (9) |
| `Output format` | One pass/fail line per check plus an overall score, e.g. „OpSec Score: 37/38 (97%)" |
| `The check that matters` | The author's own machine failed Check 35 -- a fully encrypted drive protecting nothing, because no secure key protector was bound. A real score you earn, not a vanity 100%. |
| `Properties` | Idempotent, no PII in output, no raw network data, category breakdown included |
| `Requirements` | Windows 11, PowerShell 7+, admin rights for full results |
| `Includes` | Invoke-OpSecAudit.ps1 + setup guide |

---

### P3 -- Advanced Configs

| Feld | Wert |
|---|---|
| **Name** | `fu75ch1 Advanced Configs -- Ollama, n8n, WireGuard (Ready-to-Deploy)` |
| **URL** | `advanced-configs` |
| **Amount** | `12` EUR |
| **Summary** | Production-ready configuration files for three core local AI stack components. Copy, adjust two variables, deploy. |
| **Content** | `zips\P03_advanced-configs\` (8 Dateien) |

| Key | Value |
|---|---|
| `Ollama` | Task-based model routing (small / medium / large), honest hardware note on dedicated GPU vs integrated graphics, memory and context window settings, local API endpoint, Open WebUI integration |
| `n8n` | Production Docker Compose with structured environment variables, webhook templates for AI pipelines, AI node configurations |
| `WireGuard` | Client config template explained line by line, Kill-Switch rules via Windows Firewall, DNS leak prevention, IPv6 disable config |
| `Format` | .yml, .conf, .json -- ready to use, at most two clearly marked variables to adapt per file |
| `Requirements` | Docker Desktop, Windows 11, PowerShell 7+ |

---

### P4 -- Phase 12 Playbook

| Feld | Wert |
|---|---|
| **Name** | `fu75ch1 Phase 12 Playbook -- Hardening & Determinism` |
| **URL** | `phase12-playbook` |
| **Amount** | `14` EUR |
| **Summary** | The complete documentation of how a functional AI system becomes a reliable one -- with every hardening decision, every mistake, and honest Garak red-team results. |
| **Content** | `zips\P04_phase12-playbook\` (6 Dateien) |

| Key | Value |
|---|---|
| `PowerShell Guardrails` | Strict mode + $ErrorActionPreference='Stop' as mandatory header on every script, idempotency patterns, header retrofit applied across all production scripts |
| `OpSec Hardening` | 38-point automated audit (v2.0), current score 37/38, gap analysis for the remaining structural issues, fix scripts for all addressable gaps |
| `SBOM Pipeline` | syft + grype for dependency inventory and vulnerability scanning, supply chain audit trail |
| `MCP Custom Server` | Three tools wired into Claude Desktop -- read vault, write vault, execute PowerShell -- with architecture and integration docs |
| `Prompt Security -- honest retraction` | This playbook originally reported ASR percentages from Runs 1-6. A later audit found the harness never injected the system prompt, so every figure measured the bare model. The finding is logged as its own numbered error and the rebuilt methodology ships in place of the invalid numbers. |
| `Includes` | Full Phase 12 plan and completion protocol, error chronicle entries with root cause and prevention rule, all PowerShell scripts from this phase, Garak run documentation, OpSec audit script v2.0 |
| `Requirements` | Windows 11, PowerShell 7+ |

---

### P5 -- Windows Hardening Guide

| Feld | Wert |
|---|---|
| **Name** | `fu75ch1 Windows Hardening Guide -- ASR, Firewall, Telemetry (Step-by-Step)` |
| **URL** | `windows-hardening` |
| **Amount** | `9` EUR |
| **Summary** | Harden Windows 11 without losing productivity. Real PowerShell commands, real verification for every step -- no guesswork, no assumptions. |
| **Content** | `zips\P05_windows-hardening\` (2 Dateien) |

| Key | Value |
|---|---|
| `Attack Surface Reduction (ASR)` | All critical ASR rules with exact GUIDs, per-rule explanation of the attack vector blocked, audit mode vs enforce mode, verification command for each rule |
| `Outbound Firewall (whitelist model)` | Switch from default-allow to default-deny, PowerShell script to enumerate active connections, building a practical allowlist, rollback procedure |
| `Telemetry + Services` | Verified safe-to-disable list, documented list of what breaks if disabled, registry + PowerShell approach per item, verification that changes survive reboot |
| `BitLocker` | TPM + PIN setup, offline-only recovery key strategy, verification script |
| `UAC` | Always-notify mode, admin approval for built-in accounts, verification |
| `Autostart Analysis + Cleanup` | Enumerate all autostart locations beyond Task Manager, risk assessment per entry, safe removal procedure |
| `Patch Management` | No-exceptions policy, PowerShell-based update verification, driver update strategy |
| `Requirements` | Windows 11, PowerShell 7+ |

---

### P6 -- DNS/VPN Guide

| Feld | Wert |
|---|---|
| **Name** | `fu75ch1 DNS/VPN Guide -- NextDNS DoH + WireGuard Kill-Switch` |
| **URL** | `dns-vpn-guide` |
| **Amount** | `7` EUR |
| **Summary** | Stop your DNS from leaking. Encrypted DNS + VPN with Kill-Switch, set up in 30 minutes -- every step verified with an automated leak test. |
| **Content** | `zips\P06_dns-vpn-guide\` (2 Dateien) |

| Key | Value |
|---|---|
| `NextDNS` | Account setup with a privacy-respecting configuration, custom filter lists, logging control, profile export for reuse across devices |
| `DNS-over-HTTPS on Windows` | Enable DoH on all adapters via PowerShell, verify no plaintext DNS leaves the machine, fallback handling |
| `WireGuard Client` | Config file structure explained line by line, import/connect/verify, what each setting does and why |
| `Kill-Switch` | Windows Firewall rules so no traffic passes without an active tunnel, blocks instead of leaks on VPN drop, verification procedure, reconnect behaviour |
| `IPv6 Leak Prevention` | Disable on all physical adapters, handle VirtualBox / WSL2 adapter exceptions, verify no IPv6 traffic leaks |
| `Automated DNS Leak Test` | PowerShell script included, how to interpret partial leaks, what a clean result looks like |
| `Requirements` | Windows 11, PowerShell 7+ |

---

### P7 -- Browser Hardening

| Feld | Wert |
|---|---|
| **Name** | `fu75ch1 Browser Hardening -- LibreWolf + uBlock Origin (Exportable Config)` |
| **URL** | `browser-hardening` |
| **Amount** | `7` EUR |
| **Summary** | Stop browser fingerprinting and tracker leakage at the config level. Exportable LibreWolf + uBlock Origin settings -- drop in and done in under 20 minutes. |
| **Content** | `zips\P07_browser-hardening\` (2 Dateien) |

| Key | Value |
|---|---|
| `LibreWolf user.js (exportable)` | Drop into your profile folder, restart, done. WebRTC disabled so no IP leaks through the browser, canvas fingerprinting blocked, HTTPS-only mode enforced, cookie isolation per site |
| `uBlock Origin configuration` | The exact filter list setup, aggressive mode that stays compatible with daily use, custom rules for common edge cases, how to add or remove lists without breaking sites |
| `4-Profile Strategy` | AI Tools / Work / Private / Research -- separate profiles, separate fingerprints, and why separation matters beyond cookies |
| `JavaScript Control` | Default-deny approach via uBlock Origin, allowlist building strategy, handling sites that require JS without opening everything |
| `Cookie Strategy` | Session-only by default, persistent exceptions only where you explicitly choose, export/import for your exception list |
| `Search Engine Setup` | SearXNG, Startpage and Brave Search compared, and how to set your choice as default |
| `Setup time` | Under 20 minutes. Works on LibreWolf (Firefox-based), Windows and Linux |

---

### P8 -- KeePass Blueprint

| Feld | Wert |
|---|---|
| **Name** | `fu75ch1 KeePass Blueprint -- Offline Credentials with Key-File Concept` |
| **URL** | `keepass-blueprint` |
| **Amount** | `7` EUR |
| **Summary** | Move your credentials fully offline. KeePassXC with Key-File concept, tested backup strategy, and API key hygiene for developers -- nothing leaves your machine. |
| **Content** | `zips\P08_keepass-blueprint\` (2 Dateien) |

| Key | Value |
|---|---|
| `KeePassXC Setup (Windows)` | The settings that matter -- auto-lock, clipboard clear timeout, minimize on copy -- plus what not to enable, because the default browser integration settings are too permissive |
| `Key-File Concept` | Database file on your main drive, key file on a USB stick or separate secure location, both required to open. Protects against stolen laptop, cloud backup leak, remote access |
| `Database Structure` | Four groups: API Keys, System, Services, Personal |
| `Backup Strategy (3-2-1)` | Three copies, two media, one offsite. Encrypted backup procedure and a tested restore -- not an assumed one |
| `Browser Integration (controlled)` | A safer-than-default extension configuration, auto-type vs browser fill and when to use which, and what not to do |
| `Password Generator Settings` | 32+ characters minimum, no patterns, no dictionary words, no memorable structures, different profiles per account type |
| `API Key Hygiene` | Store API keys in KeePassXC rather than .env files or scripts, load at runtime via PowerShell -- never plaintext, never in Git, never in logs. PowerShell snippet included |
| `Works on` | Windows (primary); KeePassXC itself is cross-platform |

---

### P9 -- Tool Stack Guide

| Feld | Wert |
|---|---|
| **Name** | `fu75ch1 Tool Stack Guide -- Every Tool, Every Decision, Every Config` |
| **URL** | `tool-stack-guide` |
| **Amount** | `12` EUR |
| **Summary** | The complete approved tool stack behind a 15-phase AI operating system -- what each tool does, why it made the cut over alternatives, privacy status, and setup notes. |
| **Content** | `zips\P09_tool-stack-guide\` (2 Dateien) |

> Im Paket liegt eine bereinigte Fassung: die internen H1-Zeilen (`# Product 9`,
> `# Title:`, `# Price: EUR12`, `# Slug:`) wurden entfernt und durch einen echten
> Titel ersetzt. Die Quelldatei ist unangetastet.
>
> **Ungeloest bleibt:** Verkaufsseite und Deliverable sind derselbe Text. Wer die
> Produktseite liest, hat fast alles. Ueberleg, ob das Deliverable nicht mehr
> enthalten sollte als die Verkaufsseite -- sonst ist die Rueckerstattungsquote
> vorprogrammiert.

| Key | Value |
|---|---|
| `AI & Automation (6 tools)` | Claude via Anthropic API (zero-data-retention endpoint), AnythingLLM, Ollama, n8n, LangFuse, Memos -- all self-hosted except the API |
| `System & Security (5 tools)` | KeePassXC, gitleaks, PSScriptAnalyzer, Wireshark, Obsidian |
| `Dev & Reverse Engineering (5 tools)` | JADX-GUI, Ghidra, Docker Desktop, repomix, PowerShell 7 |
| `Browser & OpSec (4 tools)` | LibreWolf, uBlock Origin, Mullvad VPN, NextDNS |
| `AI Security (4 tools)` | Garak, Promptfoo, Llama Guard, PyRIT |
| `Rejected -- and why` | 1Password / Bitwarden (cloud sync = credential server dependency), GitHub Copilot (code sent externally by default), Notion (proprietary cloud, no real offline mode), Zapier / Make (data leaves the system), ChatGPT web (no zero-data-retention on consumer tier) |
| `For each tool` | Purpose, evaluated alternatives, why it made the cut, privacy status, version pinning rationale, setup notes, known issues |

---

### P10 -- The Blueprint (Flaggschiff)

| Feld | Wert |
|---|---|
| **Name** | `The fu75ch1 Blueprint -- Complete AI Operating System (15 Phases)` |
| **URL** | `blueprint` |
| **Amount** | `49` EUR Basispreis + Discount-Code `EARLYBIRD` (Limit 50) auf 29 EUR |
| **Summary** | The complete system behind the 9 standalone products -- all 15 phases, every script, every config, every documented mistake. |
| **Content** | **FEHLT.** Vault-Export noetig, dann Ghost-Mark wie bei den anderen |

> **Preis-Mechanik:** sichtbarer Anker 49 EUR, Rabatt kommuniziert Dringlichkeit.
> Nicht 29 EUR als Startpreis eintragen.
> **Pack-Regel:** Quelle ausschliesslich `fu75ch1_public`, **nie** der Core-Vault.
> Vorher `Invoke-PublicExport` (Header v2.6) + gitleaks laufen lassen.
> Enthaelt Configs -> die JSON-Ausnahme aus P3 gilt auch hier, Note anpassen.

| Key | Value |
|---|---|
| `The math` | All 9 standalone products are included -- plus the phase documentation, error chronicle and vault structure that none of them contain individually |
| `Core System` | Master-Prompt v4.7, Behaviour Addendum v1.1, all 15 phase plans and completion protocols, idempotent PowerShell scripts, and the full error chronicle with root cause, fix and prevention rule for each entry |
| `Privacy & Security` | OpSec audit (38 automated checks), Windows hardening, DNS/VPN setup, browser hardening, KeePass blueprint, Fire TV hardening |
| `AI Architecture` | AnythingLLM RAG setup, n8n workflow automation, LangFuse observability, MCP server configuration, and 10 jailbreak resistance patterns with Garak run documentation |
| `Knowledge System` | Obsidian vault structure, Git workflow with commit conventions, State Transfer format for context across sessions |
| `Red-team testing -- honest disclosure` | Earlier versions of this listing quoted Garak ASR percentages. A later audit found the harness never injected the system prompt, so those figures measured the bare model. Both the full run documentation and the rebuilt harness are included. We'd rather ship the retraction than a flattering number. |
| `Format` | .zip -- all markdown files, scripts and configs |
| `Updates` | Free forever -- you're buying the living system, not a snapshot |
| `Early Bird` | First 50 buyers 29 EUR, then 49 EUR |

---

### P11 -- Security Lab

| Feld | Wert |
|---|---|
| **Name** | `fu75ch1 Security Lab - Reverse Engineering + AI Red-Teaming (reproducible, isolated)` |
| **URL** | `security-lab` |
| **Amount** | `27` EUR Basispreis + Early-Bird-Code auf 19 EUR (erste 50) |
| **Summary** | A reproducible security lab you build from pinned, idempotent scripts: reverse engineering (Android + firmware) and AI red-teaming in one isolated environment. Built around a real, documented measurement failure -- so you learn the part most courses skip: proving your test tested what you think it did. |
| **Content** | `zips\P11_security-lab\` (15 Dateien) |

> Die Copy hat zusaetzlich `## HONEST STATUS`, `## WHO IT'S FOR` und
> `## WHAT YOU NEED` -- die gehoeren mit in die **Description**, nicht in die
> Details. Der HONEST-STATUS-Block ist das staerkste Stueck Copy im ganzen Store.
> Nicht kuerzen.

| Key | Value |
|---|---|
| `Provisioning -- two isolated tracks` | AI red-teaming via pinned Docker environment (garak 0.15.1, Promptfoo 0.121.17, PyRIT 0.14.0); reverse engineering via Windows Sandbox config plus an idempotent WSL2 provisioner (JADX 1.5.5, Ghidra 12.1.2, Frida 17.15.0, Binwalk 2.3.3) |
| `A verifier` | Verify-LabSetup.ps1 proves the whole toolchain is present at the pinned versions -- an actual check, not an exit code |
| `Five numbered modules` | Isolation, Android RE, firmware forensics, AI red-teaming, and a capstone -- all five complete and usable |
| `The centrepiece` | Module 4 rebuilds a real documented measurement failure: a harness that reported attack-success numbers for months while never injecting the prompt it claimed to test. You reproduce that class of bug and learn the payload-verification method that catches it |
| `Safety & legal layer` | Defines exactly what these tools may and may not be pointed at |
| `Honest caveats` | Hardware read-out is taught as concept and workflow, not a bench demo. Download hashes in the RE provisioner are left as CONFIRM for you to verify against each vendor's official checksum before install |
| `Requirements` | Windows 11 Pro/Enterprise for Sandbox (Home users run the WSL2 + Docker track), Docker Desktop, ~30 GB free disk, virtualization enabled, your own API key, and lawful analysis targets |
| `Format & updates` | .zip with all markdown modules, provisioning scripts, Dockerfile, Sandbox config and verifier. Free updates forever. First 50 buyers 19 EUR, then 27 EUR |

---

## 4. Receipt-Tab -- aktuell ueberall leer

Der Moment direkt nach dem Kauf, derzeit verschenkt.

**Button text** (max. 26 Zeichen):

| Produkt | Text | Zeichen |
|---|---|---|
| P1 | `Download the prompt` | 19 |
| P2 | `Download the audit script` | 25 |
| P3 | `Download the configs` | 20 |
| P4 | `Download the playbook` | 21 |
| P5, P6, P9 | `Download the guide` | 18 |
| P7 | `Download the config` | 19 |
| P8 | `Download the blueprint` | 22 |
| P10 | `Download the Blueprint` | 22 |
| P11 | `Download the lab` | 16 |

**Custom message** -- Vorlage fuer alle, `[X]` je Produkt ersetzen:

```
Thanks -- you now have [X].

Start with the README, then work top to bottom. Everything is
reproducible: every step has a verification command, and every
mistake behind it is numbered in the error chronicle.

Every file in this download carries an invisible license watermark.
Verify-GhostMark.py is included -- run it against any file and see
for yourself which are marked.

Free, sanitized repo: github.com/0xWrt/fu75ch1-OS
Licence: CC BY-NC 4.0

Found something wrong? Tell me -- corrections get published, not buried.
```

> Bei P3 den Watermark-Absatz anpassen: die zwei JSON-Configs tragen
> formatbedingt keine Signatur.

---

## 5. Tags pro Produkt

**Zum Limit:** Die offizielle Hilfeseite nennt keine Obergrenze; die verbreitete
5-Tag-Grenze stammt aus einer alten, unbestaetigten Quelle. Unten fuenf Kern-Tags
in Prioritaetsreihenfolge plus Reserve. Das Feld sagt beim Tippen, wann Schluss ist.

**Zwei Prinzipien:** Werkzeugnamen schlagen Oberbegriffe (`wireguard` findet
jemand, `security` niemand). Und Relevanz vor Reichweite -- viel Traffic heisst
vor allem viel Konkurrenz.

Tags erscheinen laut Hilfeartikel **ab neun Produkten** auch auf dem Profil und
lassen dort filtern. Direkt-Link auf einen Tag:
`[Profil-URL]?sort=page_layout&tags=[tag]`

| Produkt | Kern-Tags (Reihenfolge = Prioritaet) | Reserve |
|---|---|---|
| **P1** | `system prompt` `prompt engineering` `ai security` `jailbreak` `claude` | `llm`, `prompt security` |
| **P2** | `powershell` `windows security` `security audit` `opsec` `hardening` | `windows 11`, `script` |
| **P3** | `ollama` `n8n` `wireguard` `self hosted` `local ai` | `docker`, `automation` |
| **P4** | `ai security` `red teaming` `llm security` `garak` `powershell` | `prompt injection` |
| **P5** | `windows hardening` `windows 11` `powershell` `bitlocker` `cybersecurity` | `firewall` |
| **P6** | `wireguard` `vpn` `dns` `nextdns` `privacy` | `kill switch`, `dns leak` |
| **P7** | `librewolf` `browser privacy` `ublock origin` `fingerprinting` `privacy` | `firefox`, `user.js` |
| **P8** | `keepassxc` `password manager` `offline` `api keys` `privacy` | `credentials` |
| **P9** | `self hosted` `local first` `privacy tools` `ai stack` `homelab` | `open source` |
| **P10** | `ai operating system` `local ai` `self hosted` `automation` `privacy` | `obsidian` |
| **P11** | `reverse engineering` `red teaming` `ghidra` `frida` `ai security` | `android`, `firmware` |

**Bewusst nicht drin:** `ai`, `security`, `windows`, `tech` -- reine
Konkurrenzfelder ohne Kaufabsicht dahinter.

**Cluster-Logik:** `wireguard` verbindet P3+P6, `powershell` verbindet P2+P4+P5,
`ai security` verbindet P1+P4+P11. Wer ueber einen Tag reinkommt, findet ueber
denselben die Nachbarprodukte.

---

## 6. Offene Blocker

1. **Cover fehlen bei allen Produkten.** Anforderung: horizontal, mindestens
   1280x720 px, 72 DPI. Laut ToDo existieren 8 Cover als Chat-Downloads -- die
   gehoeren nach `fu75ch1_public\01_Architecture\Covers\`.
2. **Profil hat keine Sections.** Solange das so ist, zeigt
   `fu75ch1.gumroad.com` keine Produkte -- und genau dorthin verlinkt der
   Cross-Sell-Footer jeder Copy-Datei. Section anlegen, bevor das erste Produkt
   live geht.
3. **P10 fehlt komplett** -- Vault-Export noetig.
4. **P1-Status strittig.** Gumroad zeigt fuer P1 den Unpublish-Button, was laut
   Hilfeartikel 248 ein veroeffentlichtes Produkt bedeutet. `metrics.json` steht
   auf `products_live_gumroad: 0`. Konsumenten-Check:
   `fu75ch1.gumroad.com/l/master-prompt-v47` im privaten Fenster oeffnen. Erst
   danach die Metrik anfassen -- ohne Verifikation waere es Fehler #110 nochmal.

---

## 7. Gegen die offizielle Doku geprueft (2026-07-24)

Quellen: Hilfeartikel 79 (Discover), 123 (Tags), 124 (Profil), 149 (Adding a
product), 248 (Unpublish/Delete), 10 (EU & UK VAT). Die Hilfeseiten rendern per
JavaScript und liessen sich nicht direkt abrufen -- gelesen wurden die
indexierten Inhalte derselben Artikel.

**Bestaetigt:** Feldzuordnung (Artikel 149), Unpublish-Semantik (248),
Discover-Voraussetzungen und Kategorie-Opt-out (79), kein dokumentiertes
Tag-Limit (123), Profil braucht Sections (124).

**Korrigiert gegenueber frueheren Fassungen dieses Blatts:** e-publication-Regel
(die EU-Definition ist enger als „Dokumentprodukt"), Tag-Filter ab neun statt
zehn Produkten.

**Weiterhin ungeprueft:** Dateigroessen-Limit (relevant fuer P10/P11), genaue
Kategorie-Labels im Dropdown.
