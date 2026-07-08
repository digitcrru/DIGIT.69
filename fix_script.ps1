$c = Get-Content 'C:\Users\Jenn1817\.gemini\antigravity\scratch\fix_all_bom.ps1' -Encoding UTF8 -Raw
$c = $c -replace '(?m)^.*\`\$\{d\.eName\}.*$', ''
$utf8BOM = New-Object System.Text.UTF8Encoding($true)
[System.IO.File]::WriteAllText('C:\Users\Jenn1817\.gemini\antigravity\scratch\fix_all_bom2.ps1', $c, $utf8BOM)
