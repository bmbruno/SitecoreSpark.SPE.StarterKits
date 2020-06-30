# Set up properties for the dialog window
$props = @{
    Title = "Example Window"
    Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    OkButtonName = "Submit"
    CancelButtonName = "Cancel"
    Width = 500
    Height = 600
    Parameters = @(
        @{ Name = "startItem"; Title = "Root Path"; Editor = "droptree"; Source = "/sitecore/content"; Tab = "Setup" }
        @{ Name = "updateTemplates"; Title = "Update Templates"; Value = $false; Tab = "Setup" }
        @{ Name = "updateComponents"; Title = "Update Components"; Value = $false; Tab = "Setup" }
        @{ Name = "doUpdates"; Title = "Execute Changes"; Value = $false; Tab = "Setup" }
        @{ Name = "detailedLogging"; Title = "Detailed Logging"; Value = $true; Tab = "Config" }
    )
}

$result = Read-Variable @props

if($result -ne "ok") {
    Close-Window
    Exit
}