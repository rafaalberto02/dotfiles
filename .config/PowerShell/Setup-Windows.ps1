#Requires -Version 7
param(
    [string] $DotfilesRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
)

$ErrorActionPreference = 'Stop'

$Junctions = @(
    @{
        Name   = 'nvim'
        Link   = '{LOCALAPPDATA}\nvim'
        Target = '.config\nvim'
    }
    @{
        Name   = 'PowerShell'
        Link   = '{MyDocuments}\PowerShell'
        Target = '.config\PowerShell'
    }
)

function Expand-LinkTemplate([string] $Template) {
    $map = @{
        '{LOCALAPPDATA}' = $env:LOCALAPPDATA
        '{APPDATA}'      = $env:APPDATA
        '{USERPROFILE}'  = $env:USERPROFILE
        '{HOME}'         = $HOME
        '{MyDocuments}'  = [Environment]::GetFolderPath('MyDocuments')
    }
    $out = $Template
    foreach ($k in $map.Keys) {
        $out = $out.Replace($k, $map[$k])
    }
    return $out
}

foreach ($e in $Junctions) {
    $link = Expand-LinkTemplate $e.Link
    $target = (Resolve-Path (Join-Path $DotfilesRoot $e.Target)).Path

    if (Test-Path -LiteralPath $link) {
        Write-Host "Skip $($e.Name) (exists)"
        continue
    }

    New-Item -ItemType Junction -Path $link -Target $target | Out-Null
    Write-Host "Linked $($e.Name)"
}
