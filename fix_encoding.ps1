$files = @('C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js', 'C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\app.js')

foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "Fixing $file..."
        $text = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
        $bytes = [System.Text.Encoding]::GetEncoding(1252).GetBytes($text)
        $fixed = [System.Text.Encoding]::UTF8.GetString($bytes)
        
        [System.IO.File]::WriteAllText($file, $fixed, [System.Text.Encoding]::UTF8)
        Write-Host "Done fixing $file"
    }
}
