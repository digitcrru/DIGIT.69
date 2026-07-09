$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
$lines = Get-Content $file -Encoding UTF8
$corruptedLines = @()
for ($i=0; $i -lt $lines.Length; $i++) {
    if ($lines[$i].Contains([char]0xFFFD)) {
        $corruptedLines += "$($i+1): $($lines[$i].Trim())"
    }
}
Write-Host "Corrupted lines:"
$corruptedLines | ForEach-Object { Write-Host $_ }
