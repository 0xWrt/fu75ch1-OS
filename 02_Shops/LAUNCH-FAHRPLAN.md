---
date: 2026-07-24
tags: [launch, fahrplan, shops, gumroad, polar, whop, lemonsqueezy]
status: aktiv -- Master-Fahrplan ueber alle vier Storefronts
title: Launch-Fahrplan -- alle Shops, in Abhaengigkeitsreihenfolge
---

# Launch-Fahrplan -- alle vier Shops

> **Wozu dieses Dokument:** Die vier Feldblaetter sagen, *was* in welches Feld
> gehoert. Dieses hier sagt, *in welcher Reihenfolge* -- weil vier Dinge
> voneinander abhaengen und in falscher Reihenfolge Arbeit doppelt anfaellt.

## Die vier Feldblaetter

| Shop | Produkte | Datei |
|---|---|---|
| Gumroad | P1-P11 (alle 11) | `02_Shops\Gumroad\Gumroad-Feldbelegung-P1-P11.md` |
| Polar | P1-P9, P11 (10) | `02_Shops\Polar\Polar-Feldbelegung-P1-P11.md` |
| Whop | P1, P11 (2) | `02_Shops\Whop\Whop-Feldbelegung.md` |
| Lemon Squeezy | P10 (1) | `02_Shops\LemonSqueezy\LemonSqueezy-Feldbelegung.md` |

Gumroad ist der Hauptkanal. Polar ist der vollstaendige Zweitkanal. Whop ist
Einstieg plus Lab. Lemon Squeezy ist ausschliesslich der Blueprint-Zweitkanal.

---

## Die vier Abhaengigkeiten, die die Reihenfolge bestimmen

**1. Early-Bird-Kontingent ist kanaluebergreifend.**
P10 und P11 haben je „first 50". Wenn Gumroad, Polar, Whop und Lemon Squeezy
jeweils eigene 50 vergeben, verkaufst du 200 Early Birds statt 50. Also: **erst
alle Kanaele anlegen, Kontingent zuletzt aufteilen** -- oder von Anfang an nur
auf **einem** Kanal Early Bird anbieten. Letzteres ist einfacher und ehrlicher.

**2. Cover werden in drei Zuschnitten gebraucht.**

| Shop | Format | Anforderung |
|---|---|---|
| Gumroad | 16:9 | horizontal, min. 1280x720, 72 DPI |
| Lemon Squeezy | 4:3 | bis 10 MB, bis 10 Bilder |
| Polar | frei | bis 10 MB je Bild |
| Whop | Banner + Gallery | Gallery ist **Pflicht** fuer die Marketplace-Listung |

Ein Bild reicht nicht. Einmal Quelldatei bauen, dreimal exportieren -- nicht
dreimal von vorn.

**3. Gumroads Profil-Sections muessen vor dem ersten Publish stehen.**
Der Cross-Sell-Footer **jeder** Copy-Datei verlinkt auf `fu75ch1.gumroad.com`.
Ohne Sections zeigt die Seite nichts. Jeder Kaeufer, der dem Link folgt, landet
im Leeren.

**4. Die Platzhalter `[LEMON SQUEEZY LINK]` und `[SUBSTACK LINK]`**
stehen in den Footern und lassen sich erst ersetzen, wenn die Ziele existieren.
Also: Lemon Squeezy anlegen, **dann** global ersetzen, **dann** die restlichen
Shops befuellen. Batch-Skript liegt in `Gumroad-Footer-Platzhalter.md`.

---

## Etappe 0 -- Blocker aufloesen (vor jedem Upload)

| # | Aufgabe | Aufwand | Blockiert |
|---|---|---|---|
| 0.1 | **P1-Status klaeren.** `fu75ch1.gumroad.com/l/master-prompt-v47` im privaten Fenster oeffnen. Laedt die Seite → live. Danach `metrics.json` nachziehen | 2 min | metrics-Wahrheit |
| 0.2 | **Gumroad-Profil-Section anlegen** | 10 min | alle Gumroad-Publishes |
| 0.3 | **Cover bauen**, eine Quelle → drei Exporte, 11 Produkte | 2-3 h | alle vier Shops |
| 0.4 | **P10-Paket erzeugen:** `Invoke-PublicExport` (Header v2.6) + gitleaks, dann Ghost-Mark wie bei den anderen zehn | 45 min | Gumroad P10, Lemon Squeezy |
| 0.5 | **Entscheidung Early Bird:** ein Kanal oder aufgeteilt | 5 min | P10, P11 ueberall |
| 0.6 | **Whop File-Delivery klaeren** -- wie kommt die Datei beim Kaeufer an, wenn keine App angebunden ist | 30 min | Whop komplett |
| 0.7 | **Polar-Kurzfeld pruefen** -- existiert das 42-Zeichen-Feld noch? | 5 min | Polar-Textform |
| 0.8 | **Polar API-Key rotieren**, falls noch nicht geschehen | 5 min | -- (Sicherheit) |

> 0.3 und 0.4 sind die echten Brocken. Alles andere ist Minutenarbeit.

---

## Etappe 1 -- Gumroad (Hauptkanal)

