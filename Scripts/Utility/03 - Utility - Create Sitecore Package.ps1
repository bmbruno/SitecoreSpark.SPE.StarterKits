# Load items to include in the package; use Where-Object to filter down select
# A couple of Where-Object clauses are provided below

$items = Get-ChildItem -Path 'master:/sitecore/content' -Recurse
# | Where-Object { $_.TemplateName -eq 'TEMPLATE_NAME' }
# | Where-Object { $_.TemplateId -eq '{guid}' }

Write-Host "Found $($items.Count) items for package."

# Create (and configure) package and related metadata
$package = New-Package -Name 'PACKAGE_NAME'
$package.Metadata.Author = 'PACKAGE_AUTHOR'
$package.Metadata.Version = '1'
$package.Metadata.Readme = 'README_TEXT'

# Create a source for the items
$source = $items | New-ExplicitItemSource -Name 'PACKAGE_SOURCE_NAME' -InstallMode Overwrite
$package.Sources.Add($source)

# Create, export, and download the package
Export-Package -Project $package -Path "$($package.Name).zip" -Zip
Download-File "$SitecorePackageFolder\$($package.Name).zip"