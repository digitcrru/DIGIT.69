$html = Get-Content -Path 'C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\index.html' -Raw -Encoding UTF8
$css = Get-Content -Path 'C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\styles.css' -Raw -Encoding UTF8
$js = Get-Content -Path 'C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\app.js' -Raw -Encoding UTF8

$html = $html -replace '(?s)<link rel="stylesheet" href="styles\.css">', "<style>`n$css`n</style>"
$html = $html -replace '(?s)<script src="app\.js"></script>', "<script>`n$js`n</script>"
$html = $html -replace '<link rel="manifest" href="manifest\.json">', ''
$html = $html -replace '(?s)<script>\s*if\s*\(''serviceWorker''\s*in\s*navigator\).*?</script>', ''

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText('C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\index.html', $html, $utf8NoBom)
Write-Host "Files combined successfully."
