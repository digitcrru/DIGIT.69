$c = Get-Content 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js' -Encoding UTF8 -Raw

# Common broken words due to missing Ko Kai (ก), Sara Ae (แ), etc.
$c = $c -replace 'นั\?ศึ\?ษา', 'นักศึกษา'
$c = $c -replace 'นั\uFFFDศึ\uFFFDษา', 'นักศึกษา'
$c = $c -replace 'นัศึษา', 'นักศึกษา'
$c = $c -replace 'นั ศึ ษา', 'นักศึกษา'

$c = $c -replace '\?ิจ\?รรม', 'กิจกรรม'
$c = $c -replace '\uFFFDิจ\uFFFDรรม', 'กิจกรรม'
$c = $c -replace 'ิจรรม', 'กิจกรรม'
$c = $c -replace ' ิจ รรม', 'กิจกรรม'

$c = $c -replace '\?ต้ม', 'แต้ม'
$c = $c -replace '\uFFFDต้ม', 'แต้ม'
$c = $c -replace 'ต้ม', 'แต้ม' # Wait, 'ต้ม' alone might match other things. Let's not replace 'ต้ม' globally unless safe. Actually ' ต้ม' is safe.
$c = $c -replace ' ต้ม', 'แต้ม'

$c = $c -replace 'ข้อมู\?', 'ข้อมูล'
$c = $c -replace 'ข้อมู\uFFFD', 'ข้อมูล'
$c = $c -replace 'ข้อมู ', 'ข้อมูล'

$c = $c -replace 'ถู\?ต้อ\?', 'ถูกต้อง'
$c = $c -replace 'ถู\uFFFDต้อ\uFFFD', 'ถูกต้อง'
$c = $c -replace 'ถู ต้อ ', 'ถูกต้อง'

$c = $c -replace '\?ลับ', 'กลับ'
$c = $c -replace '\uFFFDลับ', 'กลับ'
$c = $c -replace ' ลับ', 'กลับ'

$c = $c -replace '\?าร', 'การ'
$c = $c -replace '\uFFFDาร', 'การ'
$c = $c -replace ' าร', 'การ'

$c = $c -replace 'ทุ\?', 'ทุก'
$c = $c -replace 'ทุ\uFFFD', 'ทุก'
$c = $c -replace 'ทุ ', 'ทุก'

$c = $c -replace 'บันทึ\?', 'บันทึก'
$c = $c -replace 'บันทึ\uFFFD', 'บันทึก'
$c = $c -replace 'บันทึ ', 'บันทึก'

$c = $c -replace 'เอ\?สาร', 'เอกสาร'
$c = $c -replace 'เอ\uFFFDสาร', 'เอกสาร'
$c = $c -replace 'เอ สาร', 'เอกสาร'

$c = $c -replace '\?อดมิน', 'แอดมิน'
$c = $c -replace '\uFFFDอดมิน', 'แอดมิน'
$c = $c -replace ' อดมิน', 'แอดมิน'

$c = $c -replace 'ข\?อมูล', 'ข้อมูล'
$c = $c -replace 'ข\uFFFDอมูล', 'ข้อมูล'
$c = $c -replace 'ข อมูล', 'ข้อมูล'

$c = $c -replace 'ห\?ัก', 'หลัก'
$c = $c -replace 'ห\uFFFDัก', 'หลัก'
$c = $c -replace 'ห ัก', 'หลัก'

$c = $c -replace 'ท\?ำ', 'ทำ'
$c = $c -replace 'ท\uFFFDำ', 'ทำ'
$c = $c -replace 'ท ำ', 'ทำ'

$c = $c -replace '\?บบ', 'แบบ'
$c = $c -replace '\uFFFDบบ', 'แบบ'
$c = $c -replace ' บบ', 'แบบ'

$c = $c -replace 'แ\?ก้', 'แก้'
$c = $c -replace 'แ\uFFFDก้', 'แก้'
$c = $c -replace 'แ ก้', 'แก้'

$c = $c -replace '\?สดง', 'แสดง'
$c = $c -replace '\uFFFDสดง', 'แสดง'
$c = $c -replace ' สดง', 'แสดง'

$c = $c -replace 'หล\?ก', 'หลัก'
$c = $c -replace 'หล\uFFFDก', 'หลัก'
$c = $c -replace 'หล ก', 'หลัก'

$c = $c -replace 'ร\?หัส', 'รหัส'
$c = $c -replace 'ร\uFFFDหัส', 'รหัส'
$c = $c -replace 'ร หัส', 'รหัส'

[System.IO.File]::WriteAllText('C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js', $c, [System.Text.Encoding]::UTF8)
Write-Host "Replaced!"
