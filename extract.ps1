$lines = Get-Content 'C:\Users\Jenn1817\.gemini\antigravity\brain\5bfc2a01-1949-4bc1-905f-ba767ed379aa\.system_generated\logs\transcript_full.jsonl' -Encoding UTF8

foreach ($line in $lines) {
    if ($line -match '"type":"USER_INPUT"') {
        if ($line -match 'const GOOGLE_SCRIPT_URL') {
            $obj = ConvertFrom-Json $line
            [System.IO.File]::WriteAllText('C:\Users\Jenn1817\.gemini\antigravity\scratch\restored_app.txt', $obj.content, [System.Text.Encoding]::UTF8)
            Write-Host "Found and saved!"
            break
        }
    }
}
