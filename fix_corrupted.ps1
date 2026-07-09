$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
$text = Get-Content $file -Encoding UTF8 -Raw

# Helper to define the unicode replacement character
$rc = [char]0xFFFD

# Line 1558
$text = $text -replace "ประวัติการเข้าร่วมกิจกรรม", "ประวัติการเข้าร่วมกิจกรรม" # Wait, replacing regex with literal might fail if I don't escape.

# Let's just use string replace for each corrupted substring
$text = $text.Replace("ประวัติการเข้าร่วม$rc", "ประวัติการเข้าร่วมกิจกรรม")
$text = $text.Replace("ยังไม่มีประวัติการเข้าร่วม$rc", "ยังไม่มีประวัติการเข้าร่วมกิจกรรม")
$text = $text.Replace("คุณสามารถเข้าร่วมกิจกรรมต่างๆ เพื่อสะสมประวัติได้ที่$rc", "คุณสามารถเข้าร่วมกิจกรรมต่างๆ เพื่อสะสมประวัติได้ที่นี่")
$text = $text.Replace("ติดตามและดาวน์โหลดเกียรติบัตรของคุณ <span class=`"font-bold text-primary`">จากกิจกรรมที่ผ่าน$rc", "ติดตามและดาวน์โหลดเกียรติบัตรของคุณ <span class=`"font-bold text-primary`">จากกิจกรรมที่ผ่านมา")
$text = $text.Replace("ยังไม่มีเกียรติ$rc", "ยังไม่มีเกียรติบัตร")
$text = $text.Replace("คุณยังไม่มีเกียรติบัตรในระบบ เข้าร่วมกิจกรรมเพื่อรับเกียรติ$rc", "คุณยังไม่มีเกียรติบัตรในระบบ เข้าร่วมกิจกรรมเพื่อรับเกียรติบัตร")

# The most critical ones for the Certificate
$text = $text.Replace("ขอมอบวุฒิบัตรฉบับนี้ให้ไว้เพื่อ$rc" + "แสดงว่า", "ขอมอบวุฒิบัตรฉบับนี้ให้ไว้เพื่อแสดงว่า")
$text = $text.Replace("ได้ผ่าน$rc" + "การ$rc" + " ึ$rc" + " อบรมเชิงป$rc" + " ิบัติ$rc" + "การ", "ได้ผ่านการฝึกอบรมเชิงปฏิบัติการ")
$text = $text.Replace("“`${d.eName}$rc" + " </h3>", "“`${d.eName}”</h3>")
$text = $text.Replace("เกิดข้อผิดพลาดใน$rc" + "การสร้างไฟล์รูปภาพ", "เกิดข้อผิดพลาดในการสร้างไฟล์รูปภาพ")

Set-Content $file $text -Encoding UTF8
Write-Host "Replaced corrupted characters!"
