$startup_scripts_folder = "C:\\.startup-scripts"

git clone https://github.com/SidneyDouw/startup-scripts.git "$startup_scripts_folder" --depth 1
# sudo chown -R ubuntu:ubuntu "$startup_scripts_folder"

Set-Location "$startup_scripts_folder/windows"
# ./updates.sh

./test.ps1

# sudo reboot