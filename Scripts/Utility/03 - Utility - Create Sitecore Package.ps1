# Choose one of these methods for loading items to the package:
#   1) by path
#   2) by template name
#   3) by template ID
#   ... or write your own logic to populate '$items'

$items = Get-ChildItem -Path 'master:/sitecore/content/mysite' -Recurse
# $items = Get-ChildItem -Path 'master:/sitecore' -Recurse | Where-Object { $_.TemplateName -eq 'TEMPLATE_NAME' }
# $items = Get-ChildItem -Path 'master:/sitecore' -Recurse | Where-Object { $_.TemplateId -eq '{guid}' }

#
# Create (and configure) package and related metadata
#

$package = New-Package -Name 'PACKAGE_NAME'
$package.Metadata.Author = 'PACKAGE_AUTHOR'
$package.Metadata.Version = '1'
$package.Metadata.Readme = 'README_TEXT'

# Create a source for the items
$source = $items | New-ItemSource -Name 'PACKAGE_SOURCE_NAME' -InstallMode Overwrite
$package.Sources.Add($source);

# Create, export, and download the package
$packageFolder = '\App_Data\packages\'

Export-Package -Project $package -Path "$($package.Name).zip" -Zip
Download-File "$packageFolder\$($package.Name).zip"