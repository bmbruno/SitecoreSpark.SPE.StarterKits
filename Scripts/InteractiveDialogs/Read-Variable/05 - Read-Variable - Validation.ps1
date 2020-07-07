# Set up properties for the dialog window
$props = @{
    Title = "Example Window"
    Description = "Lorem ipsum dolor sit amet."
    OkButtonName = "Submit"
    CancelButtonName = "Cancel"
    Width = 500
    Height = 600
    Parameters = @(

        # Displays a textbox; the Mandatory property makes this a required field
        @{ Name = "variableName"; Title = "Example Textbox"; Editor = "text"; Mandatory = $true; }

        # Displays a dropdown to select a single item (returns an Item object)
        @{ Name = "droplistItem"; Title = "Select an Item"; Editor = "droplist"; Source = "/sitecore/content/"; }

        # Displays a treeview of the content tree to select one item (returns an Item object)
        @{ Name = "droptreeItem"; Title = "Select an Item"; Editor = "droptree"; Source = "/sitecore/content"; }


        
    )

    # This properties executes a script block that is used for field validation
    Validation = {



    }
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