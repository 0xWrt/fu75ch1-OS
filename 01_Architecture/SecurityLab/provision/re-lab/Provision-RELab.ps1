<#
.SYNOPSIS
    fu75ch1 Security Lab - reverse-engineering environment provisioner.

.DESCRIPTION
    Idempotent setup for the RE track: WSL2 + Binwalk (firmware), and pinned Windows
    tooling (JADX, Ghidra) fetched from official sources with hash verification.

    Follows fu75ch1 script conventions:
      - Set-StrictMode + Stop
      - DRY-RUN by default; -Apply to make changes
      - idempotent (a second run on a finished machine changes nothing)
      - no destructive action without an explicit check
      - honest [OK]/[WARN]/[..] output, never a silent pass

    This script installs TOOLS. It never touches analysis targets and never needs a
    key or credential. Run it on your workstation (or inside a VM you keep for RE),
    then do untrusted-binary work inside Windows Sandbox (RE-Sandbox.wsb).

.PARAMETER Apply
    Actually perform installs. Without it, the script only reports what it would do.

.PARAMETER ToolsRoot
    Where portable tools (JADX, Ghidra) get placed. Default: C:\lab-tools

.EXAMPLE
    pwsh -File Provision-RELab.ps1              # dry run - shows the plan
    pwsh -File Provision-RELab.ps1 -Apply       # provisions

.NOTES
    Pinned versions live in $Tools below. Upgrading is a deliberate edit + re-verify,
    never a drift. Download URLs point at official vendor release channels; every
    download is hash-checked against the value you confirm from the vendor's own
    checksum file (the script prints the computed hash and refuses to proceed on
    mismatch). "Trust on first use" is not good enough for tooling - see error #113.
