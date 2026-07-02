#Requires -RunAsAdministrator
<#
.SYNOPSIS
    fu75ch1 Advanced Configs -- WireGuard Kill-Switch via Windows Firewall.
    Teil von "fu75ch1 Advanced Configs" (Produkt 3, EUR 12).

.DESCRIPTION
    Blockiert jeglichen ausgehenden Traffic, sobald die WireGuard-Verbindung
    abbricht -- kein Leak ausserhalb des Tunnels moeglich. Idempotent: kann
    mehrfach ausgefuehrt werden, ohne doppelte Regeln zu erzeugen.

.NOTES
    Eine Variable zum Anpassen: $WireGuardInterfaceAlias -- der Name deines
    WireGuard-Adapters in Windows (Standard meist "WireGuard" oder der
    Tunnel-Name aus der WireGuard-App). Pruefen mit:
        Get-NetAdapter | Where-Object { $_.InterfaceDescription -match 'WireGuard' }
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# --- ANPASSEN: Name deines WireGuard-Netzwerkadapters ---
$WireGuardInterfaceAlias = "WireGuard"

# --- Admin-Check (immer zuerst) ---
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    throw "Dieses Skript benoetigt Administrator-Rechte. Bitte PowerShell als Admin neu starten."
}

$ruleBlockAll   = "fu75ch1-KillSwitch-BlockAllOutbound"
$ruleAllowVPN   = "fu75ch1-KillSwitch-AllowWireGuardOutbound"

Write-Host "=== fu75ch1 WireGuard Kill-Switch Setup ===" -ForegroundColor Cyan

# --- Idempotenz: alte Regeln entfernen, falls vorhanden ---
Get-NetFirewallRule -DisplayName $ruleBlockAll -ErrorAction SilentlyContinue | Remove-NetFirewallRule
Get-NetFirewallRule -DisplayName $ruleAllowVPN -ErrorAction SilentlyContinue | Remove-NetFirewallRule

# --- Regel 1: Allen ausgehenden Traffic blockieren (niedrigste Prioritaet) ---
New-NetFirewallRule `
    -DisplayName $ruleBlockAll `
    -Direction Outbound `
    -Action Block `
    -Enabled True `
    -Profile Any `
    -Description "fu75ch1 Kill-Switch: blockiert allen ausgehenden Traffic ausserhalb des VPN-Tunnels" | Out-Null

# --- Regel 2: Traffic ueber den WireGuard-Adapter explizit erlauben (hoehere Prioritaet) ---
New-NetFirewallRule `
    -DisplayName $ruleAllowVPN `
    -Direction Outbound `
    -Action Allow `
    -InterfaceAlias $WireGuardInterfaceAlias `
    -Enabled True `
    -Profile Any `
    -Description "fu75ch1 Kill-Switch: erlaubt Traffic ausschliesslich ueber den WireGuard-Tunnel" | Out-Null

Write-Host "Kill-Switch-Regeln erstellt." -ForegroundColor Green

# --- Verifikation (jeder Block endet mit Verifikation) ---
$blockRule = Get-NetFirewallRule -DisplayName $ruleBlockAll -ErrorAction SilentlyContinue
$allowRule = Get-NetFirewallRule -DisplayName $ruleAllowVPN -ErrorAction SilentlyContinue

if ($blockRule -and $allowRule -and $blockRule.Enabled -eq 'True' -and $allowRule.Enabled -eq 'True') {
    Write-Host "[OK] Kill-Switch aktiv: Traffic ausserhalb von '$WireGuardInterfaceAlias' wird blockiert." -ForegroundColor Green
} else {
    Write-Warning "[WARN] Verifikation fehlgeschlagen -- Regeln pruefen: Get-NetFirewallRule -DisplayName 'fu75ch1-KillSwitch-*'"
}

Write-Host ""
Write-Host "Test: VPN trennen, dann pruefen ob z.B. 'ping 1.1.1.1' blockiert wird." -ForegroundColor Yellow
Write-Host "Rueckgaengig machen:" -ForegroundColor Yellow
Write-Host "  Get-NetFirewallRule -DisplayName 'fu75ch1-KillSwitch-*' | Remove-NetFirewallRule" -ForegroundColor Yellow
