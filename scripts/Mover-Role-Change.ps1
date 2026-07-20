$username = "emily.rhodes"
$oldGroup = "IT"
$newGroup = "Finance"
$newDepartment = "Finance"
$newTitle = "Financial Analyst"

Remove-ADGroupMember -Identity $oldGroup -Members $username -Confirm:$false
Add-ADGroupMember -Identity $newGroup -Members $username

Set-ADUser -Identity $username -Department $newDepartment -Title $newTitle

Write-Host "User $username moved from $oldGroup to $newGroup. Department and title updated."
