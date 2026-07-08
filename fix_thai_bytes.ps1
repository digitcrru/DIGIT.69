$rc = [System.Text.Encoding]::UTF8.GetString([byte[]]@(239, 191, 189))
$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js'
$c = Get-Content $file -Encoding UTF8 -Raw

# Common corrupted strings
$c = $c.Replace("นั$rcศึ$rcษา", "นักศึกษา")
$c = $c.Replace("นั${rc}ศึ${rc}ษา", "นักศึกษา")
$c = $c.Replace("นั $rc ศึ $rc ษา", "นักศึกษา")
$c = $c.Replace("นั ศึ ษา", "นักศึกษา")

$c = $c.Replace("$rcิจ$rcรรม", "กิจกรรม")
$c = $c.Replace("${rc}ิจ${rc}รรม", "กิจกรรม")
$c = $c.Replace("$rc ิจ $rc รรม", "กิจกรรม")
$c = $c.Replace(" ิจ รรม", "กิจกรรม")
$c = $c.Replace("ิจรรม", "กิจกรรม")

$c = $c.Replace("$rcต้ม", "แต้ม")
$c = $c.Replace(" ต้ม", "แต้ม")

$c = $c.Replace("ข้อมู$rc", "ข้อมูล")
$c = $c.Replace("ข้อมู ", "ข้อมูล")

$c = $c.Replace("ถู$rcต้อ$rc", "ถูกต้อง")
$c = $c.Replace("ถู ต้อ ", "ถูกต้อง")

$c = $c.Replace("$rcลับ", "กลับ")
$c = $c.Replace(" ลับ", "กลับ")

$c = $c.Replace("$rcาร", "การ")
$c = $c.Replace(" าร", "การ")

$c = $c.Replace("ทุ$rc", "ทุก")
$c = $c.Replace("ทุ ", "ทุก")

$c = $c.Replace("บันทึ$rc", "บันทึก")
$c = $c.Replace("บันทึ ", "บันทึก")

$c = $c.Replace("เอ$rcสาร", "เอกสาร")
$c = $c.Replace("เอ สาร", "เอกสาร")

$c = $c.Replace("$rcอดมิน", "แอดมิน")
$c = $c.Replace(" อดมิน", "แอดมิน")

$c = $c.Replace("ข$rcอมูล", "ข้อมูล")
$c = $c.Replace("ข อมูล", "ข้อมูล")

$c = $c.Replace("แอดมแอดมิน", "แอดมิน")
$c = $c.Replace("แต้มแต้ม", "แต้ม")

[System.IO.File]::WriteAllText($file, $c, [System.Text.Encoding]::UTF8)
Write-Host "Fixed app.js!"
