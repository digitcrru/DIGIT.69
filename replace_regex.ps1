$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
$replFile = 'C:\Users\Jenn1817\.gemini\antigravity\scratch\replacement.txt'

$text = [IO.File]::ReadAllText($file, [Text.Encoding]::UTF8)
$replacement = [IO.File]::ReadAllText($replFile, [Text.Encoding]::UTF8)

# Use regex to match the button regardless of the Thai text
$pattern = 'id="btn-fetch-order"(.*?)><i class="ph-bold ph-arrow-right text-lg"></i> .*?</button>'
$replacementRegex = 'id="btn-fetch-order"$1><i class="ph-bold ph-arrow-right text-lg"></i> ' + $replacement

if ($text -match $pattern) {
    $text = $text -replace $pattern, $replacementRegex
    [IO.File]::WriteAllText($file, $text, (New-Object System.Text.UTF8Encoding($False)))
    Write-Host "Success regex"
} else {
    Write-Host "Pattern not found!"
}
