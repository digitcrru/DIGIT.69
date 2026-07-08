$oldStr = "ไม่พบข้อมูลสิทธิ์นักศึกษา กรุณาตรวจสอบรหัส หรือเลือกกรอกข้อมูลเอกสารกสารกสารง"
$newStr = "ไม่มีข้อมูลในระบบ? <button type=`"button`" onclick=`"window.skipOrderSearch(\\'' + searchId + '\\')`" class=`"text-primary font-bold underline ml-1`">คลิกเพื่อกรอกข้อมูลเอง</button>"

$files = @('C:\Users\Jenn1817\Downloads\digit_crru_frontend\app_v5.js', 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\digit_crru_perfect.html')
$utf8BOM = New-Object System.Text.UTF8Encoding($true)

foreach ($file in $files) {
    if (Test-Path $file) {
        $c = Get-Content $file -Encoding UTF8 -Raw
        $c = $c.Replace($oldStr, $newStr)
        [System.IO.File]::WriteAllText($file, $c, $utf8BOM)
        Write-Host "Updated $file"
    }
}
