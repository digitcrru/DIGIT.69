$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
$text = Get-Content $file -Encoding UTF8 -Raw

$text = $text -replace 'ดำเนแอดมแอดมินการต่อ</button>', "ดำเนินการต่อ</button>`n                                    <div class=`"text-center mt-3`">`n                                        <button type=`"button`" onclick=`"window.skipOrderSearch()`" class=`"text-sm text-slate-500 hover:text-primary font-bold underline transition-colors`">ไม่มีข้อมูลในระบบ? กรอกข้อมูลเอง</button>`n                                    </div>"

Set-Content $file $text -Encoding UTF8
Write-Host "Done"
