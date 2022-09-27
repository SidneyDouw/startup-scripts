# Add new local user, add him to Administrators
$username = "user"
$password = "password"

New-LocalUser $username -Password (ConvertTo-SecureString $password -AsPlainText -Force)
Set-LocalUser -Name $username -PasswordNeverExpires 1
Add-LocalGroupMember -Group "Administrators" -Member $username