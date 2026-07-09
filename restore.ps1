$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
$missingFile = 'C:\Users\Jenn1817\.gemini\antigravity\scratch\missing.txt'
$text = Get-Content $file -Encoding UTF8 -Raw
$missing = Get-Content $missingFile -Encoding UTF8 -Raw

$pattern = "(?s)localStorage\.setItem\('CRRU_AdminUsers', JSON\.stringify\(adminUsers\)\);\s+if \(\(kS && seenS\.has\(kS\)\)\)"
$replacement = "localStorage.setItem('CRRU_AdminUsers', JSON.stringify(adminUsers));`n" + $missing + "`n                            if ((kS && seenS.has(kS))"

if ($text -match $pattern) {
    $text = $text -replace $pattern, $replacement
    Set-Content $file $text -Encoding UTF8
    Write-Host "Success"
} else {
    Write-Host "Not found"
}
