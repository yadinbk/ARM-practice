$rg = 'ybk-arm'
$rgd = 'ybk-storage-deployment' 
$TIME = Get-Date -UFormat "%Y-%m-%d-%H_%M"

New-AzResourceGroup `
-Name $rg `
-Location northeurope `
-Force

New-AzResourceGroupDeployment `
-Name "$($rgd)-$($TIME)" `
-ResourceGroupName $rg `
-TemplateFile 'storageTemplate.json' `
-storageName 'ybk02' `
-storageSKU 'Standard_GRS'