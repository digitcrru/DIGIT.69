$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js'
$content = Get-Content $file -Encoding UTF8 -Raw
$content = $content.Replace('<i class="ph-fill ph-magnifying-glass text-5xl text-slate-300 mb-3 block mx-auto"></i>à¹„à¸¡à¹ˆà¸žà¸š', '<div class="flex flex-col items-center justify-center"><img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/25.gif" class="w-16 h-16 object-contain mb-3 drop-shadow-sm"><span>à¹„à¸¡à¹ˆà¸žà¸š')
$content = $content.Replace('à¹„à¸¡à¹ˆà¸žà¸šà¸ à¸´à¸ˆà¸ à¸£à¸£à¸¡à¸—à¸µà¹ˆà¸„à¹‰à¸™à¸«à¸²</td></tr>', 'à¹„à¸¡à¹ˆà¸žà¸šà¸ à¸´à¸ˆà¸ à¸£à¸£à¸¡à¸—à¸µà¹ˆà¸„à¹‰à¸™à¸«à¸²</span></div></td></tr>')
Set-Content $file -Value $content -Encoding UTF8
