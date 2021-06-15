$rg = 'ybk-arm'
$rgd = 'ybk-vm-deployment' 
$vmName = 'ybk-vm' `

# getting the storage account context for container creating 
$AzStAcc0 = Get-AzStorageAccount -ResourceGroupName $rg -Name "ybk00"
$AzStAcc1 = Get-AzStorageAccount -ResourceGroupName $rg -Name "ybk01"
$AzStAccCTX0 = $AzStAcc0.context
$AzStAccCTX1 = $AzStAcc1.context

$ScriptPath = './blobs.ps1'
$params=@{
    AzStAccCTX0 = $AzStAccCTX0;
    AzStAccCTX1 = $AzStAccCTX1;
}

Invoke-AzVmRunCommand `
 -ResourceGroupName $rg `
 -Name $vmName `
 -CommandId 'RunPowerShellScript' `
 -ScriptPath $ScriptPath `
 -Parameter $params `
