$ErrorActionPreference = "Stop"
$htmlPath = "C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\index.html"
$cssPath = "C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\styles.css"
$jsPath = "C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\app.js"

$content = Get-Content -Path $htmlPath -Raw

# Extract CSS
$cssPattern = '(?s)<style>(.*?)</style>'
if ($content -match $cssPattern) {
    $css = $matches[1].Trim()
    Set-Content -Path $cssPath -Value $css -Encoding UTF8
    $content = $content -replace $cssPattern, '<link rel="stylesheet" href="styles.css">'
}

# Extract JS
$jsPattern = '(?s)<script>\s*const GOOGLE_SCRIPT_URL(.*?)<\/script>'
if ($content -match $jsPattern) {
    $js = "const GOOGLE_SCRIPT_URL" + $matches[1]
    Set-Content -Path $jsPath -Value $js -Encoding UTF8
    $content = $content -replace $jsPattern, '<script src="app.js"></script>'
}

Set-Content -Path $htmlPath -Value $content -Encoding UTF8
Write-Host "Extraction completed successfully!"
