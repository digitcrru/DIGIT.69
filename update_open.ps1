$file = 'C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html'
$text = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

$b64Target = "ICAgICAgICAgICAgZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoJ2VkaXQtZXZlbnQtbGF0JykudmFsdWUgPSBlLmxhdCB8fCAnJzsgCiAgICAgICAgICAgIGRvY3VtZW50LmdldEVsZW1lbnRCeUlkKCdlZGl0LWV2ZW50LWxuZycpLnZhbHVlID0gZS5sbmcgfHwgJyc7IAogICAgICAgICAgICBkb2N1bWVudC5nZXRFbGVtZW50QnlJZCgnZWRpdEV2ZW50TW9kYWwnKS5jbGFzc0xpc3QucmVtb3ZlKCdoaWRkZW4nKTs="
$b64Replacement = "ICAgICAgICAgICAgZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoJ2VkaXQtZXZlbnQtbGF0JykudmFsdWUgPSBlLmxhdCB8fCAnJzsgCiAgICAgICAgICAgIGRvY3VtZW50LmdldEVsZW1lbnRCeUlkKCdlZGl0LWV2ZW50LWxuZycpLnZhbHVlID0gZS5sbmcgfHwgJyc7IAogICAgICAgICAgICBkb2N1bWVudC5nZXRFbGVtZW50QnlJZCgnZWRpdC1ldmVudC1yYWRpdXMnKS52YWx1ZSA9IGUucmFkaXVzIHx8ICcnOyAKICAgICAgICAgICAgZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoJ2VkaXRFdmVudE1vZGFsJykuY2xhc3NMaXN0LnJlbW92ZSgnaGlkZGVuJyk7"

$target = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($b64Target))
$replacement = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($b64Replacement))
$text = $text.Replace($target, $replacement)

[System.IO.File]::WriteAllText($file, $text, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Updated openEditEventModal successfully!"
