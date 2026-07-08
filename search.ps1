$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js'
Get-Content $file -Encoding UTF8 | Select-String -Pattern 'ยังไม่พบข้อมูล' | ForEach-Object { "$($_.LineNumber): $($_.Line.Trim())" }
