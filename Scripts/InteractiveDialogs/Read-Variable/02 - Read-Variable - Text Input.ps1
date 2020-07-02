# Set up properties for the dialog window
$props = @{
    Title = "Example Window"
    Description = "Lorem ipsum dolor sit amet."
    OkButtonName = "Submit"
    CancelButtonName = "Cancel"
    Width = 500
    Height = 600
    Parameters = @(

        # The "Name" param becomes the addressable variable name in code
        @{ Name = "variableName"; Title = "Example Textbox"; Editor = "text"; }

    )
}

# Display the dialog window to the user
$result = Read-Variable @props

# Exit if anything other than the OkButton is clicked
if ($result -ne "ok") {
    Close-Window
    Exit
}

# Access the values from the form
Write-Host "Example Textbox: $variableName"