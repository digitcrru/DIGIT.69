$response = Invoke-WebRequest -Uri "https://script.google.com/macros/s/AKfycbyCPFTT76JLJLo3cNjTDNXQPbofR3AmVEPxCOD9yzdW_73yFy92d-Q0OHAu26DgsA7x/exec?action=getInitialData" -UseBasicParsing
$response.Content | Out-File -FilePath C:\Users\Jenn1817\.gemini\antigravity\scratch\api_content.txt -Encoding UTF8
