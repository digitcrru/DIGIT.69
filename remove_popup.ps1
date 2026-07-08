$htmlFile = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\digit_crru_perfect.html'
$jsFile = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app_v5.js'

$htmlText = Get-Content $htmlFile -Encoding UTF8 -Raw
$jsText = Get-Content $jsFile -Encoding UTF8 -Raw

# 1. Remove HTML modal
$htmlText = $htmlText -replace '(?s)    <!-- Home Popup Modal -->.*?    <!-- Size Chart Modal -->', '    <!-- Size Chart Modal -->'

# 2. Remove popup trigger logic in fetchInitialData
$jsText = $jsText -replace '(?s)                if \(\!sessionStorage\.getItem\(''homePopupShown''\).*?                \} ', ''

# 3. Remove Popup Settings UI block in renderAdminSettings
# The block starts with <div class="glass rounded-[32px] p-8 border border-white shadow-sm"><h2 class="text-xl font-bold mb-4 flex items-center gap-2"><i class="ph-fill ph-app-window text-primary text-2xl"></i> ตั้งค่าประกาศ (Popup)</h2> and ends right before <div class="flex justify-end gap-4 pt-4">
$jsText = $jsText -replace '(?s)<div class="glass rounded-\[32px\] p-8 border border-white shadow-sm"><h2 class="text-xl font-bold mb-4 flex items-center gap-2"><i class="ph-fill ph-app-window text-primary text-2xl"></i> ตั้งค่าประกาศ \(Popup\)</h2>.*?</div></div><div class="flex justify-end gap-4 pt-4">', '</div><div class="flex justify-end gap-4 pt-4">'

# 4. Remove preview button in renderAdminSettings
$jsText = $jsText -replace '<button type="button" onclick="previewCurrentPopup\(\)" class="px-8 py-4 rounded-2xl font-bold bg-white/80 border border-white shadow-sm hover-lift flex items-center gap-2"><i class="ph-bold ph-eye text-xl"></i> ทดสอบดู</button>', ''

Set-Content $htmlFile $htmlText -Encoding UTF8
Set-Content $jsFile $jsText -Encoding UTF8
Write-Host "Removed popup successfully!"
