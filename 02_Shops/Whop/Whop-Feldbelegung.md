---
date: 2026-07-24
tags: [whop, felder, upload, checkliste, launch]
status: Arbeitsblatt -- Copy-Quelle sind die Whop-P*.md im selben Ordner
title: Whop Feldbelegung -- jedes Eingabefeld
---

# Whop Feldbelegung -- jedes Eingabefeld

> Doku-Stand **2026-07-24**, gelesen aus
> `docs.whop.com/manage-your-business/products/create-product`.
>
> Im Vault liegen nur zwei Whop-Copies: **P1** und **P11**. Das ist die bewusste
> Strategie (Whop = P1 als Standalone-Einstieg, P11 als Lab-Produkt), kein Versehen.

---

## ⚠️ 0. Der Fund, der dich sonst kalt erwischt

**Whop begrenzt Name UND Headline auf je 80 Zeichen.**

Der P11-Name aus der Gumroad-Fassung hat **84 Zeichen**:

```
fu75ch1 Security Lab - Reverse Engineering + AI Red-Teaming (reproducible, isolated)
```

Passt nicht. Gekuerzte Fassung, 58 Zeichen:

```
fu75ch1 Security Lab — Reverse Engineering + AI Red-Teaming
```

Der Zusatz „reproducible, isolated" wandert in die **Headline** -- da gehoert er
ohnehin besser hin.

P1 ist mit 55 Zeichen unkritisch.

---

## 1. Die Felder, die Whop wirklich hat

### Schritt „Explain what you're selling"

| Feld | Limit | Anmerkung |
|---|---|---|
| **Name** | **max 80 Zeichen** | |
| **Headline** | **max 80 Zeichen** | ein Satz, was du verkaufst |
| **Banner image** | -- | repraesentiert das Produkt |

> Whop bietet neben beiden Feldern einen **Generate-with-AI**-Stern an. Nicht
> benutzen -- deine Copy ist geschrieben und konsistent ueber alle Shops.

### Schritt „Choose pricing"

| Feld | Anmerkung |
|---|---|
| **Pricing type** | one-time / subscription / free. Fuer dich: **one-time** |
| **Price** | pro Pricing-Option |
| **Currency** | EUR |
| Mehrere Pricing-Optionen | moeglich -- damit laesst sich Early Bird als zweite Option abbilden statt ueber Discount-Code |
| Waitlist | nein |
| Free trial | nein |
| Advanced payment options | Default lassen |
| **Payment methods** | auswaehlbar, welche im Checkout erscheinen |

**Auf Pricing-Options-Ebene** (Advanced options) gibt es zusaetzlich:

| Feld | Nutzen fuer dich |
|---|---|
| **Stock** | Default unbegrenzt. **Zahl eintragen = Limit.** Genau das Werkzeug fuer „First 50 buyers" -- Stock `50` auf die Early-Bird-Option |
| **Description** | Beschreibung der Pricing-Option, erscheint im Checkout |
| **Show on store page** | Default an. Aus = nur ueber privaten Link erreichbar |
| Add a waitlist | aus |

> Damit ist Early Bird auf Whop sauberer loesbar als auf Gumroad: zwei
> Pricing-Optionen, die guenstige mit Stock 50. Kein Discount-Code noetig, das
> Kontingent laeuft automatisch aus.
>
> **Aber:** Das Early-Bird-Kontingent gilt kanaluebergreifend. Vor dem Setzen die
> bereits verkauften Einheiten auf Gumroad/Polar abziehen.

### Schritt „Add apps"

Ueberspringen. Laut Doku: wer Whop nur zum Kassieren nutzt und ausserhalb der
Plattform ausliefert, braucht keine Apps. Das ist dein Fall -- Auslieferung
laeuft ueber die Datei.

> Pruefen, wie die Datei dann beim Kaeufer ankommt. Whop ist primaer
> Community-/Access-orientiert; die reine Datei-Auslieferung ist nicht der
> Standardweg. Falls es keinen sauberen File-Delivery-Mechanismus gibt, ist das
> ein Argument, Whop nur fuer P1 zu nutzen und P11 dort zu lassen.

### Schritt „Design your product page"

| Feld | Anmerkung |
|---|---|
| **Photo oder Video** | |
| **Description** | der eigentliche Verkaufstext |
| **Gallery images** | **Pflicht fuer die Marketplace-Listung** |
| Category | Pflicht fuer Marketplace |

Whop weist ausdruecklich darauf hin: je detaillierter die Produktseite, desto
eher wird der Account fuer weitere Features freigeschaltet.

### Weitere Optionen

- **Pre-checkout questions** -- nicht noetig
- **Post-checkout redirects** -- optional, koennte auf das Repo zeigen
- **Max participants** -- nicht noetig

---

## 2. Feldbelegung P1 -- Master-Prompt v4.7

| Feld | Wert | Zeichen |
|---|---|---|
| **Name** | `fu75ch1 Master-Prompt v4.7 — Production AI System Prompt` | 55 |
| **Headline** | `The system prompt running a complete AI OS — red-teamed, production-hardened` | 75 |
| **Pricing type** | one-time | |
| **Price / Currency** | `9` EUR | |
| **Stock** | unbegrenzt | |
| **Pricing-Option Description** | `Master-Prompt v4.7 (.md, ready to paste)` | |
| **Show on store page** | an | |
| **Description** | SUMMARY + DESCRIPTION aus `Whop-P1-Master-Prompt.md` | |
| **Datei** | `zips\P01_master-prompt-v47\` | |
| **Banner / Gallery** | fehlt noch | |
| Apps | keine | |

---

## 3. Feldbelegung P11 -- Security Lab

| Feld | Wert | Zeichen |
|---|---|---|
| **Name** | `fu75ch1 Security Lab — Reverse Engineering + AI Red-Teaming` | 58 |
| **Headline** | `Reproducible, isolated lab: Android RE, firmware forensics, AI red-teaming` | 73 |
| **Pricing type** | one-time | |
| **Preis-Option A** | `19` EUR · **Stock 50** · Description `Early Bird — first 50` | |
| **Preis-Option B** | `27` EUR · unbegrenzt · Description `Standard` | |
| **Show on store page** | beide an | |
| **Description** | volle Copy aus `Whop-P11-Security-Lab.md` inkl. HONEST STATUS | |
| **Datei** | `zips\P11_security-lab\` (15 Dateien) | |
| **Banner / Gallery** | fehlt noch | |
| Apps | keine | |

> `Whop-P11-Security-Lab.md` ist mit 2,1 KB die kuerzeste Produktcopy im ganzen
> Vault -- rund die Haelfte der Polar-Fassung. Vor dem Anlegen gegen
> `Gumroad-P11-Security-Lab.md` (5,4 KB) abgleichen und pruefen, ob der
> HONEST-STATUS-Block ueberhaupt drin ist. Der ist das staerkste Stueck Copy im
> Store und darf auf keiner Plattform fehlen.

---

## 4. Offen

1. **Banner- und Gallery-Bilder fehlen** -- ohne sie keine Marketplace-Listung
2. **File-Delivery klaeren** (siehe „Add apps") -- der kritische Punkt
3. **Whop-P11-Copy ist auffaellig kurz** -- gegen die Gumroad-Fassung pruefen
4. **Early-Bird-Kontingent kanaluebergreifend** abstimmen, bevor Stock 50 gesetzt wird
5. Es gibt **keine Whop-Copies fuer P2-P10** -- bewusst so, nicht nachziehen ohne Grund
