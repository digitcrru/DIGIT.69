$utf8BOM = New-Object System.Text.UTF8Encoding($true)
$c = Get-Content 'C:\Users\Jenn1817\.gemini\antigravity\scratch\fix_final.ps1' -Encoding UTF8 -Raw
[System.IO.File]::WriteAllText('C:\Users\Jenn1817\.gemini\antigravity\scratch\fix_final_bom.ps1', $c, $utf8BOM)
