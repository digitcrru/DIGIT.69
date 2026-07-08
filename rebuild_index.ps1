$backupFile = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index_backup.html'
$jsFile = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app_v5.js'
$outFile = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'

$htmlText = Get-Content $backupFile -Encoding UTF8 -Raw
$jsText = Get-Content $jsFile -Encoding UTF8 -Raw

# 1. Remove HTML modal from the HTML part
$htmlText = $htmlText -replace '(?s)    <!-- Home Popup Modal -->.*?    <!-- Size Chart Modal -->', '    <!-- Size Chart Modal -->'

# 2. Extract just the HTML part before the JS
$idx = $htmlText.IndexOf("<!-- MAIN SCRIPT -->")
if ($idx -gt 0) {
    $cleanTop = $htmlText.Substring(0, $idx)
    $finalContent = $cleanTop + "<!-- MAIN SCRIPT -->`n<script>`n" + $jsText + "`n</script>`n</body>`n</html>"
    Set-Content $outFile $finalContent -Encoding UTF8
    Write-Host "Success: Combined clean HTML and clean JS!"
} else {
    Write-Host "Error: MAIN SCRIPT marker not found in index_backup.html"
}
