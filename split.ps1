$htmlPath = "C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\index.html"
$outDir = "C:\Users\Jenn1817\Downloads\digit_crru_frontend"
if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$lines = Get-Content $htmlPath -Encoding UTF8
$css = @()
$js = @()
$newHtml = @()

$inStyle = $false
$inScript = $false

foreach ($line in $lines) {
    if ($line -match "<style>") {
        $inStyle = $true
        $newHtml += '<link rel="stylesheet" href="styles.css">'
        continue
    }
    if ($line -match "</style>") {
        $inStyle = $false
        continue
    }
    if ($line -match "<script>" -and $line -notmatch "src=") {
        $inScript = $true
        $newHtml += '<script src="app.js"></script>'
        continue
    }
    if ($inScript -and $line -match "</script>") {
        $inScript = $false
        continue
    }
    
    if ($inStyle) {
        $css += $line
    } elseif ($inScript) {
        $js += $line
    } else {
        $newHtml += $line
    }
}

Set-Content -Path "$outDir\styles.css" -Value ($css -join "`n") -Encoding UTF8
Set-Content -Path "$outDir\app.js" -Value ($js -join "`n") -Encoding UTF8
Set-Content -Path "$outDir\index.html" -Value ($newHtml -join "`n") -Encoding UTF8
Write-Host "Done"
