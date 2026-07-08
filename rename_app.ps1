Rename-Item -Path 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js' -NewName 'app_v5.js' -Force -ErrorAction SilentlyContinue
$html = Get-Content 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html' -Encoding UTF8 -Raw
$html = $html -replace '<script src="app.js\?v=fixed4"></script>', '<script src="app_v5.js"></script>'
$html = $html -replace '<script src="app.js\?v=fixed3"></script>', '<script src="app_v5.js"></script>'
$html = $html -replace '<script src="app.js"></script>', '<script src="app_v5.js"></script>'
$utf8BOM = New-Object System.Text.UTF8Encoding($true)
[System.IO.File]::WriteAllText('C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html', $html, $utf8BOM)
