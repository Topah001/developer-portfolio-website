$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$html = Get-Content -Raw (Join-Path $root 'index.html')
$css = Get-Content -Raw (Join-Path $root 'styles.css')
$js = Get-Content -Raw (Join-Path $root 'script.js')
foreach ($required in @('id="projects"', 'id="contact"', 'EXAMPLE ONLY', 'replace-with-your-email@example.com')) { if ($html -notlike "*$required*") { throw "Missing HTML marker: $required" } }
if ($html -notmatch 'styles\.css' -or $html -notmatch 'script\.js') { throw 'Stylesheet or script is not linked.' }
if ($css -notmatch '@media\(max-width:700px\)' -or $js -notmatch 'aria-expanded') { throw 'Responsive layout or accessible menu behavior is missing.' }
Write-Output 'Portfolio smoke checks passed.'
