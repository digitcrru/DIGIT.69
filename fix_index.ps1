$htmlFile = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\digit_crru_perfect.html'
$jsFile = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app_v5.js'
$outFile = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'

$htmlText = Get-Content $htmlFile -Encoding UTF8 -Raw
$jsText = Get-Content $jsFile -Encoding UTF8 -Raw

$idx = $htmlText.IndexOf("<!-- MAIN SCRIPT -->")
if ($idx -gt 0) {
    $cleanTop = $htmlText.Substring(0, $idx)
    $finalContent = $cleanTop + "<!-- MAIN SCRIPT -->`n<script>`n" + $jsText + "`n</script>`n</body>`n</html>"
    Set-Content $outFile $finalContent -Encoding UTF8
    Write-Host "Success: Cleaned and combined!"
} else {
    Write-Host "Error: MAIN SCRIPT marker not found"
}
