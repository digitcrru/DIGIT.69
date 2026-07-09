$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
$targetFile = 'C:\Users\Jenn1817\.gemini\antigravity\scratch\target.txt'
$replFile = 'C:\Users\Jenn1817\.gemini\antigravity\scratch\replacement.txt'

$text = [IO.File]::ReadAllText($file, [Text.Encoding]::UTF8)
$target = [IO.File]::ReadAllText($targetFile, [Text.Encoding]::UTF8)
$replacement = [IO.File]::ReadAllText($replFile, [Text.Encoding]::UTF8)

if ($text.Contains($target)) {
    $text = $text.Replace($target, $replacement)
    [IO.File]::WriteAllText($file, $text, (New-Object System.Text.UTF8Encoding($False)))
    Write-Host "Success"
} else {
    Write-Host "Target not found"
}
