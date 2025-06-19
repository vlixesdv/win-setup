oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/craver.omp.json" | Invoke-Expression

Import-Module posh-git
Import-Module Terminal-Icons

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Import-Module PSFzf
Set-PsFzfOption -PsReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'