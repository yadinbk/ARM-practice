$rg = 'ybk-arm'
$rgd = 'ybk-vm-deployment' 
$TIME = Get-Date -UFormat "%Y-%m-%d-%H_%M"
$adminUser = "adminUser"
$plainPass = "adminUser!123"
$securePass = ConvertTo-SecureString $plainPass -AsPlainText -Force

New-AzResourceGroup `
-Name $rg `
-Location northeurope `
-Force

New-AzResourceGroupDeployment `
-Name "$($rgd)-$($TIME)" `
-ResourceGroupName $rg `
-TemplateFile 'vm-win-server.json' `
-AdminUsername $adminUser `
-adminPassword $securePass