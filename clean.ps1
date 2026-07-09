$text = Get-Content C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html -Encoding UTF8 -Raw;
$idx = $text.IndexOf("<!-- MAIN SCRIPT -->");
if ($idx -gt 0) {
    $cleanHtml = $text.Substring(0, $idx) + "<!-- MAIN SCRIPT -->`n<script src=`"app_v5.js?v=" + (Get-Date -UFormat %s) + "`"></script>`n</body>`n</html>";
    Set-Content C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html $cleanHtml -Encoding UTF8;
    Write-Host 'Done!';
}
