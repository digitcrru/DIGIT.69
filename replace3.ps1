$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js'
$content = Get-Content $file -Encoding UTF8 -Raw
$content = $content.Replace('<i class="ph-fill ph-warning-circle text-5xl text-slate-300 mb-4 block mx-auto"></i>', '<div class="flex flex-col items-center justify-center"><img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/25.gif" class="w-16 h-16 object-contain mb-3 drop-shadow-sm"></div>')
$content = $content.Replace('<i class="ph-fill ph-warning-circle text-6xl text-slate-300 mb-4 block mx-auto"></i>', '<div class="flex flex-col items-center justify-center"><img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/25.gif" class="w-20 h-20 object-contain mb-3 drop-shadow-sm"></div>')
Set-Content $file -Value $content -Encoding UTF8
