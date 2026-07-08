$lines = Get-Content 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app_v5.js' -Encoding UTF8
$out = ""
for ($i = 1795; $i -le 1805; $i++) {
    $out += $lines[$i] + "`n"
}
[System.IO.File]::WriteAllText('C:\Users\Jenn1817\.gemini\antigravity\scratch\view_lines.txt', $out, [System.Text.Encoding]::UTF8)
