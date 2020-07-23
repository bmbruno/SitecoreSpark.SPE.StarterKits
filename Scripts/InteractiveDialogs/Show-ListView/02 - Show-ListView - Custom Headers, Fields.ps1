# Datasource
$items = Get-ChildItem -Path 'master:/sitecore/content/demosite'

# Configure columns and data mapping
$props = @(     
    @{ Name = "Name"; Expression = { $_.Name } },
    @{ Name = "Display Name"; Expression = { $_.DisplayName } },
    @{ Name = "Full Path"; Expression = { $_.Paths.FullPath } }
    @{ Name = "Path Length"; Expression = { $_.Paths.FullPath.Length } } 
)

# Show list view dialog with custom headers and values
$items | Show-ListView `
    -InfoDescription 'This is an informational message' `
    -Property $props