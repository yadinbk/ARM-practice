$rg = 'ybk-arm'
$fileNum = 5 #can be 100
$container1 = "test1"
$container2 = "test2"

# getting the storage account context for container creating 
$AzStAcc0 = Get-AzStorageAccount -ResourceGroupName $rg -Name "ybk00"
$AzStAcc1 = Get-AzStorageAccount -ResourceGroupName $rg -Name "ybk01"
$AzStAccCTX0 = $AzStAcc0.context
$AzStAccCTX1 = $AzStAcc1.context

# creating containers 
New-AzStorageContainer -Name $container1 -Context $AzStAccCTX0 -Permission blob
New-AzStorageContainer -Name $container2 -Context $AzStAccCTX1 -Permission blob

for ($i=0; $i -lt $fileNum ; $i++){
    Set-AzStorageBlobContent -File $("C:\Users\yadin\Desktop\blobs\b0 - Copy ($($i)).jpg") `
    -Container $container1 `
    -Blob $("Image$($i).jpg") `
    -Context $AzStAccCTX0 `
}

# Get all blobs in a container and copy them
Get-AzureStorageBlob -Container $container1 | Start-AzureStorageBlobCopy -DestContainer $container2

