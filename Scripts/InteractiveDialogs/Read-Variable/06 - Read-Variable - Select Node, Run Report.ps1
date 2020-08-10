# Set up properties for the dialog window
$props = @{
    Title = "Report Name"
    Description = "About this report."
    OkButtonName = "Run Report"
    CancelButtonName = "Cancel"
    Width = 500
    Height = 300
    Parameters = @(

        # Displays a treeview of the content tree to select one item (returns an Item object)
        @{ Name = "startItem"; Title = "Select an Item"; Editor = "droptree"; Source = '/sitecore/content/home' }

    )
}

# Display the dialog window to the user
$result = Read-Variable @props

# Exit if anything other than the OkButton is clicked
if ($result -ne "ok") {
    Close-Window
    Exit
}

# Verify an item was selected
if (-not $startItem)
{
    Write-Host 'Please select an item to continue.'
    Exit
}

# Do something with the selected item
Write-Host "Item path:" $startItem.Paths.FullPath