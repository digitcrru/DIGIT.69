$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

function Fix-File {
    param($path)
    if (-not (Test-Path $path)) { return }
    $c = Get-Content $path -Encoding UTF8 -Raw
    
    # Remove any existing BOMs that might have been prepended multiple times
    $c = $c -replace "^(\xEF\xBB\xBF)+", ""
    
    $rc = [char]65533
    $q = '?'
    
    $c = $c.Replace("นั$rcศึ$rcษา", "นักศึกษา").Replace("นั$qศึ$qษา", "นักศึกษา")
    $c = $c.Replace("นั ศึ ษา", "นักศึกษา")
    $c = $c.Replace("$rcิจ$rcรรม", "กิจกรรม").Replace("$qิจ$qรรม", "กิจกรรม")
    $c = $c.Replace(" ิจ รรม", "กิจกรรม")
    $c = $c.Replace("$rcต้ม", "แต้ม").Replace("$qต้ม", "แต้ม")
    $c = $c.Replace(" ต้ม", "แต้ม")
    $c = $c.Replace("ข้อมู$rc", "ข้อมูล").Replace("ข้อมู$q", "ข้อมูล")
    $c = $c.Replace("ข้อมู ", "ข้อมูล")
    $c = $c.Replace("ถู$rcต้อ$rc", "ถูกต้อง").Replace("ถู$qต้อ$q", "ถูกต้อง")
    $c = $c.Replace("ถู ต้อ ", "ถูกต้อง")
    $c = $c.Replace("$rcลับ", "กลับ").Replace("$qลับ", "กลับ")
    $c = $c.Replace(" ลับ", "กลับ")
    $c = $c.Replace("$rcาร", "การ").Replace("$qาร", "การ")
    $c = $c.Replace(" าร", "การ")
    $c = $c.Replace("ทุ$rc", "ทุก").Replace("ทุ$q", "ทุก")
    $c = $c.Replace("ทุ ", "ทุก")
    $c = $c.Replace("บันทึ$rc", "บันทึก").Replace("บันทึ$q", "บันทึก")
    $c = $c.Replace("บันทึ ", "บันทึก")
    $c = $c.Replace("เอ$rcสาร", "เอกสาร").Replace("เอ$qสาร", "เอกสาร")
    $c = $c.Replace("เอ สาร", "เอกสาร")
    $c = $c.Replace("$rcอดมิน", "แอดมิน").Replace("$qอดมิน", "แอดมิน")
    $c = $c.Replace(" อดมิน", "แอดมิน")
    $c = $c.Replace("ข$rcอมูล", "ข้อมูล").Replace("ข$qอมูล", "ข้อมูล")
    $c = $c.Replace("ข อมูล", "ข้อมูล")

    [System.IO.File]::WriteAllText($path, $c, $utf8NoBom)
}

Fix-File 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
Fix-File 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js'
