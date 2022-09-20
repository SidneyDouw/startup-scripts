$startup_scripts_folder = "C:\\.startup-scripts"

git clone https://github.com/SidneyDouw/startup-scripts.git "$startup_scripts_folder" --depth 1
Set-Location "$startup_scripts_folder/windows"

./chocolatey.ps1