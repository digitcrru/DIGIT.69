$jsFile = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app_v5.js'
$jsText = Get-Content $jsFile -Encoding UTF8 -Raw

# Replace the giant popup HTML block
$jsText = $jsText -replace '<div class="glass rounded-\[32px\] p-8 border border-white shadow-sm"><h2 class="text-xl font-bold mb-4 flex items-center gap-2"><i class="ph-fill ph-app-window text-primary text-2xl"></i> ตั้งค่าประกาศ \(Popup\)</h2>.*?</div></div><div class="flex justify-end gap-4 pt-4">', '<div class="flex justify-end gap-4 pt-4">'

# Remove the preview button
$jsText = $jsText -replace '<button type="button" onclick="previewCurrentPopup\(\)".*?ทดสอบดู</button>', ''

# Remove popupSettings payload in submitSettings
$jsText = $jsText -replace 'popupSettings\.enabled = document\.getElementById\(''setting-popup-toggle''\)\.checked; popupSettings\.title = document\.getElementById\(''setting-popup-title''\)\.value; popupSettings\.description = window\.getPopupDescArray\(\); popupSettings\.imageUrl = window\.getPopupImageArray\(\); \r?\n        localStorage\.setItem\(''CRRU_PopupSettings'', JSON\.stringify\(popupSettings\)\); ', ''
$jsText = $jsText -replace ', popupSettings: popupSettings', ''

Set-Content $jsFile $jsText -Encoding UTF8
Write-Host "Replaced!"
