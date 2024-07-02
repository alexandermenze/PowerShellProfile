### Fancy meta information
oh-my-posh init pwsh | Invoke-Expression

### Installed real curl (avoid Invoke-Request)
Remove-Item alias:curl

### Kubernetes Shortcut 'k'
Set-Alias -Name k -Value kubectl
kubectl completion powershell | Out-String | Invoke-Expression
Register-ArgumentCompleter -CommandName k -ScriptBlock $__kubectlCompleterBlock

### Alias docker to podman (mainly for lazydocker)
Set-Alias -Name docker -Value podman


# Alias l -> ls (linux like)
Set-Alias -Name l -Value ls

# Linux like auto complete

### Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

### Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward


# Emulate the linux watch command
function Watch-Command {
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$Command,
        [int]$Interval = 2
    )

    while ($true) {
        Clear-Host
        Invoke-Expression $Command
        Start-Sleep -Seconds $Interval
    }
}

