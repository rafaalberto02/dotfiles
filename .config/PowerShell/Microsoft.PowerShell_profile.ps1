# PSReadLine is auto-loaded in interactive hosts; configure only.
if ($Host.Name -ne 'ServerRemoteHost') {
    try {
        if ($Host.UI.SupportsVirtualTerminal) {
            Set-PSReadLineOption -PredictionSource History
        }
        Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
        Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
        Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
    } catch {
        # Non-interactive / redirected hosts may not support PSReadLine options.
    }
}

# Lazy-load Terminal-Icons on first directory listing.
$ExecutionContext.InvokeCommand.PreCommandLookupAction = {
    param($CommandName, $EventArgs)
    if ($CommandName -in @('Get-ChildItem', 'ls', 'dir', 'gci')) {
        $ExecutionContext.InvokeCommand.PreCommandLookupAction = $null
        Import-Module Terminal-Icons -ErrorAction SilentlyContinue
    }
}

$script:PoshGitLoaded = $false

function script:Test-InGitRepository {
    $p = $PWD.ProviderPath
    while ($true) {
        if (Test-Path -LiteralPath (Join-Path $p '.git')) {
            return $true
        }
        $parent = Split-Path -Path $p -Parent
        if ([string]::IsNullOrEmpty($parent) -or $parent -eq $p) {
            return $false
        }
        $p = $parent
    }
}

function script:Import-PoshGitOnce {
    if (-not $script:PoshGitLoaded) {
        Import-Module posh-git
        $global:GitPromptSettings.AnsiConsole = $true
        $script:PoshGitLoaded = $true
    }
}

function prompt {
    $path = $PWD.Path.Replace($HOME, '~')
    $git = ''
    if (Test-InGitRepository) {
        Import-PoshGitOnce
        $git = Write-VcsStatus
    }
    "`n`e[92;1m$path`e[0m$git`n`$ "
}

$ENV:FZF_DEFAULT_OPTS = @"
    --color=fg:#908caa,bg:#191724,hl:#ebbcba
    --color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
    --color=border:#403d52,header:#31748f,gutter:#191724
    --color=spinner:#f6c177,info:#9ccfd8
    --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa
"@
