#Requires -RunAsAdministrator
<#
.SYNOPSIS
    fu75ch1 Advanced Configs -- IPv6 auf physischen Adaptern deaktivieren.
    Teil von "fu75ch1 Advanced Configs" (Produkt 3, EUR 12).

.DESCRIPTION
    Die meisten VPN-Clients (inkl. WireGuard) tunneln primaer IPv4. Ohne
    IPv6-Deaktivierung kann Traffic am Tunnel vorbei ueber IPv6 leaken.
    Deaktiviert IPv6 gezielt auf physischen Netzwerkadaptern (nicht auf
    virtuellen/VPN-Adaptern, die brauchen ggf. ihr eigenes Verhalten).

.NOTES
    Keine Variablen anzupassen -- laeuft automatisch gegen alle physischen
    Adapter. Bei Bedarf $ExcludeAdapters erweitern (z.B. VirtualBox-Adapter,
    die laut Fehlerchronologie das VPN-Routing stoeren koennen, wenn IPv6
    dort aus Versehen mitbehandelt wird).
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    throw "Dieses Skript benoetigt Administrator-Rechte. Bitte PowerShell als Admin neu starten."
}

Write-Host "=== fu75ch1 IPv6 Leak Prevention ===" -ForegroundColor Cyan

# Nur physische Adapter (Ethernet/WLAN), keine virtuellen VPN-/Docker-/VirtualBox-Adapter
$physicalAdapters = Get-NetAdapter | Where-Object {
    $_.Status -eq 'Up' -and
    $_.InterfaceDescription -notmatch 'WireGuard|VirtualBox|VMware|Docker|Loopback|TAP'
}

if (-not $physicalAdapters) {
    Write-Warning "Keine aktiven physischen Adapter gefunden -- nichts zu tun."
    return
}

foreach ($adapter in $physicalAdapters) {
    Write-Host "Deaktiviere IPv6 auf: $($adapter.Name) ($($adapter.InterfaceDescription))"
    Disable-NetAdapterBinding -Name $adapter.Name -ComponentID ms_tcpip6 -ErrorAction SilentlyContinue
}

# --- Verifikation ---
Write-Host ""
Write-Host "Verifikation:" -ForegroundColor Cyan
foreach ($adapter in $physicalAdapters) {
    $binding = Get-NetAdapterBinding -Name $adapter.Name -ComponentID ms_tcpip6 -ErrorAction SilentlyContinue
    $status = if ($binding -and -not $binding.Enabled) { "[OK] deaktiviert" } else { "[WARN] noch aktiv" }
    Write-Host "  $($adapter.Name): $status"
}

Write-Host ""
Write-Host "Rueckgaengig machen (einzelner Adapter):" -ForegroundColor Yellow
Write-Host '  Enable-NetAdapterBinding -Name "<AdapterName>" -ComponentID ms_tcpip6' -ForegroundColor Yellow
