# Renders og\og-image.html to og-image.png (1200x630) with headless Chrome or Edge.
$ErrorActionPreference = 'Stop'
$site = Split-Path -Parent $PSScriptRoot
$browser = @('C:\Program Files\Google\Chrome\Application\chrome.exe',
             'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe') | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $browser) { throw 'Chrome or Edge not found' }
$src = 'file:///' + ((Join-Path $PSScriptRoot 'og-image.html') -replace '\\', '/')
$out = Join-Path $site 'og-image.png'
# Chrome reports "N bytes written" on stderr: not an error.
$ErrorActionPreference = 'Continue'
& $browser --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 `
  --window-size=1200,630 "--screenshot=$out" $src 2>$null | Out-Null
$ErrorActionPreference = 'Stop'
Start-Sleep 2
if (-not (Test-Path $out)) { throw 'Render failed' }
Write-Host "Wrote $out"
