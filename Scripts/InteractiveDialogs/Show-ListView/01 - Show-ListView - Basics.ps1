# Datasource

# Configure report columns
@props = {

    @{ Name = "First Column Header", Expression = $_.VariableName }

}


# Show list view dialog
Show-ListView -Property `
        @{ Name = "Type"; Expression = { $_.Type } },
        @{ Name = "Item ID"; Expression = { $_.ItemID } },
        @{ Name = "Item Name"; Expression = { $_.PageName } },
        @{ Name = "Old ID"; Expression = { $_.OldID } },
        @{ Name = "New ID"; Expression = { $_.NewID } },
        @{ Name = "Status"; Expression = { $_.Status } }