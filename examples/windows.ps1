<powershell>

# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install -y git

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

$startup_scripts_folder = "C:\\.startup-scripts"
git clone https://github.com/SidneyDouw/startup-scripts.git "$startup_scripts_folder" --depth 1
Set-Location "$startup_scripts_folder/windows"

./add-user.ps1

</powershell>
