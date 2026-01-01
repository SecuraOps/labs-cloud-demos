Install-Module Az -Scope CurrentUser -Force
Connect-AzAccount

# a) Create Storage Account
$ResourceGroup = "rg-demo"
$StorageAccount = "staccdemo"
$Location = "westeurope"
$Sku = "Standard_GZRS"   # Standard_LRS | Standard_ZRS | Standard_GRS | Standard_GZRS

New-AzStorageAccount `
  -ResourceGroupName $ResourceGroup `
  -Name $StorageAccount `
  -Location $Location `
  -SkuName $Sku `
  -Kind StorageV2 `
  -EnableHttpsTrafficOnly $true `
  -MinimumTlsVersion TLS1_2

# b) Update Replication Strategy
Set-AzStorageAccount `
  -ResourceGroupName $ResourceGroup `
  -Name $StorageAccount `
  -SkuName $Sku
