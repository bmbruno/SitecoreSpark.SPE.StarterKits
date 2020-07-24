# Datasource
$items = Get-ChildItem -Path 'master:/sitecore/content/demosite'

# Configure columns and data mapping
$props = @(     
    @{ Name = "Name"; Expression = { $_.Name } },
    @{ Name = "Display Name"; Expression = { $_.DisplayName } },
    @{ Name = "Full Path"; Expression = { $_.Paths.FullPath } }
    @{ Name = "Path Length"; Expression = { $_.Paths.FullPath.Length } } 
)

# Show list view dialog with custom UI elements defined:

# InfoTitle / InfoDescription: displays a custom informational message near the top of the window
# MissingDataMessage: message displayed when no results are returned

$items | Show-ListView `
    -Property $props `
    -InfoTitle 'Example Info Title' `
    -InfoDescription 'Lorem ipsum dolor sit amet.' `
    -MissingDataMessage 'There are no results to display.'