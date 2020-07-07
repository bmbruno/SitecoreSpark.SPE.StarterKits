# Set up properties for the dialog window
$props = @{
    Title = "Example Window"
    Description = "Lorem ipsum dolor sit amet."
    OkButtonName = "Submit"
    CancelButtonName = "Cancel"
    Width = 500
    Height = 600
    Parameters = @(

        # FIELD VALIDATION: the Mandatory property makes this a required field
        @{ Name = "itemName"; Title = "Example Textbox"; Editor = "text"; Mandatory = $true; }

        # 'Mandatory' is also applied on this droplist
        @{ Name = "droplistItem"; Title = "Select an Item"; Editor = "droplist"; Source = "/sitecore/content/"; Mandatory = $true; }
        
    )

    # ADVANCED VALIDATION: This property executes a script block that is used for custom field validation
    Validator = {

        # Access the value of 'droplistItem' defined above in 'Parameters'; verify that it's a certain template
        if ($variables.droplistItem.Value.TemplateName -ne 'Webpage') {
            $variables.droplistItem.Error = "You must choose a webpage item."
        }

    }
}

# Displays the dialog window
$result = Read-Variable @props

# Exit if anything other than the OkButton is clicked
if ($result -ne "ok") {
    Close-Window
    Exit
}