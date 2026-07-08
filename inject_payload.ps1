$htmlPath = 'C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\index.html'
$lines = Get-Content -Path $htmlPath -Encoding UTF8

$newShowQR = Get-Content -Path 'C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\qr_payload.js' -Encoding UTF8 -Raw

$part1 = $lines[0..2238]
$part2 = $newShowQR -split "`r`n|`n"
$part3 = $lines[2262..($lines.Length-1)]

$finalLines = $part1 + $part2 + $part3

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllLines($htmlPath, $finalLines, $utf8NoBom)
Write-Host "Replaced showQRCode block with pristine UTF8 successfully."
