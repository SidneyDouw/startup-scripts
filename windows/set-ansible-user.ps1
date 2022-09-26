# Add new local user, add him to Administrators

# $username = "${ANSIBLE_USER}"
# $password = "${ANSIBLE_PASSWORD}"

# New-LocalUser $username -Password (ConvertTo-SecureString $password -AsPlainText -Force)
# Set-LocalUser -Name $username -PasswordNeverExpires 1
# Add-LocalGroupMember -Group "Administrators" -Member $username

# setup winrm listeners
# https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html#winrm-setup
# disable basic auth, use default (ntlm) instead

$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file -DisableBasicAuth
