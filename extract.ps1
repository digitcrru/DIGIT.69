$line = Get-Content 'C:\Users\Jenn1817\.gemini\antigravity\brain\5bfc2a01-1949-4bc1-905f-ba767ed379aa\.system_generated\logs\transcript_full.jsonl' -TotalCount 1
$json = $line | ConvertFrom-Json
$content = $json.content
[System.IO.File]::WriteAllText('C:\Users\Jenn1817\.gemini\antigravity\scratch\original_prompt.txt', $content, [System.Text.Encoding]::UTF8)
Write-Host "Length is $($content.Length)"
