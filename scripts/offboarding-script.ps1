$username = "emily.rhodes"
$disabledOU = "OU=_DisabledUsers,DC=kennontech,DC=local"

# Stage 1: Disable the account
Disable-ADAccount -Identity $username

# Stage 2: Move to Disabled Users OU
$user = Get-ADUser -Identity $username
Move-ADObject -Identity $user.DistinguishedName -TargetPath $disabledOU

# Stage 3: Strip all group memberships (run independently so a failed move doesn't block this)
$groups = Get-ADUser -Identity $username -Properties MemberOf | Select-Object -ExpandProperty MemberOf
foreach ($group in $groups) {
    Remove-ADGroupMember -Identity $group -Members $username -Confirm:$false
}

Write-Host "User $username has been disabled, moved to _DisabledUsers OU, and removed from all groups."
