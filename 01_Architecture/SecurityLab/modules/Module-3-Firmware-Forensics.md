---
title: "Module 3 - Firmware Forensics (Binwalk)"
tags: [security-lab, module, firmware, binwalk, hardware, forensics]
status: complete
---

# Module 3 - Firmware Forensics​‌‍‍‌‌‍‍‌‌‍‍‍‌‍‌‍‌‌‍‍‌‍‍‍‌‌‍‍‌‍‌‍‌‍‍‌‌‌‍‍‌‍‍‌‍‌‌‌‌‌‍‍‌‌‌‍‌‍‍‍‍‍‌‌‌‍‍‍‌‌‍‍‌‍‍‌‌‍‌‍‌‍‍‌‌‌‍‍‌‍‍‍‌‍‌‍‌‍‍‍‌‌‍‌‌‍‍‌‍‌‌‍‌‍‍‍‌‍‌‌‌‍‍‍‍‌‌‍‌‌‍‌‍‍‌‍‌‍‍‌‍‍‌‌‌‍‍‌‌‌‌‍‌‍‍‌‌‌‍‌‌‍‍‍‍‍‌‌‌‍‌‌‌‌‍‍‌‍‌‌‌‌‍‍‌‌‍‌‍‍‌‍‌‍‌‌‌‌‍‌‌‍‌‍‍‌‌‍‌‌‍‌‍‍‌‍‌‍‌‌‍‍‍‌‌‍‌‌‌‌‍‍‌‌‍‌‍‍‌‍‌‌‍‍‌‍‌‌‌‌‍‌‍‍‍‌‌‌‍‍‌‌‌‌‌‍‍‍‍‍‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‌‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‍‍‌‌‌‍‌‍‍‌‍‌‌‍‍‌‌‌‌‌‌‍‍‌‍‍‍‌‌‍‌‍‍‌‍‌‌‍‍‌‌‌‍‌‌‍‍‌‌‌‍​

**Goal:** take a firmware image for a device **you own** (or an image published for open
analysis), extract its filesystem, find embedded secrets, and reason about what the
device actually does at boot. By the end you can go from an opaque `.bin` to a mounted,
readable root filesystem and a list of concrete findings.

**Prerequisite:** Module 1. Work happens inside a disposable WSL2 distro, offline.

**Legal targets only.** Firmware for hardware **you own**, or vendor images explicitly
published for analysis. Do not read out, modify, or redistribute firmware in ways that
violate a device's license or local law. This is the same posture the fu75ch1 project
uses on its own hardware (it hardened its own router; it did not touch anyone else's).
See `SAFETY-and-LEGAL.md`.

> **Honesty note (3.3):** hardware read-out (pulling firmware off a chip with a
> programmer) is taught here as **concept and workflow, not a shipped bench demo.** The
> project's own hardware read-out chain (Flashrom / CH341A) is marked *pending* - so this
> module teaches the method and the risks, and says plainly where the hands-on stops.

**Time:** ~75-90 min.

---

## 3.1 Concept: a firmware image is a container you don't have the manifest for

Router, camera, and IoT firmware is usually a single blob that packs a bootloader, one or
more filesystems, a kernel, and config - with no index telling you where each begins. The
forensics loop:

1. **Identify** - scan for known signatures and read the entropy profile.
2. **Extract** - carve out the filesystem(s) and unpack them.
3. **Inspect** - mount read-only and hunt for what matters.

Entropy is your first map. High, flat entropy (~8 bits/byte) means compressed or encrypted
data; low, structured entropy means plaintext (config, scripts, strings). A sudden entropy
cliff often marks a boundary between sections - exactly where a packed filesystem starts.

## 3.2 Lab: extraction with Binwalk (pinned 2.3.3, in WSL2)

All inside a disposable WSL2 distro (Module 1), offline:

1. **Signature scan** - what's in the blob and where:
   ```
   binwalk firmware.bin
   ```
   Read the offset table: uImage/kernel, SquashFS/JFFS2/CramFS filesystems, gzip/LZMA
   regions. Note the offsets; they're your carving coordinates.

2. **Entropy scan** - confirm section boundaries:
   ```
   binwalk -E firmware.bin
   ```
   Match the entropy cliffs against the signature offsets. Agreement between the two is
   your evidence that you've correctly located a filesystem, not guessed.

3. **Extract and unpack**:
   ```
   binwalk -e --run-as=root firmware.bin
   ```
   Binwalk carves recognized sections into `_firmware.bin.extracted/`. For a SquashFS root:
   ```
   # unsquashfs the carved fs, then inspect the tree read-only
   unsquashfs -d rootfs <path-to-squashfs>
   ```

**Checkpoint:** you have an unpacked root filesystem tree on disk and can explain, from
the signature + entropy agreement, why you trust it's the real root fs and not a
misidentified region.

## 3.3 Lab: finding what matters

Now hunt, same instinct as Module 2's string search - but across a whole OS image:

- **Credentials & keys** - `grep -rIn` for `password`, `passwd`, private-key headers
  (`-----BEGIN`), API tokens, `authorized_keys`. Check `/etc/shadow`, `/etc/passwd`.
- **Endpoints & backdoors** - hardcoded IPs/URLs, undocumented services, debug shells,
  telnet/SSH enabled at boot.
- **Boot behavior** - read `/etc/init.d/`, `rcS`, systemd units: what starts, in what
  order, with what privileges. This tells you the device's real attack surface.
- **Versions** - identify the kernel, busybox, and library versions; map them to known
  CVEs to understand exposure.

**Data hygiene:** anything you extract (a key, a config, a private URL) is sensitive by
default. If you write it up, scrub identifiers. Your findings, not the raw secrets, are
what leave the lab.

**Checkpoint:** a findings list - each item with its file path in the image as evidence.

## 3.4 Hardware read-out - concept and workflow (not a shipped demo)

Sometimes there's no firmware download and you have to read it off the chip. Conceptually:

- **Identify** the SPI flash chip (package markings, datasheet).
- **Connect** a programmer (e.g. CH341A) to the chip - in-circuit with a clip, or desoldered.
- **Dump** the flash with Flashrom, then feed the dump back into 3.1-3.3.

**Why this stops at concept here:** a real read-out needs the physical rig, a chip you own,
and carries real risk - bricking the device, voiding warranty, and legal limits on what you
may do to hardware. The fu75ch1 project marks its own read-out chain *pending* rather than
claim a capability it hasn't bench-verified, and this module holds the same line. You get
the workflow, the tool names, and the risk list - not a pretend "we pulled the chip."

If you have the hardware and the right: do it isolated, dump twice and compare for a clean
read, and treat the dump as an untrusted artifact when you bring it back into the software
loop.

## Exercise

1. On an openly-published analysis image, run `binwalk` and `binwalk -E`. Write one
   sentence explaining how the entropy graph corroborates the signature offsets.
2. Extract and unpack the root filesystem.
3. Produce a findings list of at least three items (credential, endpoint, or boot-behavior),
   each with its path in the image. Scrub before saving.
4. Identify one version-able component (kernel/busybox/library) and note whether it maps to
   a known CVE. State how you'd verify exposure without assuming.

## Takeaway

Firmware isn't magic; it's a container you learn to read. Entropy plus signatures locate
the pieces, extraction opens them, and disciplined hunting surfaces what the vendor didn't
mean to ship. The honest analyst also knows where the hands-on stops - hardware read-out is
a real capability with real risk, and pretending to a bench demo you haven't run is just
another unverified claim.

---

Next: `Module-5-Capstone.md` - combine this with Modules 2 and 4 to extract an embedded
prompt and red-team it end to end.
