$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js'
Get-Content $file -Encoding UTF8 | Select-String -Pattern 'ph-magnifying-glass text-5xl' | ForEach-Object { "$($_.LineNumber): $($_.Line.Trim())" }
