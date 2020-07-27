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

# InfoTitle: title of the custom information message near the top of the window
# InfoDescription: text for the custom information message (see InfoTitle above)
# MissingDataMessage: message displayed when no results are returned
# Icon: path to an icon file addressable by Sitecore

$items | Show-ListView `
    -Property $props `
    -Title 'Custom Title'
    -InfoTitle 'Example Info Title' `
    -InfoDescription 'Lorem ipsum dolor sit amet.' `
    -MissingDataMessage 'There are no results to display.'
    -Icon 'Applications/16x16/preferences.png'