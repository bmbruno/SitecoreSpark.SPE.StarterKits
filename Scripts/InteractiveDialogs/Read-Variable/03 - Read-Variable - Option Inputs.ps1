# Provides values for the dropdown control
$stateList = @{

    'Ohio' = 'OH'
    'Georgia' = 'GA'
    'Kentucky' = 'KY'

}

# Provides values for the radio option control
$cityList = @{

    'Toledo' = 'tol'
    'Atlanta' = 'atl'
    'Louisville' = 'sdf'

}

# Set up properties for the dialog window
$props = @{
    Title = "Example Window"
    Description = "Lorem ipsum dolor sit amet."
    OkButtonName = "Submit"
    CancelButtonName = "Cancel"
    Width = 500
    Height = 600
    Parameters = @(

        @{ Name = "dropdownState"; Title = "Select a State"; Editor = "dropdown"; Options = $stateList; }
        @{ Name = "radioCity"; Title = "Choose a City"; Editor = "radio"; Options = $cityList; }

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
Write-Host "State: $dropdownState"
Write-Host "City: $radioCity"