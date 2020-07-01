# Set up properties for the dialog window
$props = @{
    Title = "Example Window"
    Description = "Lorem ipsum dolor sit amet."
    OkButtonName = "Submit"
    CancelButtonName = "Cancel"
    Width = 500
    Height = 600
    Parameters = @(

        # TODO: text input

        @{ Name = "startItem"; Title = "Root Path"; Editor = "droptree"; }
        @{ Name = "updateTemplates"; Title = "Update Templates"; Value = $false; Tab = "Setup" }
        @{ Name = "updateComponents"; Title = "Update Components"; Value = $false; Tab = "Setup" }
        @{ Name = "doUpdates"; Title = "Execute Changes"; Value = $false; Tab = "Setup" }
        @{ Name = "detailedLogging"; Title = "Detailed Logging"; Value = $true; Tab = "Config" }
    )
}

# Displays the dialog window
$result = Read-Variable @props

# Exit if anything other than the OkButton is clicked
if ($result -ne "ok") {
    Close-Window
    Exit
}