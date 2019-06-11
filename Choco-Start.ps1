#Test to see if Chocolatey Package manager is installed
$ChocoInstalled = $false
if (Get-Command choco.exe -ErrorAction SilentlyContinue) {
    $ChocoInstalled = $true
}

#Install Chocolatey
if (!$ChocoInstalled){
    write-warning "It appears that Chocolatey is not installed, installing (You will have to relaunch this script)"
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Read-Host "Chocolatey installation complete - Please relaunch the script..."
    exit
}

$UserChoice = ""
while($UserChoice -ne 10){
$UserChoice = read-host "
-------------------------------------------------------
       -Choose what you'd like to install-
1>  Everything   2>  Utilities (7 Zip, Browsers, Etc.) 
3>  Coding Env   4>  Browsers Only
5>  Sysadmin     6>  DevOps Stuff (AWS, Azure)
10> Exit
-------------------------------------------------------
"

#Grabs the appropriate package list for the choice
Switch ($UserChoice){
    1  {$PackageList = "googlechrome"}
    2  {$PackageList = @('googlechrome' ,'git','notepadplusplus','7zip','putty','sublimetext3')}
    3  {$PackageList = @('git','vscode','azure-cli','azurepowershell','awscli','sublimetext3')}
    4  {$PackageList = @('googlechrome','firefox','chromium')}
    5  {$PackageList = @('git','adobereader','jre8','putty','mobaxterm','rsat')}
    6  {$PackageList = @('azure-cli','azurepowershell','awscli')}
    default {$PackageList = ""}
}
#Install package via. a list
foreach($Package in $PackageList){
    choco install $Package -y
}
}