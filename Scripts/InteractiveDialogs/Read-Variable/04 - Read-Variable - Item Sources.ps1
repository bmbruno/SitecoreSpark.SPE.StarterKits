# Set up properties for the dialog window
$props = @{
    Title = "Example Window"
    Description = "Lorem ipsum dolor sit amet."
    OkButtonName = "Submit"
    CancelButtonName = "Cancel"
    Width = 500
    Height = 600
    Parameters = @(

        # Displays a dropdown to select a single item (returns an Item object)
        # Source path determines how many subitems are in list:
        #   No trailing slash (/sitecore/content) only loads immediate children
        #   Trailing slash (/sitecore/content/) includes all subchildren
        @{ Name = "droplistItem"; Title = "Select an Item"; Editor = "droplist"; Source = "/sitecore/content/"; }

        # Displays a treeview of the content tree to select one item (returns an Item object)
        @{ Name = "droptreeItem"; Title = "Select an Item"; Editor = "droptree"; Source = "/sitecore/content"; }

        # Display a multi-select field (returns an array of Item objects)
        @{ Name = "treelistItem"; Title = "Select an Item"; Editor = "treelist"; Source = "/sitecore/content"; }
        
    )
}

# Displays the dialog window
$result = Read-Variable @props

# Exit if anything other than the OkButton is clicked
if ($result -ne "ok") {
    Close-Window
    Exit
}

# Access the values from the form 
if ($droplistItem) { Write-Host "droplistItem:" $droplistItem.Name }

if ($droptreeItem) { Write-Host "droptreeItem:" $droptreeItem.Name }

if ($treelistItem)
{
    Write-Host 'TreeList item(s):'
    foreach ($item in $treelistItem)
    {
        Write-Host " " $item.Name
    }
}