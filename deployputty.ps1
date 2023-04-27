# az vm extension set --resource-group 'Rg-poc-bot' --vm-name vm-windows-putty --name customScript --publisher Microsoft.Azure.Extensions --settings '{"fileUris":["https://raw.githubusercontent.com/Azure-Samples/compute-automation-configurations/master/automate-putty-on-linux/automate-putty.sh"],"commandToExecute":"./automate-putty.sh"}'

# az vm extension set --resource-group Rg-poc-bot --vm-name vm-windows-putty --name CustomScript --publisher Microsoft.Azure.Extensions --settings '{"fileUris":["https://raw.githubusercontent.com/Azure-Samples/compute-automation-configurations/master/automate-putty-on-windows/automate-putty.sh"],"commandToExecute":"./automate-putty.sh"}'



# You can save this script as a .ps1 file and then upload it to an Azure storage account or GitHub repository1.

# To use the Custom Script extension with Azure Cloud Shell, you can use the following command:

# az vm extension set \
#   --resource-group myResourceGroup \
#   --vm-name myVM \
#   --name CustomScriptExtension \
#   --publisher Microsoft.Compute \
#   --version 1.9 \
#   --settings '{"fileUris":["https://<storage-account-name>.blob.core.windows.net/<container-name>/<file-name>.ps1"],"commandToExecute":"powershell.exe -ExecutionPolicy Unrestricted -File <file-name>.ps1"}'

$source = "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.78-installer.msi"
$destination = "C:\putty-64bit-0.76-installer.msi"
Invoke-WebRequest -Uri $source -OutFile $destination
$arguments = "/i $destination /quiet /norestart"
Start-Process msiexec.exe -ArgumentList $arguments -Wait