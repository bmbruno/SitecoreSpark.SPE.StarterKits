# Items for the template update - use a Where-Object cmdlet to filter this if needed
$items = Get-ChildItem -Path 'master:/sitecore/content/mysite' -Recurse

# A hashtable (of item IDs) that stores hashtables of fields & values
$storage = @{}

#
# 1) Store existing fields
#

foreach ($item in $items)
{
    # Populate existing field values for this item
    $fields = @{}
    
    foreach ($field in $item.Fields)
    {
        $fields[$field.Name] = $item[$Field.Name]
    }
    
    $storage[$item.ID] = $fields
    
}

#
# 2) Update base templates
#

$itemTemplate = Get-Item -Path 'master:' -ID 'B3B7C30F-415E-4FBD-A88D-BFDD4A4A31F7'

# This example updates the base templates of an item
$itemTemplate.Editing.BeginEdit()
$itemTemplate["__Base template"] = '296B04C0-02E0-4758-8F03-7E6ABB561D44|5BF8C439-F7E7-458C-9520-DFC7FF816ECF'
$itemTemplate.Editing.EndEdit()

#
# 3) Write values back to items
#

foreach ($item in $items)
{
    $fields = $storage[$item.ID]
    
    $item.Editing.BeginEdit()
    
    foreach ($field in $item.Fields)
    {
        $item[$Field.Name] = $fields[$field.Name]
    }
    
    $item.Editing.EndEdit()
}