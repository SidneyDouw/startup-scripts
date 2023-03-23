# Add new local user, add him to Administrators
param ( [string]$username, [string]$password)

$home_dir = "C:\Users\$username"

New-LocalUser $username -Password (ConvertTo-SecureString $password -AsPlainText -Force)
New-Item -Path $home_dir -ItemType Directory
Set-LocalUser -Name $username -PasswordNeverExpires 1 -HomeDirectory $home_dir
Add-LocalGroupMember -Group "Administrators" -Member $username
