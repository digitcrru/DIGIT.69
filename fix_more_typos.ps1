$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
$text = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

# Fix typos
$b64Typo1 = "4LmA4Lia4Lib4Lij4Liw4LiB4Liy4Lig" # เบประกาภ -> ใบประกาศ
$b64Fix1 = "4LmD4Lia4Lib4Lij4Liw4LiB4Liy4Lio" 

$b64Typo2 = "4LiV4Lix4LmJ4LiH4LiE4LmI4Li1" # ตั้งค่ข -> ตั้งค่า
$b64Fix2 = "4LiV4Lix4LmJ4LiH4LiE4LmI4Liy"

$b64Typo3 = "4LiK4LmI4Liz4Lij4Liw4LmA4LiH4Lit4LmA4LiH4Li04LiZ4LmB4Lil4LmJ4Lii" # ช่ำระเงอเงินแล้ย -> ชำระเงินแล้ว
$b64Fix3 = "4LiK4Liz4Lij4Liw4LmA4LiH4Li04LiZ4LmB4Lil4LmJ4Lin"

$b64Typo4 = "4Lif4Li54LmJ4LiU4Li54LmB4Lil4Lij4Liw4Lia4Lia4Liq4Li54LiH4Liq4Li44LiU" # ฟู้ดูแลระบบสูงสุด -> ผู้ดูแลระบบสูงสุด
$b64Fix4 = "4Lic4Li54LmJ4LiU4Li54LmB4Lil4Lij4Liw4Lia4Lia4Liq4Li54LiH4Liq4Li44LiU"

$b64Typo5 = "4Lif4Li54LmJ4LiI4Lix4LiU4LiB4Liy4Lij4LiB4Li04LiI4LiB4Lij4Lij4Li0" # ฟู้จัดการกิจกรรฒ -> ผู้จัดการกิจกรรม
$b64Fix5 = "4Lic4Li54LmJ4LiI4Lix4LiU4LiB4Liy4Lij4LiB4Li04LiI4LiB4Lij4Lij4Lih"

$b64Typo6 = "4Lif4Li54LmJ4LiI4Lix4LiU4LiB4Liy4Lij4Lij4LmJ4Liy4LiZ4LiE4LmI4Li1" # ฟู้จัดการร้านค้ข -> ผู้จัดการร้านค้า
$b64Fix6 = "4Lic4Li54LmJ4LiI4Lix4LiU4LiB4Liy4Lij4Lij4LmJ4Liy4LiZ4LiE4LmJ4Liy"

$arrTypo = @($b64Typo1, $b64Typo2, $b64Typo3, $b64Typo4, $b64Typo5, $b64Typo6)
$arrFix = @($b64Fix1, $b64Fix2, $b64Fix3, $b64Fix4, $b64Fix5, $b64Fix6)

for ($i = 0; $i -lt $arrTypo.Length; $i++) {
    $typo = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($arrTypo[$i]))
    $fix = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($arrFix[$i]))
    $text = $text.Replace($typo, $fix)
}

[System.IO.File]::WriteAllText($file, $text, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Fixed typos!"
