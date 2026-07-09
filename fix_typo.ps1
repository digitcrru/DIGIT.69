$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
$text = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

# "สั่งจอง"
$b64tabLabel1 = "4Liq4Lix4LmI4LiH4LiI4Lit4LiH"
# "ติดตาม"
$b64label2 = "4LiV4Li04LiU4LiV4Liy4Lih"

$str1 = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($b64tabLabel1))
$str2 = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($b64label2))

# Find the exact lines and replace them
# They look like: NAV_STUDENT.push({ id: 'shirt', label: 'สั่งจองเสื้อ', tabLabel: '...
$text = $text -replace "tabLabel: '㊪\?ั่งจอง'", ("tabLabel: '" + $str1 + "'")
$text = $text -replace "label: '〕ิดตาม'", ("label: '" + $str2 + "'")
$text = $text -replace "tabLabel: '〖ิฐตาม'", ("tabLabel: '" + $str2 + "'")

[System.IO.File]::WriteAllText($file, $text, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Restored typos successfully!"
