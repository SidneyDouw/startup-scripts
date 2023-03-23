# Add new local user, add him to Administrators
param ( [string]$username, [string]$password)

$home_dir = "C:\Users\$username"
$secure_password = ConvertTo-SecureString $password -AsPlainText -Force

New-LocalUser $username -Password $secure_password
Set-LocalUser -Name $username -PasswordNeverExpires 1
Add-LocalGroupMember -Group "Administrators" -Member $username

$cred = New-Object System.Management.Automation.PSCredential -ArgumentList $username,$secure_password
Start-Process cmd /c -WindowStyle Hidden -Credential $cred -ErrorAction SilentlyContinue
