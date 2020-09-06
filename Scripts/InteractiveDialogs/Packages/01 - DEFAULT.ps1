# Set up properties for the dialog window
$props = @{
    Title = "Example Window"
    Description = "Lorem ipsum dolor sit amet."
    OkButtonName = "Submit"
    CancelButtonName = "Cancel"
    Width = 500
    Height = 300
    Parameters = @(

        # You can add parameters here to define inputs/labels/controls for the form

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