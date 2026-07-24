---
date: 2026-07-23
tags: [lemonsqueezy, felder, upload, checkliste, blueprint]
status: Arbeitsblatt -- Copy-Quelle ist Gumroad-P10-Blueprint.md (Single-Source-Regel)
title: Lemon Squeezy Feldbelegung -- jedes Eingabefeld
---

# Lemon Squeezy Feldbelegung -- jedes Eingabefeld

> Doku-Stand **2026-07-23**, gelesen aus
> `docs.lemonsqueezy.com/help/products/adding-products` und der API-Referenz
> `/api/products/the-product-object`.
>
> **Single-Source-Regel:** Die Copy lebt in
> `02_Shops\Gumroad\Gumroad-P10-Blueprint.md`. Hier stehen nur die
> LemonSqueezy-spezifischen Felder. Keine Copy-Duplikate anlegen -- das war die
> Drift-Ursache rund um Fehler #103.
>
> **Nur ein Produkt:** der Blueprint. Einzelprodukte P1-P9 werden bewusst nicht
> gespiegelt (doppelter Pflegeaufwand ohne Mehrwert).

---

## 1. Die Felder, die Lemon Squeezy wirklich hat

Pflichtminimum laut Doku: **Name, Price, File.** Alles andere ist optional --
aber „optional" heisst hier durchweg „lohnt sich".

### Produkt-Ebene

| Feld | Anmerkung |
|---|---|
| **Name** | Doku empfiehlt ausdruecklich spezifisch statt simpel. Ihr Beispiel: nicht „Watercolor Brushes", sondern „28 High-Resolution Watercolor Brushes for Photoshop" |
| **Description** | Wird **im Checkout** angezeigt. Doku: kurz und einfach halten. Intern HTML |
| **Slug** | wird aus dem Namen erzeugt |
| **Pricing** | single payment / subscription / pay what you want / free |
| **Tax category** | **Pflicht pro Produkt.** Bestimmt, wieviel Steuer aufgeschlagen wird |
| **Media** | bis zu **10 Bilder**, je bis **10 MB**, empfohlen **4:3**. Genutzt in Checkout, Social Sharing, Mail-Thumbnails, Dashboard. Sortierbar |
| **Files** | unbegrenzt viele, **bis 5 GB gesamt**, jeder Dateityp, sortierbar |
| **Links** | bis zu **3 externe Links** pro Produkt |
| **Variants** | eigene Name, Description, Price, Files, License-Key-Settings je Variante |
| **Status** | draft / published |

### Settings

| Setting | Wert fuer dich |
|---|---|
| Generate license keys | **aus.** Bei mehr als einer Variante wandert das Setting auf Varianten-Ebene |
| Display product on storefront? | **an** -- sonst nicht im gehosteten Store sichtbar |

### Confirmation modal (nach dem Kauf)

Titel, Nachricht, Button-Text und Button-Link sind **pro Produkt frei
konfigurierbar**. Gumroad kann das nicht -- hier also mehr Spielraum.

### Receipt-Mail

Nachricht, Button-Text und Button-Link ebenfalls pro Produkt anpassbar.

---

## 2. Zwei Verhaltensweisen, die man kennen muss

**Dateiaenderungen wirken rueckwirkend.** Wird eine Datei ersetzt, koennen auch
Bestandskaeufer nur noch die **neue** Fassung laden. Fuer ein „living system" mit
Gratis-Updates ist das genau richtig -- der Blueprint verspricht das ausdruecklich.

**Loeschen ist endgueltig, Abschalten nicht.** Geloeschte Dateien und Links sind
fuer Altkaeufer weg. Die Doku empfiehlt ausdruecklich, Dateien **abzuschalten**
statt zu loeschen. Gleiches gilt fuer Varianten: eine deaktivierte Variante
bleibt fuer alle, die sie gekauft haben, zugaenglich.

---

## 3. Feldbelegung -- The fu75ch1 Blueprint

| Feld | Wert |
|---|---|
| **Name** | `The fu75ch1 Blueprint — Complete AI Operating System (15 Phases)` |
| **Description** | SUMMARY aus `Gumroad-P10-Blueprint.md`, gekuerzt -- die Doku sagt ausdruecklich „short and simple" fuers Checkout-Feld. Der Langtext gehoert auf die Storefront-Seite, nicht hierhin |
| **Pricing** | Single payment, `49` EUR |
| **Discount-Code** | Early Bird auf `29` EUR, **Limit = 50 minus bereits verkaufte Gumroad-/Polar-Early-Birds** |
| **Tax category** | Pflichtfeld -- passende Kategorie fuer digitale Downloads waehlen. Bei Unsicherheit Steuerberater, nicht raten |
| **Files** | dasselbe Zip wie Gumroad P10, **gleicher Ghost-Mark-Stand** |
| **Media** | Cover 4:3, fehlt noch |
| **Links** | 1. `https://github.com/0xWrt/fu75ch1-OS` 2. Gumroad-Store 3. frei |
| **Generate license keys** | aus |
| **Display on storefront** | an |
| **Variants** | keine |

### Confirmation modal

| Feld | Wert |
|---|---|
| Titel | `You have the Blueprint.` |
| Nachricht | `Start with the README, then work top to bottom. Every step has a verification command, and every mistake behind it is numbered in the error chronicle.` |
| Button-Text | `Download the Blueprint` |
| Button-Link | Download-Link |

### Receipt-Mail

Dieselbe Vorlage wie im Gumroad-Receipt-Tab, inklusive Ghost-Mark-Absatz und
`Verify-GhostMark.py`-Hinweis. Der Blueprint enthaelt Configs -- also die
**JSON-Ausnahme** mitformulieren, wie in der P3-Copy.

---

## 4. Setup-Checkliste

- [ ] Store anlegen: Name `fu75ch1`, anonyme Bio aus `00_META\Platform_Bios.md`
- [ ] Identitaet verifizieren (Pflicht vor Auszahlung)
- [ ] **Test mode** nutzen, bevor irgendwas live geht -- LemonSqueezy hat einen
      dokumentierten Test-Modus, Polar hat dafuer eine separate Sandbox
- [ ] Produkt anlegen, Felder wie oben
- [ ] Tax category setzen
- [ ] Zip hochladen, danach **selbst herunterladen und oeffnen**
- [ ] Discount-Code mit abgestimmtem Restkontingent
- [ ] Confirmation modal + Receipt
- [ ] Publish
- [ ] README-Blueprint-Link um die LemonSqueezy-Option ergaenzen (beide Kanaele
      nennen, Kaeufer waehlt)
- [ ] `Invoke-MetricsCheck.ps1` laufen lassen, `products_live` anpassen

---

## 5. Bewusst NICHT

- Einzelprodukte P1-P9 spiegeln
- Eigene LemonSqueezy-Sales-Copy pflegen (Single-Source-Regel)
- License Keys aktivieren -- die Produkte sind Dokumente und Skripte, kein
  lizenzpflichtige Software. Der Ghost-Mark uebernimmt die Provenienz

---

## 6. Offen

1. **Cover 4:3** fehlt (Gumroad braucht 16:9, LemonSqueezy empfiehlt 4:3 -- zwei
   Zuschnitte noetig, nicht dasselbe Bild)
2. **P10-Zip existiert noch nicht** -- Vault-Export ist der Blocker
3. **Tax category** ungeklaert
4. **Early-Bird-Restkontingent** kanaluebergreifend ermitteln
