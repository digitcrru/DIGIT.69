$c = Get-Content 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js' -Encoding UTF8
$out = @()
for ($i = 0; $i -lt $c.Length; $i++) {
    if ($c[$i] -match '\uFFFD|\?|[\x80-\x9F]') {
        $out += "Line $($i+1): $($c[$i])"
    }
}
[System.IO.File]::WriteAllLines('C:\Users\Jenn1817\.gemini\antigravity\scratch\corrupted.txt', $out, [System.Text.Encoding]::UTF8)
