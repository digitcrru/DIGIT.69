$bytes = [byte[]]@(239, 191, 189)
$rc = [System.Text.Encoding]::UTF8.GetString($bytes)
$matches = Select-String -Path C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js -Pattern $rc -Encoding UTF8 -AllMatches
Write-Host "Total matches: $($matches.Matches.Count)"
if ($matches.Matches.Count -gt 0) {
    $matches | Select-Object -First 10 | ForEach-Object { Write-Host $_.Line.Trim() }
}
