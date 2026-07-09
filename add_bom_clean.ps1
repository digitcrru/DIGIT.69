$utf8BOM = New-Object System.Text.UTF8Encoding($true)
$c = Get-Content 'C:\Users\Jenn1817\.gemini\antigravity\scratch\clean_utf8.ps1' -Encoding UTF8 -Raw
[System.IO.File]::WriteAllText('C:\Users\Jenn1817\.gemini\antigravity\scratch\clean_utf8_bom.ps1', $c, $utf8BOM)
