$html = Get-Content 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html' -Raw
$matches = [regex]::Matches($html, '(?si)<script>(.*?)</script>')
if ($matches.Count -gt 0) {
    $script = $matches[0].Groups[1].Value
    Set-Content 'C:\Users\Jenn1817\.gemini\antigravity\scratch\test.js' $script -Encoding UTF8
    Write-Host "Extracted script"
} else {
    Write-Host "No script found"
}
