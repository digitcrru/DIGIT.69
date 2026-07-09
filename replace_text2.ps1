$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
$text = [IO.File]::ReadAllText($file, [Text.Encoding]::UTF8)
$target = 'ดำเนแอดมแอดมินการต่อ</button>'
$replacement = "ดำเนินการต่อ</button>`n                                    <div class=`"text-center mt-3`">`n                                        <button type=`"button`" onclick=`"window.skipOrderSearch()`" class=`"text-sm text-slate-500 hover:text-primary font-bold underline transition-colors`">ไม่มีข้อมูลในระบบ? กรอกข้อมูลเอง</button>`n                                    </div>"

if ($text.Contains($target)) {
    $text = $text.Replace($target, $replacement)
    [IO.File]::WriteAllText($file, $text, (New-Object System.Text.UTF8Encoding($False)))
    Write-Host "Success"
} else {
    Write-Host "Target not found"
}
