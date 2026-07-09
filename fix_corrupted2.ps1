$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
$text = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

# The corrupted lines have "NAV_STUDENT.push({ id: 'shirt'" and "NAV_STUDENT.push({ id: 'tracking'"
$pattern = "(?s)NAV_STUDENT\.push\(\{\s*id:\s*'shirt'.*?NAV_STUDENT\.push\(\{\s*id:\s*'tracking'.*?\}\);\s*"

$b64Replacement = "ICAgICAgICAgICAgICAgICAgICAgICAgTkFWX1NUVURFTlQucHVzaCh7IGlkOiAnc2hpcnQnLCBsYWJlbDogJ+C4quC4seC5iOC4h+C4iOC4reC4h+C5gOC4quC4t+C5ieC4rScsIHRhYkxhYmVsOiAn4Liq4Lix4LmI4LiH4LiI4Lit4LiHJywgaWNvbjogJ3BoLXQtc2hpcnQnIH0pOyAKICAgICAgICAgICAgICAgICAgICAgICAgTkFWX1NUVURFTlQucHVzaCh7IGlkOiAndHJhY2tpbmcnLCBsYWJlbDogJ+C4leC4tOC4lOC4leC4suC4oScsIHRhYkxhYmVsOiAn4LiV4Li04LiU4LiV4Liy4LihJywgaWNvbjogJ3BoLXRydWNrJyB9KTsg"
$replacement = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($b64Replacement))

$text = $text -replace $pattern, ($replacement + "`n")
[System.IO.File]::WriteAllText($file, $text, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Fixed corrupted bytes successfully!"
