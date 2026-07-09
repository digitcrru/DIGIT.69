$lines = Get-Content 'C:\Users\Jenn1817\.gemini\antigravity\brain\5bfc2a01-1949-4bc1-905f-ba767ed379aa\.system_generated\logs\transcript_full.jsonl'
$lastLine = $lines[-1]
$json = $lastLine | ConvertFrom-Json
$content = $json.content
$startIndex = $content.IndexOf('<USER_REQUEST>') + 15
$endIndex = $content.IndexOf('</USER_REQUEST>')
if ($startIndex -gt 14 -and $endIndex -gt $startIndex) {
    $content = $content.Substring($startIndex, $endIndex - $startIndex).Trim()
}
[System.IO.File]::WriteAllText('C:\Users\Jenn1817\Downloads\digit_crru_frontend\index_new.html', $content, [System.Text.Encoding]::UTF8)
Write-Host "Length is $($content.Length)"
