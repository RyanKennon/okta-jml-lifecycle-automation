$csvPath = "C:\Users\userryan\Desktop\jml-batch.csv"
$rows = Import-Csv -Path $csvPath
$ouPath = "OU=_Users,DC=kennontech,DC=local"
$disabledOU = "OU=_DisabledUsers,DC=kennontech,DC=local"

foreach ($row in $rows) {
    try {
        switch ($row.Action) {
            "Joiner" {
                New-ADUser -Name "$($row.FirstName) $($row.LastName)" `
                    -GivenName $row.FirstName `
                    -Surname $row.LastName `
                    -SamAccountName $row.Username `
                    -UserPrincipalName "$($row.Username)@kennon.tech" `
                    -Path $ouPath `
                    -Department $row.Department `
                    -Title $row.Title `
                    -Enabled $true `
                    -AccountPassword (ConvertTo-SecureString "TempPassword123!" -AsPlainText -Force) `
                    -ChangePasswordAtLogon $true
                Add-ADGroupMember -Identity $row.NewGroup -Members $row.Username
                Write-Host "[SUCCESS] Joiner: $($row.Username) created and added to $($row.NewGroup)."
            }
            "Mover" {
                Remove-ADGroupMember -Identity $row.OldGroup -Members $row.Username -Confirm:$false
                Add-ADGroupMember -Identity $row.NewGroup -Members $row.Username
                Set-ADUser -Identity $row.Username -Department $row.Department -Title $row.Title
                Write-Host "[SUCCESS] Mover: $($row.Username) moved from $($row.OldGroup) to $($row.NewGroup)."
            }
            "Leaver" {
                Disable-ADAccount -Identity $row.Username
                $user = Get-ADUser -Identity $row.Username
                Move-ADObject -Identity $user.DistinguishedName -TargetPath $disabledOU
                $groups = Get-ADUser -Identity $row.Username -Properties MemberOf | Select-Object -ExpandProperty MemberOf
                foreach ($group in $groups) {
                    Remove-ADGroupMember -Identity $group -Members $row.Username -Confirm:$false
                }
                Write-Host "[SUCCESS] Leaver: $($row.Username) disabled and offboarded."
            }
            default {
                Write-Host "[SKIPPED] Unknown action '$($row.Action)' for $($row.Username)."
            }
        }
    }
    catch {
        Write-Host "[FAILED] $($row.Action) for $($row.Username): $($_.Exception.Message)"
    }
}
