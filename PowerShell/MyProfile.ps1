$userdir = join-path $Env:userprofile "Documents\WindowsPowerShell\"
. (Join-Path $userdir 'profile.ps1')

Import-Module 'C:\tools\poshgit\posh-git-0.7.1\src\posh-git.psd1'





Import-Module 'C:\src\Admin\tools\HubDevCli.psm1'

# oh-my-posh https://github.com/JanDeDobbeleer/oh-my-posh
# oh-my-posh requires powerline fonts https://github.com/powerline/fonts
Import-Module oh-my-posh
# Favourinte themes Sorin, Paradox
Set-Theme Paradox


function Hub {
    param (
        [bool] $showBuildTime
    )

    & "C:\src\Admin\ci.cmd" rundevserver
    & "C:\src\Admin\ci.cmd" rundevclient
}

function Stop-AzureStorageEmulator {
    Write-Output "Stopping Azure Storage emulator..."
    Start-Process -FilePath "C:\Program Files (x86)\Microsoft SDKs\Azure\Storage Emulator\AzureStorageEmulator.exe" -ArgumentList "stop"
}

function Start-AzureStorageEmulator {
    Write-Output "Starting Azure Storage emulator..."
    Start-Process -FilePath "C:\Program Files (x86)\Microsoft SDKs\Azure\Storage Emulator\AzureStorageEmulator.exe" -ArgumentList "start"
}

function Stop-CosmosDBEmulator {
    Write-Output "Stopping Cosmos DB emulator..."
    Start-Process -FilePath "C:\Program Files\Azure Cosmos DB Emulator\Microsoft.Azure.Cosmos.Emulator.exe" -ArgumentList "/Shutdown"
}

function Start-CosmosDBEmulator {
    Write-Output "Starting Cosmos DB emulator..."
    Start-Process -FilePath "C:\Program Files\Azure Cosmos DB Emulator\Microsoft.Azure.Cosmos.Emulator.exe" -ArgumentList "/NoExplorer"
}

function Stop-AzureEmulators {
    Stop-CosmosDBEmulator
    Stop-AzureStorageEmulator
}

function Start-AzureEmulators {
            Start-CosmosDBEmulator
            Start-AzureStorageEmulator
}

function ReStart-AzureEmulators {
            Stop-AzureEmulators
            Start-AzureEmulators
}

function Open-RiskManagementServiceBus {
    explorer "C:\src\cdh\data\sb\topics\riskmanagement\coredevhub"
    explorer "C:\src\cdh\data\sb\topics\riskmanagement\riskmanagementservice"
    explorer "C:\src\cdh\data\sb\topics\riskmanagement\corewhqhub"
}
