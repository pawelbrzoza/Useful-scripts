
$path = "c:\Program Files (x86)\Fortinet\FortiClient\"

If(-not(Test-Path -path $path))
{
	$eset = Get-WmiObject -Query "select * from win32_product where name='ESET Endpoint Security'"
    
    If(-not($eset.Version -match '6.6'))
	{
		echo "Install"
		\\vjowisz\domainPublic\GPO\ESET_ERA_6\avremover_ees_nt64_plk.exe --silent --accepteula
        
#        (Get-Process avremover_ees_nt64_plk).Id
	}
	echo "Not install"
}
Else
{ 
	echo "Not install"
}
