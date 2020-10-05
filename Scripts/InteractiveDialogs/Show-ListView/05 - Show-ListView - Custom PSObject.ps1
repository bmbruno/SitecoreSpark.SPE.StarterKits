# Datasource
$items = Get-ChildItem -Path 'master:/sitecore/content/demosite'

# Create an array of objects, iterate over all items, and add custom PSObjects to the array
$results = @()

foreach ($item in $items)
{
    $results += New-Object -TypeName PSObject -Property @{ Name = $item.Name; DisplayName = $item.DisplayName; FullPath = $item.FullPath; PathLength = $item.Paths.FullPath.Length }
}

# Configure columns and data mapping
$props = @(     
    @{ Name = "Name"; Expression = { $_.Name } },
    @{ Name = "Display Name"; Expression = { $_.DisplayName } },
    @{ Name = "Full Path"; Expression = { $_.FullPath } }
    @{ Name = "Path Length"; Expression = { $_.PathLength } } 
)

# Show list view dialog
$results | Show-ListView -Property $props