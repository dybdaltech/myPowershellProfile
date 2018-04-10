new-alias grep sls

function make-node([string]$projectName, [string]$info){
    mkdir $projectName
    Set-Location $projectName
    New-item "App.js" -type file -Confirm
    New-item "Views" -type Directory -Confirm
    New-Item "Models" -type Directory -Confirm
    New-Item "public" -type Directory -Confirm
    New-Item "info.txt" -type file 
    Add-Content info.txt $info 
}

function ffs($program){
    runas $program /user:<DOMAIN\USERNAME>
}

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
