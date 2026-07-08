$rc = [System.Text.Encoding]::UTF8.GetString([byte[]]@(239, 191, 189))
$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js'
$c = Get-Content $file -Encoding UTF8 -Raw

$c = $c.Replace("ประวัติ$rcการเข้าร่วมกิจกรรม", "ประวัติการเข้าร่วมกิจกรรม")
$c = $c.Replace("ผ่าน$rcการประเมินกิจกรรมที่เปิดรับใบประกาศ", "ผ่านการประเมินกิจกรรมที่เปิดรับใบประกาศ")
$c = $c.Replace("ผ่าน$rcการประเมินผลแล้ว", "ผ่านการประเมินผลแล้ว")
$c = $c.Replace("$rc รุณาเข้าร่วมกิจกรรม$rc ละทำ$rcแบบประเมินให้เสร็จสิ้น$rc ่อนนะครับ", "กรุณาเข้าร่วมกิจกรรมและทำแบบประเมินให้เสร็จสิ้นก่อนนะครับ")
$c = $c.Replace("$rc รุณากรอกรหัสนักศึกษา", "กรุณากรอกรหัสนักศึกษา")
$c = $c.Replace("เพื่อ$rcแสดงว่า", "เพื่อแสดงว่า")
$c = $c.Replace("ผ่าน$rcการ$rc ึ$rc อบรมเชิงป$rc ิบัติ$rcการ", "ผ่านการฝึกอบรมเชิงปฏิบัติการ")
$c = $c.Replace("เกิดข้อผิดพลาดใน$rcการสร้างไฟล์รูปภาพ", "เกิดข้อผิดพลาดในการสร้างไฟล์รูปภาพ")

$utf8BOM = New-Object System.Text.UTF8Encoding($true)
[System.IO.File]::WriteAllText($file, $c, $utf8BOM)

$htmlPath = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
$html = Get-Content $htmlPath -Encoding UTF8 -Raw
$html = $html -replace '<script src="app.js\?v=\w+"></script>', '<script src="app.js?v=fixed4"></script>'
[System.IO.File]::WriteAllText($htmlPath, $html, $utf8BOM)
