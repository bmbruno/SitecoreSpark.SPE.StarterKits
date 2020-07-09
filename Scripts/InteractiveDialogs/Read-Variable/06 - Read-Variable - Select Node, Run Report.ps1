# Default path where the droptree should begin
$startSource = '/sitecore/content/home'

# Set up properties for the dialog window
$props = @{
    Title = "Report Name"
    Description = "About this report."
    OkButtonName = "Run Report"
    CancelButtonName = "Cancel"
    Width = 500
    Height = 600
    Parameters = @(

        # Displays a treeview of the content tree to select one item (returns an Item object)
        @{ Name = "startItem"; Title = "Select an Item"; Editor = "droptree"; Source = $startSource }

        # 
        @{ Name = ""; Title = "Execute Updates"; Editor = "check"; Value = $false }

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
