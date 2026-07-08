$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app_v5.js'
$c = Get-Content $file -Encoding UTF8 -Raw

$oldStr = "feedback.innerHTML = 'ไม่พบข้อมูลนักศึกษา กรุณาตรวจสอบรหัสอีกครั้ง';"
$newStr = "feedback.innerHTML = 'ไม่พบข้อมูลนักศึกษาในระบบ <button type=`"button`" onclick=`"window.skipOrderSearch(\\'' + searchId + '\\')`" class=`"text-primary font-bold underline ml-1`">กรอกข้อมูลเอง</button>';"

$c = $c.Replace($oldStr, $newStr)

$utf8BOM = New-Object System.Text.UTF8Encoding($true)
[System.IO.File]::WriteAllText($file, $c, $utf8BOM)
Write-Host "Updated app_v5.js"
