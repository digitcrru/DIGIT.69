$rc = [System.Text.Encoding]::UTF8.GetString([byte[]]@(239, 191, 189))
$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js'
$c = Get-Content $file -Encoding UTF8 -Raw

# Specific fixes for the 29 lines:
$c = $c.Replace("ลงทะเบียนเรียบร้อย$rc ล้ว", "ลงทะเบียนเรียบร้อยแล้ว")
$c = $c.Replace("ข้อมูลซ้ำ — ลงทะเบียน$rc ล้ว", "ข้อมูลซ้ำ — ลงทะเบียนแล้ว")
$c = $c.Replace("ประวัติเข้าร่วม$rc ิจ$rc รรม", "ประวัติเข้าร่วมกิจกรรม")
$c = $c.Replace("ประวัติ$rc ิจ$rc รรมที่เคยเข้าร่วม", "ประวัติกิจกรรมที่เคยเข้าร่วม")
$c = $c.Replace("รหัสนั$rc ศึ$rc ษา", "รหัสนักศึกษา")
$c = $c.Replace("$rc รอ$rc รหัส", "กรอกรหัส")
$c = $c.Replace("ข้อมูลนั$rc ศึ$rc ษา", "ข้อมูลนักศึกษา")
$c = $c.Replace("คุณเข้าร่วม$rc ิจ$rc รรมทั้งหมด", "คุณเข้าร่วมกิจกรรมทั้งหมด")
$c = $c.Replace("$rc แตแตแตแต้ม", "แต้ม")
$c = $c.Replace("ประวัติ$rcการเข้าร่วม$rc ิจ$rc รรม", "ประวัติการเข้าร่วมกิจกรรม")
$c = $c.Replace("ชื่อ$rc ิจ$rc รรม", "ชื่อกิจกรรม")
$c = $c.Replace("ใบประ$rc าศนียบัตร", "ใบประกาศนียบัตร")
$c = $c.Replace("เปิดรกลกลกลับใบประ$rc าศ", "เปิดรับใบประกาศ")
$c = $c.Replace("$rc รุณา$rc รอ$rc ข้อมูล", "กรุณากรอกข้อมูล")
$c = $c.Replace("เฉพาะ$rc ิจ$rc รรมที่คุณเข้าร่วม$rc ละ", "เฉพาะกิจกรรมที่คุณเข้าร่วมและ")
$c = $c.Replace("ผ่าน$rcการประเมแอดมแอดมินผล$rc ล้ว", "ผ่านการประเมินผลแล้ว")
$c = $c.Replace("$rc รุณาเข้าร่วม$rc ิจ$rc รรม$rc ละทำ$rcแบบประเมแอดมแอดมินให้เสร็จสิ้น$rc ่อนนะครกลกลกลับ", "กรุณาเข้าร่วมกิจกรรมและทำแบบประเมินให้เสร็จสิ้นก่อนนะครับ")
$c = $c.Replace("$rc รุณา$rc รอ$rc รหัสนั$rc ศึ$rc ษา", "กรุณากรอกรหัสนักศึกษา")
$c = $c.Replace("นั$rc ศึ$rc ษา", "นักศึกษา")
$c = $c.Replace("เ$rc ิดข้อผิดพลาด", "เกิดข้อผิดพลาด")
$c = $c.Replace("ราชภั$rc เชียงราย", "ราชภัฏเชียงราย")
$c = $c.Replace("วุฒิบัตรบัตรฉบกลกลกลับนี้", "วุฒิบัตรฉบับนี้")
$c = $c.Replace("เพื่อ$rcแสดงว่า", "เพื่อแสดงว่า")
$c = $c.Replace("ผ่าน$rcการ$rc ึ$rc อบรมเชิงป$rc ิบัติ$rcการ", "ผ่านการฝึกอบรมเชิงปฏิบัติการ")

$c = $c.Replace("ความเจริ$rc  $rc ละรั$rc ษาคุณ", "ความเจริญ และรักษาคุณ")
$c = $c.Replace("$rc ำลังเตรียมไฟล์เ$rc ียรติบัตร", "กำลังเตรียมไฟล์เกียรติบัตร")
$c = $c.Replace("เ$rc ียรติบัตรสำเร็จ$rc ล้ว", "เกียรติบัตรสำเร็จแล้ว")

# Final pass to clean up any remaining $rc followed by space that I missed, if safe
$c = $c.Replace("ประเมแอดมแอดมิน", "ประเมิน")
$c = $c.Replace("รกลกลกลับ", "รับ")
$c = $c.Replace("$rc ล้ว", "แล้ว")
$c = $c.Replace("$rcการ", "การ")
$c = $c.Replace("$rc ิจ$rc รรม", "กิจกรรม")

$utf8BOM = New-Object System.Text.UTF8Encoding($true)
[System.IO.File]::WriteAllText($file, $c, $utf8BOM)
Write-Host "Fixed all remaining lines!"
