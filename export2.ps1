$bytes = [byte[]]@(239, 191, 189)
$rc = [System.Text.Encoding]::UTF8.GetString($bytes)
$matches = Select-String -Path C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js -Pattern $rc -Encoding UTF8 -AllMatches
$lines = $matches | Select-Object -ExpandProperty Line | Get-Unique
$lines | Out-File C:\Users\Jenn1817\.gemini\antigravity\scratch\broken2.txt -Encoding UTF8
