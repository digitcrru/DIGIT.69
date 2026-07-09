$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
$text = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

$b64Target = "ICAgICAgICAgICAgICAgICAgICAgICAgaS5sYXQgPSBzdFBhcnRzLmxlbmd0aCA+IDQgPyBzdFBhcnRzWzRdIDogJyc7IGkubG5nID0gc3RQYXJ0cy5sZW5ndGggPiA1ID8gc3RQYXJ0c1s1XSA6ICcnOwogICAgICAgICAgICAgICAgICAgICAgICBjZXJ0RXZlbnRTdGF0dXNbaS5pZF0gPSBpLmNlcnRFbmFibGVkOwogICAgICAgICAgICAgICAgICAgIH0pOw="
$b64Replacement = "ICAgICAgICAgICAgICAgICAgICAgICAgaS5sYXQgPSBzdFBhcnRzLmxlbmd0aCA+IDQgPyBzdFBhcnRzWzRdIDogJyc7IGkubG5nID0gc3RQYXJ0cy5sZW5ndGggPiA1ID8gc3RQYXJ0c1s1XSA6ICcnOwogICAgICAgICAgICAgICAgICAgICAgICBpLnJhZGl1cyA9IHN0UGFydHMubGVuZ3RoID4gNiA/IHN0UGFydHNbNl0gOiAnJzsKICAgICAgICAgICAgICAgICAgICAgICAgY2VydEV2ZW50U3RhdHVzW2kuaWRdID0gaS5jZXJ0RW5hYmxlZDsKICAgICAgICAgICAgICAgICAgICB9KTs="

$target = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($b64Target))
$replacement = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($b64Replacement))
$text = $text.Replace($target, $replacement)

# Also there's another fetchActivitiesData that has identical parsing logic at line ~740!
$b64Target2 = "ICAgICAgICAgICAgICAgICAgICAgICAgaS5sYXQgPSBzdFBhcnRzLmxlbmd0aCA+IDQgPyBzdFBhcnRzWzRdIDogJyc7IGkubG5nID0gc3RQYXJ0cy5sZW5ndGggPiA1ID8gc3RQYXJ0c1s1XSA6ICcnOwogICAgICAgICAgICAgICAgICAgIH0pOw="
$b64Replacement2 = "ICAgICAgICAgICAgICAgICAgICAgICAgaS5sYXQgPSBzdFBhcnRzLmxlbmd0aCA+IDQgPyBzdFBhcnRzWzRdIDogJyc7IGkubG5nID0gc3RQYXJ0cy5sZW5ndGggPiA1ID8gc3RQYXJ0c1s1XSA6ICcnOwogICAgICAgICAgICAgICAgICAgICAgICBpLnJhZGl1cyA9IHN0UGFydHMubGVuZ3RoID4gNiA/IHN0UGFydHNbNl0gOiAnJzsKICAgICAgICAgICAgICAgICAgICB9KTs="
$target2 = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($b64Target2))
$replacement2 = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($b64Replacement2))

$text = $text.Replace($target2, $replacement2)

[System.IO.File]::WriteAllText($file, $text, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Updated data loader successfully!"
