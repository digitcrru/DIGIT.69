$htmlPath = 'C:\Users\Jenn1817\.gemini\antigravity\scratch\digit_crru\index.html'
$html = Get-Content -Path $htmlPath -Raw -Encoding UTF8

$search = '<div class="flex items-center justify-center gap-4"><label '
$replace = '<div class="flex items-center justify-center gap-4"><button onclick="showQRCode(''${e.id}'')" title="QR Code" class="w-8 h-8 rounded-xl bg-indigo-50 border border-indigo-100 shadow-sm text-indigo-600 flex items-center justify-center hover:bg-indigo-100 transition-colors hover-lift"><i class="ph-bold ph-qr-code"></i></button><label '

if ($html -notmatch 'showQRCode\(''\$\{e.id\}''\)') {
    $html = $html.Replace($search, $replace)
    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($htmlPath, $html, $utf8NoBom)
    Write-Host "QR Button Added."
} else {
    Write-Host "QR Button already exists."
}
