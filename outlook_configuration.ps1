
function Is-Installed( $program ) {
    
    $x86 = ((Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall") |
        Where-Object { $_.GetValue( "DisplayName" ) -like "*$program*" } ).Length -gt 0;

    $x64 = ((Get-ChildItem "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall") |
        Where-Object { $_.GetValue( "DisplayName" ) -like "*$program*" } ).Length -gt 0;

	return $x86 -or $x64;
}

function IncreaseSizeOfAttachmentOutlook($regPath){

	$name = "MaximumAttachmentSize"
	$value = "100000"
	$str = "\Preferences" 
	$regPath2 = "$regPath$str"

	echo $regPath
	echo $regPath2
	
	If(Test-Path $regPath2){
		
		If(-not(Get-ItemProperty $regPath2 -Name $name -ea SilentlyContinue)) {
			
			New-ItemProperty -Path $regPath2 -Name $name -PropertyType DWord -Value $value
			"Attachment file created"
		}
		else{
			"Attachment file exist"
		}
	}
	else{
		"Attachment file created"
		"Registry path created"
		
		New-ItemProperty -Path $regPath -Name $name -PropertyType DWord -Value $value
	}
}

function IncreaseMaxSizePSTFile($regPath){

	$name1 = "MaxLargeFileSize"
	$value1 = "2000000"
	$name2 = "WarnLargeFileSize"
	$value2 = "1900000"
	$str = "\PST"
	$regPath2 = "$regPath$str"
	echo $regPath
	echo $regPath2
	
	If(Test-Path $regPath2){
		
		If(-not(Get-ItemProperty $regPath2 -Name $name1 -ea SilentlyContinue)){
		
			New-ItemProperty -Path $regPath2 -Name $name1 -PropertyType DWord -Value $value1
			"MaxLargeFileSize created"
		}
		else{
			"MaxLargeFileSize exist" 
		}
		
		If(-not(Get-ItemProperty $regPath2 -Name $name2 -ea SilentlyContinue)){
		
			New-ItemProperty -Path $regPath2 -Name $name2 -PropertyType DWord -Value $value2
			"WarnLargeFileSize created"
		}
		else{
			"WarnLargeFileSize exist"
		}
	}
	else{
		
		New-Item -Path $regPath -Name PST
		New-ItemProperty -Path $regPath2 -Name $name1 -PropertyType DWord -Value $value1
		New-ItemProperty -Path $regPath2 -Name $name2 -PropertyType DWord -Value $value2
		
		"Registry path created"
		"MaxLargeFileSize created"
		"WarnLargeFileSize created"

	}
}

If(Is-Installed("office 16")){
	
	"Office 2016 installed"
	
	$regPath = "HKCU:\Software\Microsoft\Office\16.0\Outlook"
	IncreaseSizeOfAttachmentOutlook($regPath)
	IncreaseMaxSizePSTFile($regPath)
	
}
elseif(Is-Installed("office 15")){

	"Office 2013 installed"

	$regPath = "HKCU:\Software\Microsoft\Office\15.0\Outlook"
	IncreaseSizeOfAttachmentOutlook($regPath)
	IncreaseMaxSizePSTFile($regPath)
	
}
elseif(Is-Installed("office 2010")){

	"Office 2010 installed"
	
	$regPath = "HKCU:\Software\Microsoft\Office\14.0\Outlook"
	IncreaseSizeOfAttachmentOutlook($regPath)
	IncreaseMaxSizePSTFile($regPath)
	
}
elseif(Is-Installed("office 2007")){

	'Office 2007 installed'
	
	$regPath = 'HKCU:\Software\Microsoft\Office\12.0\Outlook'
	IncreaseSizeOfAttachmentOutlook($regPath)
	IncreaseMaxSizePSTFile($regPath)
	
}
