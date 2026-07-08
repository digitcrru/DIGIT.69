$utf8 = [System.Text.Encoding]::UTF8
$win1252 = [System.Text.Encoding]::GetEncoding(1252)

function Fix-Encoding ($filePath) {
    $text = [System.IO.File]::ReadAllText($filePath, $utf8)
    $bytes = $win1252.GetBytes($text)
    $fixedText = $utf8.GetString($bytes)
    # Write back without BOM
    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($filePath, $fixedText, $utf8NoBom)
}

Fix-Encoding "C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\index.html"
Fix-Encoding "C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\app.js"
Fix-Encoding "C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\styles.css"
Write-Host "Encoding fixed!"
