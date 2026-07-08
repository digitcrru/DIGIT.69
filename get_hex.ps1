$text = (Get-Content C:\Users\Jenn1817\Downloads\digit_crru_frontend\app.js)[1127]
$bytes = [System.Text.Encoding]::UTF8.GetBytes($text)
[System.BitConverter]::ToString($bytes)
