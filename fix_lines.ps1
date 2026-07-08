$htmlPath = 'C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\index.html'
$lines = Get-Content -Path $htmlPath -Encoding UTF8

$newShowQR = @"
    window.showQRCode = function(id) {
        const act = appCache.activities.find(a => String(a.id) === String(id));
        if(!act) return;
        const currentUrl = window.location.href.split('?')[0];
        const checkInUrl = currentUrl + '?event_id=' + id;
        const qrUrl = 'https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=' + encodeURIComponent(checkInUrl);
        
        const modal = document.createElement('div');
        modal.className = 'fixed inset-0 bg-slate-900/50 backdrop-blur-sm z-[999] flex items-center justify-center p-4 fade-in';
        modal.innerHTML = 
            '<div class="bg-white rounded-3xl p-8 max-w-sm w-full text-center relative border-4 border-primary shadow-2xl">' +
                '<button onclick="this.closest(\'.fixed\').remove()" class="absolute top-4 right-4 w-8 h-8 bg-slate-100 rounded-full flex items-center justify-center text-slate-500 hover:bg-slate-200"><i class="ph-bold ph-x"></i></button>' +
                '<h3 class="text-xl font-bold mb-2 text-slate-800">QR Code สำหรับเช็คชื่อ</h3>' +
                '<p class="text-sm font-bold text-slate-500 mb-6 truncate px-4">' + act.title + '</p>' +
                '<div class="bg-white p-4 rounded-2xl shadow-inner border border-slate-100 mb-6 flex justify-center">' +
                    '<img src="' + qrUrl + '" class="w-48 h-48 rounded-xl object-contain">' +
                '</div>' +
                '<p class="text-xs font-bold text-slate-400">ให้นักศึกษาสแกนด้วยกล้องมือถือ<br>เพื่อเข้าสู่หน้าเช็คชื่อกิจกรรมนี้โดยอัตโนมัติ</p>' +
                '<button onclick="window.open(\'' + qrUrl + '\', \'_blank\')" class="mt-4 px-4 py-2 bg-primary/10 text-primary font-bold rounded-xl text-xs hover:bg-primary/20 transition">เปิดรูปภาพเต็ม</button>' +
            '</div>';
        document.body.appendChild(modal);
    };
"@

# The lines we want to replace are 2240 to 2262 (indices 2239 to 2261)
# $lines[0..2238] is the first part
# $newShowQR is the replacement
# $lines[2262..($lines.Length-1)] is the rest

$part1 = $lines[0..2238]
$part2 = $newShowQR -split "`r`n|`n"
$part3 = $lines[2262..($lines.Length-1)]

$finalLines = $part1 + $part2 + $part3

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllLines($htmlPath, $finalLines, $utf8NoBom)
Write-Host "Replaced showQRCode block successfully."
