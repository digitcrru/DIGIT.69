$backupDir = 'C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru'
$dir = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend'
$html = Get-Content "$backupDir\index.html" -Encoding UTF8 -Raw
$html = $html -replace '<script src="app[^>]*></script>', '<script src="app_v5.js"></script>'
$utf8BOM = New-Object System.Text.UTF8Encoding($true)
[System.IO.File]::WriteAllText("$dir\index.html", $html, $utf8BOM)