#>
[CmdletBinding()]
param(
    [switch]$Apply,
    [string]$ToolsRoot = 'C:\lab-tools'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# ---------------------------------------------------------------------------
# Pinned toolchain. SHA256 values are intentionally left as 'CONFIRM' - you
# paste the official published hash for your platform before -Apply. The script
# will NOT download-and-trust; it verifies against what you confirmed.
# ---------------------------------------------------------------------------
$Tools = @(
    [pscustomobject]@{
        Name    = 'JADX'
        Version = '1.5.5'
        Kind    = 'zip'
        Url     = 'https://github.com/skylot/jadx/releases/download/v1.5.5/jadx-1.5.5.zip'
        Sha256  = 'CONFIRM'   # from the release page's checksums before enabling
        Dest    = 'jadx-1.5.5'
    },
    [pscustomobject]@{
        Name    = 'Ghidra'
        Version = '12.1.2'
        Kind    = 'zip'
        Url     = 'https://github.com/NationalSecurityAgency/ghidra/releases'  # pick the 12.1.2 asset for your OS
        Sha256  = 'CONFIRM'
        Dest    = 'ghidra-12.1.2'
    }
)

function Write-Step { param([string]$m,[string]$tag='..') Write-Host ("[{0}] {1}" -f $tag,$m) }

function Test-CommandExists { param([string]$Name) [bool](Get-Command $Name -ErrorAction SilentlyContinue) }

# --- 1. WSL2 (Binwalk lives here; Linux tooling is cleaner for firmware) ---
function Ensure-WSL2 {
    if (Test-CommandExists 'wsl') {
        $status = (wsl --status) 2>&1 | Out-String
        Write-Step "WSL present." 'OK'
    } else {
        if ($Apply) {
            Write-Step "Installing WSL2 (reboot may be required)..." '..'
            wsl --install --no-launch
            Write-Step "WSL install invoked. Reboot, then re-run with -Apply." 'WARN'
        } else {
            Write-Step "WSL not present -> would run: wsl --install --no-launch" '..'
        }
    }
}

# --- 2. Binwalk inside the default WSL distro (idempotent apt) ---
function Ensure-Binwalk {
    if (-not (Test-CommandExists 'wsl')) { Write-Step "WSL missing; skipping Binwalk." 'WARN'; return }
    $check = (wsl -e bash -lc "command -v binwalk >/dev/null 2>&1 && binwalk --help >/dev/null 2>&1 && echo present || echo absent") 2>&1
    if ($check -match 'present') {
        Write-Step "Binwalk present in WSL." 'OK'
    } elseif ($Apply) {
        Write-Step "Installing Binwalk 2.3.3 deps in WSL..." '..'
        wsl -e bash -lc "sudo apt-get update && sudo apt-get install -y binwalk"
        $recheck = (wsl -e bash -lc "command -v binwalk >/dev/null 2>&1 && echo present || echo absent") 2>&1
        if ($recheck -match 'present') { Write-Step "Binwalk installed." 'OK' } else { Write-Step "Binwalk install did not verify - check apt output." 'WARN' }
    } else {
        Write-Step "Binwalk absent in WSL -> would apt-get install binwalk." '..'
    }
}

# --- 3. Portable Windows tools with hash-verified download ---
function Ensure-PortableTool {
    param([pscustomobject]$T)
    $target = Join-Path $ToolsRoot $T.Dest
    if (Test-Path $target) { Write-Step ("{0} {1} already at {2}" -f $T.Name,$T.Version,$target) 'OK'; return }

    if (-not $Apply) { Write-Step ("{0} {1} -> would download from {2} and verify SHA256" -f $T.Name,$T.Version,$T.Url) '..'; return }

    if ($T.Sha256 -eq 'CONFIRM') {
        Write-Step ("{0}: SHA256 not confirmed. Edit `$Tools with the official hash before -Apply. Skipping." -f $T.Name) 'WARN'
        return
    }

    if (-not (Test-Path $ToolsRoot)) { New-Item -ItemType Directory -Path $ToolsRoot -Force | Out-Null }
    $tmp = Join-Path $env:TEMP ("{0}-{1}.zip" -f $T.Name,$T.Version)
    Write-Step ("Downloading {0} {1}..." -f $T.Name,$T.Version) '..'
    Invoke-WebRequest -Uri $T.Url -OutFile $tmp

    $actual = (Get-FileHash $tmp -Algorithm SHA256).Hash
    if ($actual -ne $T.Sha256.ToUpper()) {
        Remove-Item $tmp -Force
        throw ("{0} hash MISMATCH. expected={1} got={2}. Download rejected." -f $T.Name,$T.Sha256,$actual)
    }
    Write-Step ("{0} hash verified." -f $T.Name) 'OK'
    Expand-Archive -Path $tmp -DestinationPath $target -Force
    Remove-Item $tmp -Force
    Write-Step ("{0} {1} installed to {2}" -f $T.Name,$T.Version,$target) 'OK'
}

# --- 4. Frida (Python side) - guidance only; it installs into your RE venv ---
function Show-FridaGuidance {
    Write-Step "Frida 17.15.0: install into a dedicated venv, not system Python:" '..'
    Write-Host '        python -m venv .re-venv; .re-venv\Scripts\Activate.ps1; pip install frida==17.15.0 frida-tools'
    Write-Step "Dynamic Frida work belongs inside Windows Sandbox (RE-Sandbox.wsb)." '..'
}

# --------------------------- run ---------------------------
Write-Host ''
Write-Host '=== fu75ch1 Security Lab :: RE provisioner ==='
Write-Host ("Mode: {0}" -f ($(if ($Apply) {'APPLY'} else {'DRY-RUN (use -Apply to change anything)'})))
Write-Host ("Tools root: {0}" -f $ToolsRoot)
Write-Host ''

Ensure-WSL2
Ensure-Binwalk
foreach ($t in $Tools) { Ensure-PortableTool -T $t }
Show-FridaGuidance

Write-Host ''
Write-Step "Done. Run Verify-LabSetup.ps1 to confirm the full toolchain." 'OK'
Write-Step "Reminder: analyze only targets you own or are authorized to test (SAFETY-and-LEGAL.md)." 'WARN'
