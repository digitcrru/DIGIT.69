$htmlPath = 'C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\index.html'
$html = Get-Content -Path $htmlPath -Raw -Encoding UTF8

$qrFunc = @"
    window.showQRCode = function(id) {
        const act = appCache.activities.find(a => String(a.id) === String(id));
        if(!act) return;
        const currentUrl = window.location.href.split('?')[0];
        const checkInUrl = currentUrl + '?event_id=' + id;
        const qrUrl = 'https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=' + encodeURIComponent(checkInUrl);
        
        const modal = document.createElement('div');
        modal.className = 'fixed inset-0 bg-slate-900/50 backdrop-blur-sm z-[999] flex items-center justify-center p-4 fade-in';
        modal.innerHTML = `
            <div class="bg-white rounded-3xl p-8 max-w-sm w-full text-center relative border-4 border-primary shadow-2xl">
                <button onclick="this.closest('.fixed').remove()" class="absolute top-4 right-4 w-8 h-8 bg-slate-100 rounded-full flex items-center justify-center text-slate-500 hover:bg-slate-200"><i class="ph-bold ph-x"></i></button>
                <h3 class="text-xl font-bold mb-2 text-slate-800">QR Code สำหรับเช็คชื่อ</h3>
                <p class="text-sm font-bold text-slate-500 mb-6 truncate px-4">` + act.title + `</p>
                <div class="bg-white p-4 rounded-2xl shadow-inner border border-slate-100 mb-6 flex justify-center">
                    <img src="` + qrUrl + `" class="w-48 h-48 rounded-xl object-contain">
                </div>
                <p class="text-xs font-bold text-slate-400">ให้นักศึกษาสแกนด้วยกล้องมือถือ<br>เพื่อเข้าสู่หน้าเช็คชื่อกิจกรรมนี้โดยอัตโนมัติ</p>
                <button onclick="window.open('` + qrUrl + `', '_blank')" class="mt-4 px-4 py-2 bg-primary/10 text-primary font-bold rounded-xl text-xs hover:bg-primary/20 transition">เปิดรูปภาพเต็ม</button>
            </div>
        `;
        document.body.appendChild(modal);
    };

    window.toggleEventStatus = async function
"@

if ($html -notmatch "window\.showQRCode =") {
    $html = $html -replace "window\.toggleEventStatus = async function", $qrFunc
}

$qrBtn = @"
`<div class="flex justify-end gap-2">
                                <button onclick="showQRCode('`${act.id}')" title="QR Code" class="w-8 h-8 rounded-full bg-indigo-50 text-indigo-600 flex items-center justify-center hover:bg-indigo-500 hover:text-white transition-colors hover-lift"><i class="ph-bold ph-qr-code"></i></button>
"@

$html = $html.Replace('`<div class="flex justify-end gap-2">', $qrBtn)

$timeVal = @"

            if (evO) {
                const now = new Date();
                if (evO.openTime) {
                    const openT = new Date(evO.openTime);
                    if (now < openT) { 
                        if (err) { err.innerHTML = 'ยังไม่ถึงเวลาเปิดให้เช็คชื่อกิจกรรมนี้'; err.classList.remove('hidden'); }
                        window.showToast('ยังไม่ถึงเวลาเปิดให้เช็คชื่อ', 'error'); return; 
                    }
                }
                if (evO.closeTime) {
                    const closeT = new Date(evO.closeTime);
                    if (now > closeT) { 
                        if (err) { err.innerHTML = 'หมดเวลาเช็คชื่อกิจกรรมนี้แล้ว'; err.classList.remove('hidden'); }
                        window.showToast('หมดเวลาเช็คชื่อแล้ว', 'error'); return; 
                    }
                }
            }

            const isDup = (cD) => {
"@

if ($html -notmatch "evO\.openTime") {
    $html = $html.Replace('            const isDup = (cD) => {', $timeVal)
}

$autoSel = @"
window.showToast('เชื่อมต่อระบบสำเร็จ', 'success');

        const urlParams = new URLSearchParams(window.location.search);
        const eventId = urlParams.get('event_id');
        if (eventId) {
            setTimeout(() => {
                const ciNav = document.getElementById('nav-checkin');
                if(ciNav) ciNav.click();
                setTimeout(() => {
                    const select = document.getElementById('ci-event');
                    if(select) { 
                        select.value = eventId; 
                        select.dispatchEvent(new Event('change')); 
                    }
                }, 500);
            }, 500);
        }
"@

if ($html -notmatch "const urlParams = new URLSearchParams") {
    $html = $html.Replace("window.showToast('เชื่อมต่อระบบสำเร็จ', 'success');", $autoSel)
}

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($htmlPath, $html, $utf8NoBom)
Write-Host "Patched index.html successfully."
