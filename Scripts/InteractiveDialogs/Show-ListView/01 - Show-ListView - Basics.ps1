# Get data from content tree
$items = Get-ChildItem -Path 'master:/sitecore/content/demosite'

# Show list view dialog with field names from the items
$items | Show-ListView -Property Name, TemplateName, FullPath