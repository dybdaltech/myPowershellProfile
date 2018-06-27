New-Alias hero heroku
$env:FLASK_APP = "script.py"

function prompt   
{  
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()  
    $principal = [Security.Principal.WindowsPrincipal] $identity  
    $TitleWindow = Get-Location
    $host.ui.RawUI.WindowTitle = $TitleWindow
    $(if (test-path variable:/PSDebugContext) { '[DBG]: ' }   

    elseif($principal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
    { "[ADMIN $env:COMPUTERNAME] " }  

    else { "[$env:COMPUTERNAME] " }) + $(if ($nestedpromptlevel -ge 1) { '>>' }) + '> '  
}

function vim($file){
    bash -c "vim $file"
}

function vhelp(){
    Write-Host "Vue init webpack *project name*"
    Write-Host "CD into it. And do npm run dev"
    Write-Host "`t"
}

function boilnode($pname) {
    git clone https://github.com/dybdaltech/node_boiler $pname
    cd $pname
}

function help-custom () {
    Write-Host "Func Vim <file>"
    Write-Host "vhelp"
    Write-Host "boilnode(<project_name>"
    Write-Host "Hero == Heroku"
    Write-Host "sh-nmap"
    Write-Host "cd-web/pro <folder>"
}

function sh-nmap(){
    Write-Host "C:\Program Files (x86)\Nmap"
}

function flask-start(){
    Flask run --host=0.0.0.0
}

function cd-web($projectName){
    cd "C:\Users\xxx\Onedrive\Web\$projectName"
}

function cd-pro($projectName){
    cd "C:\Users\xxx\Onedrive\Programming\$projectName"
}

function start-venv(){
    ".\Scripts"
}

function find-aduser([string]$aname){
    $aname
    $aduser = Get-Aduser -LDAPFilter "(anr=$aname)"
    Write-Host $aduser
    return $aduser
}

function ..([string]$task){
    $filePath = ([Environment]::GetFolderPath("MyDocuments")+'\'+"$env:computerName"+'Data.txt')
    Write-Output $task | Out-File $filePath -Append
}

function rr (){
    bash -c "vim /mnt/c/Users/xxx/OneDrive/todo.txt"
}

function get-ipInfo ($IPAdress){
    Invoke-RestMethod -Method GET -Uri "http://api.db-ip.com/v2/free/$IPAdress"
}

function get-dnsInfo ([string]$hostname) {
    Write-Host "$hostname Information:"
    $dnsInfo = Resolve-DnsName $hostname
    $adr =  $dnsInfo.IPAddress
    $test = $adr | Select-String -Pattern "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"
    if ( $test.GetType().FullName -eq "System.Object[]") {
        $adr = $adr[1]
        Write-Host "Multiple Adresses. Using $adr"
    } else {
        $adr = $adr
        Write-Host "One address found. Using $adr"
    }
    $pTime = (Test-Connection -ComputerName $adr -Count 4  | measure-Object -Property ResponseTime -Average).average 
    if($pTime -lt 50 ) {
        Write-Host "Latency: $pTime" -ForegroundColor Green
    } elseif ($pTime -gt 51 -and $pTime -lt 100) {
        Write-Host "Latency: $pTime" -ForegroundColor Yellow
    } elseif ($pTime -gt 101) {
        Write-Host "Latency: $pTime" -ForegroundColor Red
    }
    Invoke-RestMethod -Method GET -Uri "http://api.db-ip.com/v2/free/$adr"
}
#Updated 27.06.2018
