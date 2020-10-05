# Datasource
$items = Get-ChildItem -Path 'master:/sitecore/content/demosite'

# Create a list of generic objects to store output data; for production code, consider using strongly-typed objects with properties/fields
$results = New-Object System.Collections.Generic.List[System.Object]

foreach ($item in $items)
{
    $results.Add(@{ Name = $item.Name; DisplayName = $item.DisplayName; FullPath = $item.FullPath; PathLength = $item.Paths.FullPath.Length })
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