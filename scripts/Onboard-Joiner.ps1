$firstName = "Emily"
$lastName = "Rhodes"
$username = "emily.rhodes"
$upn = "$username@kennon.tech"
$department = "Marketing"
$ouPath = "OU=_Users,DC=kennontech,DC=local"
$groupName = "IT"

New-ADUser -Name "$firstName $lastName" `
    -GivenName $firstName `
    -Surname $lastName `
    -SamAccountName $username `
    -UserPrincipalName $upn `
    -Path $ouPath `
    -Department $department `
    -Enabled $true `
    -AccountPassword (ConvertTo-SecureString "TempPassword123!" -AsPlainText -Force) `
    -ChangePasswordAtLogon $true

Add-ADGroupMember -Identity $groupName -Members $username

Write-Host "User $firstName $lastName created and added to $groupName group."
