r"""
Ghost-Mark / Watermark-Verifikation für fu75ch1-Produkte
==========================================================

Jede der 9 Polar-Produktbeschreibungen in `Content-Neutral-Watermarked\`
enthaelt direkt nach der H1-Ueberschrift eine unsichtbare Zero-Width-
Unicode-Signatur (Zero-Width Non-Joiner / Zero-Width Joiner / Zero-Width
Space als Bit-Encoding). Beim Rendern in Markdown/HTML ist sie unsichtbar,
bleibt aber im Rohtext erhalten -- auch nach Copy-Paste in den meisten
Editoren und Plattformen (Polar, Gumroad, etc.).

Zweck: Herkunftsnachweis (CC BY-NC 4.0 Autorschaft), falls Inhalte ohne
Attribution weiterverbreitet werden. Kein Kopierschutz, keine Kaeufer-ID --
nur ein produktspezifischer Fingerprint.

Format der Signatur: fu75ch1|<slug>|CC-BY-NC-4.0|<datum>

Verwendung:
    python Verify-GhostMark.py <pfad-zur-datei.md>

Encoder-Logik (identisch zur Erzeugung, hier nur zur Dokumentation):
    ZWNJ (U+200C) = Bit 0
    ZWJ  (U+200D) = Bit 1
    ZWSP (U+200B) = Start-/Ende-Delimiter
"""

import sys

ZWNJ = '\u200C'  # bit 0
ZWJ  = '\u200D'  # bit 1
ZWSP = '\u200B'  # delimiter


def encode(sig: str) -> str:
    bits = ''.join(format(b, '08b') for b in sig.encode('utf-8'))
    body = ''.join(ZWJ if b == '1' else ZWNJ for b in bits)
    return ZWSP + body + ZWSP


def decode(text: str) -> str:
    zw = ''.join(ch for ch in text if ch in (ZWNJ, ZWJ, ZWSP))
    zw = zw.strip(ZWSP)
    bits = ''.join('1' if ch == ZWJ else '0' for ch in zw)
    byte_chunks = [bits[i:i + 8] for i in range(0, len(bits), 8)]
    byte_vals = bytes(int(b, 2) for b in byte_chunks if len(b) == 8)
    return byte_vals.decode('utf-8', errors='replace')


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python Verify-GhostMark.py <pfad-zur-datei.md>")
        sys.exit(1)

    path = sys.argv[1]
    with open(path, encoding="utf-8") as f:
        text = f.read()

    result = decode(text)
    if result.startswith("fu75ch1|"):
        print(f"[OK] Ghost Mark gefunden: {result}")
    else:
        print(f"[WARN] Kein gueltiger fu75ch1-Ghost-Mark gefunden. Rohdecodierung: {result!r}")
