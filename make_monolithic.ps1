$dir = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend'
$html = Get-Content "$dir\index.html" -Encoding UTF8 -Raw
$js = Get-Content "$dir\app_v5.js" -Encoding UTF8 -Raw
$css = Get-Content "$dir\styles.css" -Encoding UTF8 -Raw -ErrorAction SilentlyContinue

# If CSS exists, inject it before </head>
if ($css) {
    $html = $html -replace '</head>', "<style>`n$css`n</style>`n</head>"
}

# Inject JS before </body>, and remove the external script tags
$html = $html -replace '<script src="app[^>]+></script>', ''
$html = $html -replace '</body>', "<script>`n$js`n</script>`n</body>"

$utf8BOM = New-Object System.Text.UTF8Encoding($true)
$outPath = "$dir\digit_crru_perfect.html"
[System.IO.File]::WriteAllText($outPath, $html, $utf8BOM)
Write-Host "Created single file at $outPath"
