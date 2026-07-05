#Requires -Version 7.0
<#
.SYNOPSIS
    Invoke-OpSecQuickCheck.ps1 v1.0 — free 5-check security snapshot (fu75ch1)
.DESCRIPTION
    A free, read-only mini version of the fu75ch1 OpSec Audit.
    5 checks in under 10 seconds:
      1. VPN adapter up
      2. Windows Firewall enabled on all profiles
      3. Telemetry service (DiagTrack) not running
      4. SMBv1 disabled
      5. DNS-over-HTTPS configured on at least one resolver

    No data leaves your machine. No PII in the output. Safe to run repeatedly.

    The full version — Invoke-OpSecAudit.ps1, 34 checks across 6 categories
    (VPN/Network, System Security, Hardening, Tools/AppSec, AI Stack,
    Anti-Tracking) — is available at https://fu75ch1.gumroad.com (€7).
.NOTES
    © fu75ch1 — CC BY-NC 4.0 — free to share with attribution.
    Read-only: this script changes NOTHING on your system.
.EXAMPLE
    pwsh -File .\Invoke-OpSecQuickCheck.ps1
    pwsh -File .\Invoke-OpSecQuickCheck.ps1 -VpnAdapterPattern '*Wintun*'
#>
param(
    # Adjust if your VPN adapter has a different name (e.g. '*NordLynx*', '*Wintun*')
    [string]$VpnAdapterPattern = '*Mullvad*|*WireGuard*|*OpenVPN*|*Wintun*'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$score = 0
$total = 5

function Write-Check {
    param([bool]$Ok, [string]$Text, [string]$Hint)
    if ($Ok) {
        Write-Host "[OK] $Text" -ForegroundColor Green
        return 1
    }
    Write-Host "[X]  $Text" -ForegroundColor Red
    if ($Hint) { Write-Host "     -> $Hint" -ForegroundColor DarkGray }
    return 0
}

Write-Host ""
Write-Host "=== fu75ch1 OpSec QuickCheck (5 of 34) ===" -ForegroundColor Cyan
Write-Host "Read-only. Nothing is changed, nothing is transmitted." -ForegroundColor DarkGray
Write-Host ""

# --- 1. VPN adapter up ---
$vpnUp = $false
try {
    $patterns = $VpnAdapterPattern -split '\|'
    foreach ($p in $patterns) {
        if (@(Get-NetAdapter -ErrorAction SilentlyContinue |
              Where-Object { $_.Status -eq 'Up' -and ($_.Name -like $p -or $_.InterfaceDescription -like $p) }).Count -gt 0) {
            $vpnUp = $true; break
        }
    }
} catch { $vpnUp = $false }
$score += Write-Check $vpnUp 'Check 1: VPN adapter active' `
    'No active VPN adapter matched. If your adapter has another name, pass -VpnAdapterPattern.'

# --- 2. Firewall all profiles ---
$fwOk = $false
try {
    $profiles = @(Get-NetFirewallProfile)
    $fwOk = (@($profiles | Where-Object { -not $_.Enabled }).Count -eq 0) -and ($profiles.Count -ge 3)
} catch { $fwOk = $false }
$score += Write-Check $fwOk 'Check 2: Firewall enabled (Domain/Private/Public)' `
    'At least one firewall profile is disabled: Set-NetFirewallProfile -All -Enabled True'

# --- 3. Telemetry service (DiagTrack) ---
$telOk = $false
try {
    $svc = Get-Service -Name 'DiagTrack' -ErrorAction SilentlyContinue
    $telOk = ($null -eq $svc) -or ($svc.Status -ne 'Running')
} catch { $telOk = $true }
$score += Write-Check $telOk 'Check 3: Telemetry service (DiagTrack) not running' `
    'Connected User Experiences and Telemetry is running. Full guide: fu75ch1 Windows Hardening.'

# --- 4. SMBv1 disabled ---
$smbOk = $false
try {
    $smb = Get-SmbServerConfiguration -ErrorAction SilentlyContinue
    $smbOk = ($null -ne $smb) -and (-not $smb.EnableSMB1Protocol)
} catch { $smbOk = $false }
$score += Write-Check $smbOk 'Check 4: SMBv1 disabled' `
    'Legacy SMBv1 is enabled — a known ransomware vector: Set-SmbServerConfiguration -EnableSMB1Protocol $false'

# --- 5. DNS-over-HTTPS configured ---
$dohOk = $false
try {
    $dohOk = @(Get-DnsClientDohServerAddress -ErrorAction SilentlyContinue).Count -gt 0
} catch { $dohOk = $false }
$score += Write-Check $dohOk 'Check 5: DNS-over-HTTPS resolver configured' `
    'No DoH resolver registered — your DNS queries travel in plaintext. Full guide: fu75ch1 DNS/VPN Guide.'

# --- Result ---
Write-Host ""
$pct = [math]::Round(($score / $total) * 100)
$color = if ($score -eq $total) { 'Green' } elseif ($score -ge 3) { 'Yellow' } else { 'Red' }
Write-Host "QuickCheck Score: $score/$total ($pct%)" -ForegroundColor $color
Write-Host ""
Write-Host "This was 5 of 34 checks. The full audit covers VPN kill-switch, IPv6 leaks," -ForegroundColor DarkGray
Write-Host "BitLocker, LSASS protection, MAC randomization, AI-stack security and more:" -ForegroundColor DarkGray
Write-Host "-> https://fu75ch1.gumroad.com  |  free repo: github.com/0xWrt/fu75ch1-OS" -ForegroundColor Cyan
Write-Host ""
