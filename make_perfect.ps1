$dir = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend'
$backupDir = 'C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru'

# Get the pristine index.html from backup
$html = Get-Content "$backupDir\index.html" -Encoding UTF8 -Raw

# Get the perfectly fixed JS
$js = Get-Content "$dir\app_v5.js" -Encoding UTF8 -Raw

# Get CSS if exists
$css = Get-Content "$dir\styles.css" -Encoding UTF8 -Raw -ErrorAction SilentlyContinue

# If CSS exists, inject it before </head>
if ($css) {
    $html = $html -replace '</head>', "<style>`n$css`n</style>`n</head>"
}

# Inject JS before </body>, and remove ANY external script tags pointing to app.js
$html = $html -replace '<script src="app[^>]*></script>', ''
$html = $html -replace '</body>', "<script>`n$js`n</script>`n</body>"

$utf8BOM = New-Object System.Text.UTF8Encoding($true)
$outPath = "$dir\digit_crru_perfect.html"
[System.IO.File]::WriteAllText($outPath, $html, $utf8BOM)

# Also restore the real index.html just in case
$htmlRestore = $html -replace "<script>`n$js`n</script>`n</body>", '</body>'
$htmlRestore = $htmlRestore -replace '</body>', "<script src=`"app_v5.js`"></script>`n</body>"
[System.IO.File]::WriteAllText("$dir\index.html", $htmlRestore, $utf8BOM)

Write-Host "Combined file created at $outPath"
