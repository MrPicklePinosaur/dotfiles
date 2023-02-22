function prompt
{
	Write-Host "PS " -nonewline -foregroundcolor Yellow
	Write-Host (Split-Path -Path (Get-Location) -Leaf) -nonewline -foregroundcolor White
	Write-Host " > " -nonewline -foregroundcolor Yellow

	return " "
}

function Reload-Profile {
    @(
        $Profile.AllUsersAllHosts,
        $Profile.AllUsersCurrentHost,
        $Profile.CurrentUserAllHosts,
        $Profile.CurrentUserCurrentHost
    ) | % {
        if(Test-Path $_){
            Write-Verbose "Running $_"
            . $_
        }
    }    
}

# general terminal config

Set-PSReadlineOption -EditMode vi
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# terminal colors
function Color-Console {
	$Host.ui.rawui.WindowTItle = "PowerShell"
	Clear-Host
}
Color-Console

# Aliases

Set-Alias -Name l -Value ls
function Get-ChildItem-Hidden { ls -Hidden }
Set-Alias -Name la -Value Get-ChildItem-Hidden
Set-Alias -Name c -Value cd
Set-Alias -Name v -Value vim
Set-Alias -Name g -Value git
Set-Alias -Name vxprj -Value C:\WindRiver\vxworks\22.09\source\build\mk\scripts\vxprj



