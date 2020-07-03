# Set up properties for the dialog window
$props = @{
    Title = "Example Window"
    Description = "Lorem ipsum dolor sit amet."
    OkButtonName = "Submit"
    CancelButtonName = "Cancel"
    Width = 500
    Height = 600
    Parameters = @(

        #
        @{ Name = "droplistItem"; Title = "Select an Item"; Editor = "droplist"; Source = "/sitecore/content"; }

        #
        @{ Name = "droptreeItem"; Title = "Select an Item"; Editor = "droptree"; Source = "/sitecore/content"; }

        #
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
Write-Host "droplistItem: $droplistItem"
Write-Host "droptreeItem: $droptreeItem"
Write-Host "treelistItem: $treelistItem"