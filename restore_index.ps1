$c = Get-Content 'C:\Users\Jenn1817\.gemini\antigravity\scratch\restored_app.txt' -Raw -Encoding UTF8
$start = $c.IndexOf('<!DOCTYPE html>')
if ($start -lt 0) { Write-Host "Not found"; exit }
$end = $c.IndexOf('</html>', $start) + 7
$html = $c.Substring($start, $end - $start)
[System.IO.File]::WriteAllText('C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html', $html, [System.Text.Encoding]::UTF8)
Write-Host "Restored index.html!"
