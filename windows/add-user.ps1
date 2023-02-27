# Add new local user, add him to Administrators
# TODO: parameterize
$username = "user"
$password = "Password#"

New-LocalUser $username -Password (ConvertTo-SecureString $password -AsPlainText -Force)
Set-LocalUser -Name $username -PasswordNeverExpires 1
Add-LocalGroupMember -Group "Administrators" -Member $username