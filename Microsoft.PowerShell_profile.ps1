# Add them OhMyPosh
# & ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\clean-detailed.omp.json" --print) -join "`n"))
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\clean-detailed.omp.json" | Invoke-Expression

# Add icons to `ls` and `dir` file lists
# Don't have it? Install using this command:
# Install-Module -Name Terminal-Icons -Repository PSGallery
Import-Module -Name Terminal-Icons

# Add auto complete (requires PSReadline 2.2.0-beta1+ prerelease)
# Don't have it? Install using this command:
# Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# Fuzzy finder
Import-Module PSFzf
Set-PsFzfOption -PsReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'


# Alias (Optional)
Set-Alias ip ipconfig
Set-Alias g git
Set-Alias ll ls
Set-Alias grep findstr

# Ultilities (Optional)
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Kubectl autocompletion
kubectl completion powershell | Out-String | Invoke-Expression


Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
