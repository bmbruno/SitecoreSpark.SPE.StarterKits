# Set up properties for the dialog window
$props = @{
    Title = "Archive Item Versions"
    Description = "Keep the most-recent versions of items for a given subtree."
    OkButtonName = "Submit"
    CancelButtonName = "Cancel"
    Width = 500
    Height = 300
    Parameters = @(

        # Root item in the content tree to start from; this will be fully recursive
        @{ Name = "startItem"; Title = "Select a Start Item"; Editor = "droptree"; Source = '/sitecore/content'; Mandatory = $true }

        # Number of item versions to keep; defaults to 10
        @{ Name = "numVersionsToKeep"; Title = "Number of versions to keep"; Editor = "text"; Value = "10"; Mandatory = $true }

        # Source database; defaults to 'master'
        @{ Name = "sourceDatabase"; Title = "Database"; Editor = "text"; Value = "master"; Mandatory = $true }

        # Archive name; defaults to Sitecore's standard 'archive'
        @{ Name = "archiveName"; Title = "Archive name"; Editor = "text"; Value = "archive"; Mandatory = $true }

    )
}

# Display the dialog window to the user
$result = Read-Variable @props

# Exit if anything other than the OkButton is clicked
if ($result -ne "ok") {
    Close-Window
    Exit
}

$allItems = Get-ChildItem -Path "${sourceDatabase}:" -ID $startItem.ID -Recurse
$allItems += Get-Item -Path "${sourceDatabase}:" -ID $startItem.ID

foreach ($item in $allItems)
{
    Write-Host '---------------------------------------------------------'
    Write-Host "ITEM:" $item.ID
    Write-Host '---------------------------------------------------------'
    
    $itemID = $item.ID
    $archive = [Sitecore.Data.Archiving.ArchiveManager]::GetArchive($archiveName, $item.Database)
    
    # Calculate item versions start/end numbers
    $allVersionNumbers = $item.Versions.GetVersionNumbers()
    $maxVersionPosition = $allVersionNumbers.Count - ($numVersionsToKeep + 1)

    if ($allVersionNumbers.Count -gt $numVersionsToKeep)
    {
        for ($pos = 0; $pos -le $maxVersionPosition; $pos++)
        {
            $itemVersion = Get-Item -Path "${sourceDatabase}:" -ID $item.ID -Version $allVersionNumbers[$pos].Number
            
            if ($itemVersion)
            {
                $archive.ArchiveVersion($itemVersion)
                Write-Host "ARCHIVED - ID: $($itemVersion.ID) Name: $($itemVersion.Name) Version: $($itemVersion.Version)"
            }
            else
            {
                Write-Host "Version ($currentVersion) not found for item" $item.ID
            }
        }
    }
    else
    {
        Write-Host "Fewer than $numVersionsToKeep versions for item $itemID; no need to archive."
    }
}