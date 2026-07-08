$rc = [System.Text.Encoding]::UTF8.GetString([byte[]]@(239, 191, 189))
$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js'
$c = Get-Content $file -Encoding UTF8 -Raw

$lines = $c -split "`n"
for ($i=0; $i -lt $lines.Length; $i++) {
    if ($lines[$i] -match $rc) {
        $cleanLine = $lines[$i] -replace $rc, "[RC]"
        Write-Host "Line $($i+1): $cleanLine"
    }
}
