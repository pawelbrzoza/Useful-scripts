
$process = Get-Process Veeam.EndPoint.Service -ErrorAction SilentlyContinue

echo "$process"

If(-not($process))
{
	echo "Install"
	
#	path /silent /accepteula
	
	echo %ERRORLEVEL%
}
Else
{
	echo "Not install"
}
