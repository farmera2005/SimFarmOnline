<#
One-time setup for the SimFarm native Windows launcher.

Finds an existing DOSBox install, or installs one via winget if needed,
then creates a "SimFarm" shortcut on the Desktop that runs
"Play SimFarm.bat". After this runs once, just double-click that
shortcut to play - no browser, no manual DOSBox commands.
#>

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path

function Find-DosBox {
    $cmd = Get-Command dosbox.exe -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }

    $candidates = @(
        "$env:ProgramFiles\DOSBox-Staging\dosbox.exe",
        "${env:ProgramFiles(x86)}\DOSBox-Staging\dosbox.exe",
        "$env:ProgramFiles\DOSBox-0.74-3\dosbox.exe",
        "${env:ProgramFiles(x86)}\DOSBox-0.74-3\dosbox.exe",
        "$env:ProgramFiles\DOSBox\dosbox.exe",
        "${env:ProgramFiles(x86)}\DOSBox\dosbox.exe"
    )
    foreach ($c in $candidates) {
        if (Test-Path $c) { return $c }
    }
    return $null
}

$dosbox = Find-DosBox

if (-not $dosbox) {
    $winget = Get-Command winget.exe -ErrorAction SilentlyContinue
    if ($winget) {
        Write-Host "DOSBox not found - attempting to install it via winget..."
        $candidateIds = @("DOSBox-Staging.DOSBox-Staging", "DOSBox.DOSBox")
        foreach ($id in $candidateIds) {
            winget install --id $id -e --accept-source-agreements --accept-package-agreements
            if ($LASTEXITCODE -eq 0) { break }
        }
        $dosbox = Find-DosBox
    } else {
        Write-Warning "winget is not available on this PC."
    }
}

if (-not $dosbox) {
    Write-Warning "Could not find or automatically install DOSBox."
    Write-Host ""
    Write-Host "Install it manually, then re-run this script:"
    Write-Host "  https://www.dosbox.com/download.php"
    Write-Host "  (or the actively maintained fork: https://dosbox-staging.github.io/)"
    exit 1
}

Write-Host "Using DOSBox at: $dosbox"

$desktop = [Environment]::GetFolderPath("Desktop")
$shortcutPath = Join-Path $desktop "SimFarm.lnk"
$wsh = New-Object -ComObject WScript.Shell
$shortcut = $wsh.CreateShortcut($shortcutPath)
$shortcut.TargetPath = Join-Path $root "Play SimFarm.bat"
$shortcut.WorkingDirectory = $root
$shortcut.IconLocation = "$dosbox,0"
$shortcut.Description = "SimFarm (1993)"
$shortcut.Save()

Write-Host ""
Write-Host "Done. A 'SimFarm' shortcut was created on your Desktop."
Write-Host "Double-click it any time to play."
