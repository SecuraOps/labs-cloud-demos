Install-Module Az -Scope CurrentUser -Force
Connect-AzAccount

# a) Generate Account SAS
$ResourceGroup = "rg-demo"
$StorageAccount = "staccdemo"
$Expiry = (Get-Date).AddDays(1).ToUniversalTime()
$Permissions = "rwdl"  # read, write, delete, list

$SasToken = New-AzStorageAccountSASToken `
  -ResourceGroupName $ResourceGroup `
  -Name $StorageAccount `
  -Service Blob `
  -ResourceType Service,Container,Object `
  -Permission $Permissions `
  -ExpiryTime $Expiry `
  -Protocol HttpsOnly

Write-Host "SAS Token: $SasToken"

# b) Generate Container SAS
$StorageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $ResourceGroup -Name $StorageAccount)[0].Value
$Context = New-AzStorageContext -StorageAccountName $StorageAccount -StorageAccountKey $StorageAccountKey
$ContainerName = "mycontainer"

$SasToken = New-AzStorageContainerSASToken `
  -Name $ContainerName `
  -Context $Context `
  -Permission "rwdl" `
  -ExpiryTime $Expiry

Write-Host "Container SAS URL: https://$StorageAccount.blob.core.windows.net/$ContainerName?$SasToken"
