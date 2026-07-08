$htmlPath = 'C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\index.html'
$html = Get-Content -Path $htmlPath -Raw -Encoding UTF8

# Fix modal.innerHTML syntax
$html = $html -replace 'modal\.innerHTML =\s*<div class="bg-white rounded-3xl p-8 max-w-sm', 'modal.innerHTML = `<div class="bg-white rounded-3xl p-8 max-w-sm'
$html = $html -replace '</div>\s*;\s*document\.body\.appendChild\(modal\);', '</div>`; document.body.appendChild(modal);'

# Fix Mojibake strings
$html = $html -replace 'à¸ªà¸³à¸«à¸£à¸±à¸šà¹€à¸Šà¹‡à¸„à¸Šà¸·à¹ˆà¸­', 'สำหรับเช็คชื่อ'
$html = $html -replace 'à¹ƒà¸«à¹‰à¸™à¸±à¸ à¸¨à¸¶à¸ à¸©à¸²à¸ªà¹ à¸ à¸™à¸”à¹‰à¸§à¸¢à¸ à¸¥à¹‰à¸­à¸‡à¸¡à¸·à¸­à¸–à¸·à¸­<br>à¹€à¸žà¸·à¹ˆà¸­à¹€à¸‚à¹‰à¸²à¸ªà¸¹à¹ˆà¸«à¸™à¹‰à¸²à¹€à¸Šà¹‡à¸„à¸Šà¸·à¹ˆà¸­à¸ à¸´à¸ˆà¸ à¸£à¸£à¸¡à¸™à¸µà¹‰à¹‚à¸”à¸¢à¸­à¸±à¸•à¹‚à¸™à¸¡à¸±à¸•à¸´', 'ให้นักศึกษาสแกนด้วยกล้องมือถือ<br>เพื่อเข้าสู่หน้าเช็คชื่อกิจกรรมนี้โดยอัตโนมัติ'
$html = $html -replace 'à¹€à¸›à¸´à¸”à¸£à¸¹à¸›à¸ à¸²à¸žà¹€à¸•à¹‡à¸¡', 'เปิดรูปภาพเต็ม'

# Fix the act.title and qrUrl concatenation
$html = $html -replace '<p class="text-sm font-bold text-slate-500 mb-6 truncate px-4"> \+ act\.title \+ </p>', '<p class="text-sm font-bold text-slate-500 mb-6 truncate px-4">${act.title}</p>'
$html = $html -replace '<img src=" \+ qrUrl \+ " class="w-48 h-48 rounded-xl object-contain">', '<img src="${qrUrl}" class="w-48 h-48 rounded-xl object-contain">'
$html = $html -replace 'window\.open\('' \+ qrUrl \+ '', ''_blank''\)', 'window.open(`${qrUrl}`, `_blank`)'

# Add the QR button
$btnSearch = "`<div class=`"flex justify-end gap-2`">"
$btnReplace = "`<div class=`"flex justify-end gap-2`">`n<button onclick=`"showQRCode('`${e.id}')`" title=`"QR Code`" class=`"w-8 h-8 rounded-full bg-indigo-50 text-indigo-600 flex items-center justify-center hover:bg-indigo-500 hover:text-white transition-colors hover-lift`"><i class=`"ph-bold ph-qr-code`"></i></button>"

if ($html -notmatch "showQRCode\('\`\$\{e\.id\}'\)") {
    $html = $html.Replace($btnSearch, $btnReplace)
}

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($htmlPath, $html, $utf8NoBom)
Write-Host "Fix applied."
