$location = "https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-py3-win64-latest.exe"
$installerPath = "C:\aws-cfn-bootstrap-py3-win64-latest.exe"
$installDir = "C:\aws-cfn-bootstrap"

Invoke-WebRequest -Uri $location -OutFile $installerPath

# Run the installer silently
Start-Process -FilePath $installerPath -ArgumentList "/S" -Wait

# Set the installation directory
$env:AWS_CFN_HOME = $installDir

# Add the installation directory to the system PATH
$oldPath = [Environment]::GetEnvironmentVariable("PATH", "Machine")
$newPath = "$oldPath;$installDir"
[Environment]::SetEnvironmentVariable("PATH", $newPath, "Machine")
