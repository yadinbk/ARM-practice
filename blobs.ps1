Param(
    [string] $AzStAccCTX0,
    [string] $AzStAccCTX1
)

$fileNum = 30
$containerName = "test"

# cant recognize Az command
Install-Module -Name AzureRM -AllowClobber -Force

New-AzStorageContainer -Name $containerName -Context $ctx -Permission blob


for ($i=0; $i -lt $fileNum ; $i++){
    Set-AzStorageBlobContent -File $("C:\Users\yadin\Desktop\blobs\b0 - Copy ($($i)).jpg") `
    -Container $containerName `
    -Blob $("Image$($i).jpg") `
    -Context $AzStAccCTX0 
}