Pakete liegen fertig in `02_Shops\_UPLOAD_READY\zips\`, gewatermarkt und verifiziert.

1. **P1 und P2** gegenpruefen -- laut Screenshots bereits angelegt. Felder gegen
   das Feldblatt abgleichen, besonders die drei fehlenden Additional-details-Zeilen bei P1
2. **P3 bis P9** neu anlegen. Reihenfolge egal, Copy sitzt
3. **P11**
4. **P10** zuletzt -- braucht 0.4
5. Pro Produkt: Name, Summary, Description, Additional details, URL, Preis,
   Content, Cover, Receipt-Tab, Kategorie, Tags
6. **Nach jedem Publish:** Live-Seite gegen die Copy-Datei diffen

**Nicht vergessen:** die Zeile `**→ Buy now on Gumroad**` aus jeder Description
streichen. Gumroad rendert seinen eigenen CTA.

Aufwand: ~20 min pro Produkt, 9 neue Produkte → **etwa 3 Stunden**.

---

## Etappe 2 -- Lemon Squeezy (nur Blueprint)

Vorgezogen vor Polar und Whop, weil die Footer-Platzhalter darauf warten.

1. Store anlegen, Identitaet verifizieren
2. **Test mode** nutzen, bevor etwas live geht
3. Blueprint anlegen nach Feldblatt -- Tax category ist Pflichtfeld
4. Zip hochladen, **selbst herunterladen und oeffnen**
5. Discount-Code nach Entscheidung 0.5
6. Confirmation modal + Receipt
7. Publish
8. **Danach: Platzhalter `[LEMON SQUEEZY LINK]` global ersetzen** (Abhaengigkeit 4)

Aufwand: **~1,5 Stunden** inklusive Store-Setup.

---

## Etappe 3 -- Polar (voller Zweitkanal)

1. Kurzfeld-Frage aus 0.7 geklaert
2. **P1** komplett anlegen, Checkout einmal selbst durchspielen
3. **P2, P3, P4** einzeln
4. **P5 bis P8** ueber **Duplicate Product** aus P5 klonen -- identische Struktur,
   nur Name, Slug, Preis, Description, Datei tauschen
5. **P9, P11**
6. Pro Produkt: Benefit-Datei selbst herunterladen und oeffnen

**Achtung:** Billing cycle und Pricing type sind nach dem Anlegen unveraenderlich.
Ueberall `one-time` + `fixed`. Vertippt = Produkt neu anlegen.

Aufwand: ~15 min pro Produkt, mit Duplicate weniger → **etwa 2 Stunden**.

---

## Etappe 4 -- Whop (Einstieg + Lab)

Erst wenn 0.6 geklaert ist.

1. **P1** mit gekuerztem Namen -- Limit 80 Zeichen
2. **P11** mit gekuerztem Namen (Original hat 84 Zeichen, passt nicht)
3. Early Bird ueber zwei Pricing-Optionen mit **Stock 50** auf der guenstigen --
   sauberer als ein Discount-Code, sofern 0.5 Whop als Early-Bird-Kanal vorsieht
4. Banner + Gallery hochladen, sonst keine Marketplace-Listung
5. Vorher: `Whop-P11-Security-Lab.md` (2,1 KB) gegen die Gumroad-Fassung (5,4 KB)
   abgleichen -- der HONEST-STATUS-Block darf nirgends fehlen

Aufwand: **~1 Stunde**, plus die Klaerung aus 0.6.

---

## Etappe 5 -- Abschluss

1. `Invoke-MetricsCheck.ps1` -- Gate gruen
2. `products_live_gumroad` und die uebrigen Zaehler auf den **verifizierten**
   Stand setzen. Verifiziert heisst: Produkt-URL ausgeloggt geoeffnet, nicht
   Backend-Ansicht. Sonst Fehler #110 nochmal
3. `README.md` und `MANIFESTO.md` um die neuen Kanaele ergaenzen
4. AnythingLLM starten und `Update-ChronikRAG.ps1` nachziehen -- der RAG-Index
   kennt die neuesten Chronik-Eintraege noch nicht
5. StateTransfer v49 schreiben
6. Beide Repos committen, Public pushen

---

## Zeitrahmen

| Etappe | Aufwand |
|---|---|
| 0 Blocker | 4-5 h (davon 2-3 h Cover) |
| 1 Gumroad | 3 h |
| 2 Lemon Squeezy | 1,5 h |
| 3 Polar | 2 h |
| 4 Whop | 1 h |
| 5 Abschluss | 1 h |
| **Summe** | **~13 Stunden** |

Realistisch verteilt: **drei Arbeitstage**, nicht ein Abend. Der groesste
Einzelposten sind die Cover, und die kann dir niemand abnehmen, der nicht
zeichnen kann.

---

## Was NICHT gemacht wird

- Einzelprodukte P2-P10 auf Whop spiegeln
- Einzelprodukte P1-P9 auf Lemon Squeezy spiegeln
- Eigene Sales-Copy pro Plattform pflegen -- Single-Source-Regel, die Copy lebt
  in `02_Shops\<Shop>\`, und der Gumroad-Text ist die Referenz
- License Keys aktivieren
- Enterprise Tier 3

---

## Regeln, die auf jedem Kanal gelten

1. **Der Konsument verifiziert, nicht der Upload.** Nach jedem Publish die
   Datei selbst kaufen oder herunterladen und oeffnen. Eine gruene
   Upload-Meldung ist Selbstbestaetigung (#119).
2. **Copy-Datei ist kanonisch.** Weicht die Live-Seite ab, wird die Live-Seite
   korrigiert, nicht die Datei.
3. **Keine Zusage ohne Artefakt.** Was die Copy verspricht, muss im Paket liegen.
   Drei Wochen Wasserzeichen-Versprechen ohne Deckung waren Fehler #120 --
   offen ist noch der „Buyer setup guide" in der P1-Copy, den es nicht gibt.
4. **Keine harten Zahlen in die Copy**, die veralten koennen. „Every mistake,
   numbered" statt einer Zahl.
