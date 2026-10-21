# Installs the pisa binary from the latest (or a given) release of github.com/Arcware-io/pisa on
# Windows: picks the file for this CPU, downloads it, puts it into a directory and adds that
# directory to your user PATH. No login needed.
#
#   .\install.ps1 [-Version vX.Y.Z] [-Dir <directory>]
#
# -Version  release tag to install (default: the latest release)
# -Dir      where to put pisa.exe (default: $HOME\bin)
#
# If scripts are blocked: powershell -ExecutionPolicy Bypass -File .\install.ps1
param(
    [string]$Version = "",
    [string]$Dir = (Join-Path $HOME "bin")
)
$ErrorActionPreference = "Stop"

$repo = "Arcware-io/pisa"
$arch = switch ($env:PROCESSOR_ARCHITECTURE) {
    "ARM64" { "arm64" }
    "AMD64" { "x64" }
    default { Write-Error "Unsupported CPU: $($env:PROCESSOR_ARCHITECTURE)" }
}
$asset = "pisa-windows-$arch.exe"
$url = if ($Version) { "https://github.com/$repo/releases/download/$Version/$asset" } else { "https://github.com/$repo/releases/latest/download/$asset" }
$target = Join-Path $Dir "pisa.exe"

Write-Host "==> $asset $(if ($Version) { $Version } else { '(latest release)' })"
New-Item -ItemType Directory -Path $Dir -Force | Out-Null
Invoke-WebRequest -Uri $url -OutFile $target
Unblock-File -Path $target -ErrorAction SilentlyContinue

Write-Host "==> installed $target"
& $target --version

# Add the directory to the user PATH (not the machine PATH, no admin rights needed).
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
$entries = if ($userPath) { $userPath -split ";" | Where-Object { $_ } } else { @() }
if ($entries -notcontains $Dir) {
    [Environment]::SetEnvironmentVariable("Path", (($entries + $Dir) -join ";"), "User")
    Write-Host "Note: added $Dir to your user PATH. Open a new terminal for it to take effect."
}
