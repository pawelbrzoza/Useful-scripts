
$Temp = @("C:\Users\$env:UserName\Appdata\Local\Temp\*")
Remove-Item $Temp -force -recurse
