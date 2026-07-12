<#
.SYNOPSIS
    fu75ch1 Security Lab - toolchain verifier.

.DESCRIPTION
    Confirms every pinned tool across both tracks is actually present at the expected
    version. This exists because of error #108: a check that returns "OK" without
    proving anything is worse than no check. Every line below verifies a real,
    observable fact (a version string, a running container), not an exit code.

    Read-only. Makes no changes. Safe to run anytime.

.PARAMETER ToolsRoot
    Where portable RE tools were installed. Default: C:\lab-tools

.EXAMPLE
    pwsh -File Verify-LabSetup.ps1
#>
[CmdletBinding()]
param(
    [string]$ToolsRoot = 'C:\lab-tools'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$expected = @{
    garak     = '0.15.1'
    promptfoo = '0.121.17'
    pyrit     = '0.14.0'
    jadx      = '1.5.5'
    ghidra    = '12.1.2'
    frida     = '17.15.0'
    binwalk   = '2.3.3'
}

$results = New-Object System.Collections.Generic.List[object]
function Add-Result { param($Tool,$Track,$Found,$Ok)
    $results.Add([pscustomobject]@{ Tool=$Tool; Track=$Track; Expected=$expected[$Tool]; Found=$Found; Status=$(if($Ok){'PASS'}else{'CHECK'}) })
}

function Test-CommandExists { param($n) [bool](Get-Command $n -ErrorAction SilentlyContinue) }

# --- AI Red-Team track (via docker image) ---
if (Test-CommandExists 'docker') {
    $img = (docker images --format '{{.Repository}}:{{.Tag}}' 2>$null) -join "`n"
    if ($img -match 'fu75ch1-airt:1\.0') {
        # Query versions from inside the image (proves the tools import/run, not just exist)
        $g = (docker run --rm fu75ch1-airt:1.0 sh -lc "python -c 'import garak; print(garak.__version__)'" 2>$null | Select-Object -Last 1)
        Add-Result 'garak' 'AI-RT' $g ($g -eq $expected.garak)
        $p = (docker run --rm fu75ch1-airt:1.0 sh -lc "promptfoo --version" 2>$null | Select-Object -Last 1)
        Add-Result 'promptfoo' 'AI-RT' $p ($p -eq $expected.promptfoo)
        $y = (docker run --rm fu75ch1-airt:1.0 sh -lc "python -c 'import pyrit,sys; print(getattr(pyrit,\"__version__\",\"?\"))'" 2>$null | Select-Object -Last 1)
        Add-Result 'pyrit' 'AI-RT' $y ($y -eq $expected.pyrit)
    } else {
        Add-Result 'garak' 'AI-RT' '(image not built)' $false
        Add-Result 'promptfoo' 'AI-RT' '(image not built)' $false
        Add-Result 'pyrit' 'AI-RT' '(image not built)' $false
    }
} else {
    Add-Result 'garak' 'AI-RT' '(docker not found)' $false
    Add-Result 'promptfoo' 'AI-RT' '(docker not found)' $false
    Add-Result 'pyrit' 'AI-RT' '(docker not found)' $false
}

# --- RE track ---
# Binwalk in WSL
if (Test-CommandExists 'wsl') {
    $bw = (wsl -e bash -lc "binwalk --help 2>/dev/null | grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+' | head -1" 2>$null)
    $bwClean = ($bw -replace 'v','').Trim()
    Add-Result 'binwalk' 'RE' $(if($bwClean){$bwClean}else{'(not found in WSL)'}) ($bwClean -eq $expected.binwalk)
} else {
    Add-Result 'binwalk' 'RE' '(wsl not found)' $false
}

# JADX / Ghidra portable presence
$jadx = Join-Path $ToolsRoot 'jadx-1.5.5'
Add-Result 'jadx' 'RE' $(if(Test-Path $jadx){'present'}else{'(missing)'}) (Test-Path $jadx)
$ghidra = Join-Path $ToolsRoot 'ghidra-12.1.2'
Add-Result 'ghidra' 'RE' $(if(Test-Path $ghidra){'present'}else{'(missing)'}) (Test-Path $ghidra)

# Frida (in any venv on PATH)
if (Test-CommandExists 'frida') {
    $fv = (frida --version 2>$null).Trim()
    Add-Result 'frida' 'RE' $fv ($fv -eq $expected.frida)
} else {
    Add-Result 'frida' 'RE' '(not on PATH - activate your RE venv)' $false
}

# --- report ---
Write-Host ''
Write-Host '=== fu75ch1 Security Lab :: verification ==='
$results | Format-Table Track,Tool,Expected,Found,Status -AutoSize | Out-String | Write-Host

$pass = @($results | Where-Object Status -eq 'PASS').Count
$total = $results.Count
Write-Host ("Verified: {0}/{1}" -f $pass,$total)
if ($pass -lt $total) {
    Write-Host "Not all tools verified. This is a real finding, not a warning to ignore -" -ForegroundColor Yellow
    Write-Host "re-run the relevant provisioner, or activate the venv/build the image, then verify again." -ForegroundColor Yellow
} else {
    Write-Host "Full toolchain present at pinned versions. Proceed to modules/." -ForegroundColor Green
}
