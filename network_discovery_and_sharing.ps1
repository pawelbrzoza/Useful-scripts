$a = get-culture

if($a.Parent.Name -eq "pl"){
netsh advfirewall firewall set rule group="Odnajdowanie sieci" new enable=Yes
netsh advfirewall firewall set rule group="Udost©pnianie plik˘w i drukarek" new enable=Yes
}
elseif($a.Parent.Name -eq "en"){
netsh advfirewall firewall set rule group="Network discovery" new enable=Yes
netsh advfirewall firewall set rule group="File and printer sharing" new enable=Yes
}