$rg = 'ybk-arm'
$vmd = 'ybkVm' 
$TIME = Get-Date -UFormat "%Y-%m-%d-%H_%M"
$location = "northeurope"

# $storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroup `
#   -Name "mystorageaccount" `
#   -SkuName Standard_LRS `
#   -Location $location `

# $ctx = $storageAccount.Context

New-AzVm `
-ResourceGroupName $rg `
-Name $vmd `
-Location $location `
-VirtualNetworkName "$($vmd)-Vnet" `
-SubnetName "$($vmd)-subnet" `
-SecurityGroupName "$($vmd)-NetworkSecurityGroup" `
-PublicIpAddressName "$($vmd)-PublicIpAddress" `
-OpenPorts 80,3389
