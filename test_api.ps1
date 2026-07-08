$r = Invoke-RestMethod -Uri 'https://script.google.com/macros/s/AKfycbxGzJdUwRB7ObuKBnu6VEpWTeAoWuOtjNRP13LziFw4UCT5Pp41pmYNAzJuaJiCCK4z/exec?action=getOrders'
$r | ConvertTo-Json -Depth 5

$a = Invoke-RestMethod -Uri 'https://script.google.com/macros/s/AKfycbxGzJdUwRB7ObuKBnu6VEpWTeAoWuOtjNRP13LziFw4UCT5Pp41pmYNAzJuaJiCCK4z/exec?action=getActivities'
$a | ConvertTo-Json -Depth 5
