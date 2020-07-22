# Datasource
$items = Get-ChildItem -Path 'master:/sitecore/content/demosite'

# Show list view dialog with custom headers and values
$items | Show-ListView -Property `
    @{ Name = "Name"; Expression = { $_.Name } },
    @{ Name = "Display Name"; Expression = { $_.DisplayName } },
    @{ Name = "Full Path"; Expression = { $_.Paths.FullPath } }
    @{ Name = "Path Length"; Expression = { $_.Paths.FullPath.Length } }