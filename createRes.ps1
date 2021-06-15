$rg = 'ybk-arm'
$rgd = 'ybk' 
$rgl = 'northeurope' 
$vmName = 'ybk-vm'
$TIME = Get-Date -UFormat "%Y-%m-%d-%H_%M"
$adminUser = "adminUser" #just for testing
$plainPass = "adminUser!123" #just for testing
$securePass = ConvertTo-SecureString $plainPass -AsPlainText -Force
$storageNum = 2


New-AzResourceGroup `
    -Name $rg `
    -Location $rgl `
    -Force

# storage deployment
for ($i = 0; $i -lt $storageNum ; $i++) {
    New-AzResourceGroupDeployment `
        -Name "$($rgd)$($i)-$($TIME)" `
        -ResourceGroupName $rg `
        -TemplateFile 'storageTemplate.json' `
        -storageName "ybk0$($i)" `

}

# vm deployment
New-AzResourceGroupDeployment `
    -Name "$($rgd)-$($TIME)" `
    -vmName $vmName `
    -ResourceGroupName $rg `
    -TemplateFile 'vm-win-server.json' `
    -AdminUsername $adminUser `
    -adminPassword $securePass


