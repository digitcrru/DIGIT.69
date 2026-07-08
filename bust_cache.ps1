$c = Get-Content 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html' -Encoding UTF8 -Raw
$c = $c -replace '<script src="app.js(\?v=\d+)?"></script>', '<script src="app.js?v=fixed2"></script>'
$utf8BOM = New-Object System.Text.UTF8Encoding($true)
[System.IO.File]::WriteAllText('C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html', $c, $utf8BOM)
