$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
$text = Get-Content $file -Encoding UTF8 -Raw

$pattern = '<span class="text-base font-black text-primary">\$\{e\.joined\} <span class="text-xs font-bold text-slate-400">(.*?)</span></span>'
$replacement = '<span class="text-4xl font-black text-primary tracking-tight">${e.joined} <span class="text-sm font-bold text-slate-400">$1</span></span>'

$text = $text -replace $pattern, $replacement
Set-Content $file $text -Encoding UTF8
Write-Host "Done"
