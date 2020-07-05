# Set up properties for the dialog window
$props = @{
    Title = "Example Window"
    Description = "Lorem ipsum dolor sit amet."
    OkButtonName = "Submit"
    CancelButtonName = "Cancel"
    Width = 500
    Height = 600
    Parameters = @(

        # Displays a treeview of the content tree to select one item (returns an Item object)
        @{ Name = "droptreeItem"; Title = "Select an Item"; Editor = "droptree"; Source = "/sitecore/content"; }

    )
}

# Display the dialog window to the user
$result = Read-Variable @props

# Exit if anything other than the OkButton is clicked
if ($result -ne "ok") {
    Close-Window
    Exit
}

# $result from the Read-Variable cmdlet will either be 'ok' or 'cancel'
Write-Host $result