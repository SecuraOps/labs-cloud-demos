Install-Module Az -Scope CurrentUser -Force
Connect-AzAccount
Set-AzContext -Subscription "<SUBSCRIPTION_ID>"

$ResourceGroup = "rg-demo"
$ResourceName = "myVM"
$ResourceType = "Microsoft.Compute/virtualMachines"
$LockName = "lock-myVM"
$LockLevel = "CanNotDelete" # CanNotDelete, ReadOnly

# a) Lock a Resource
$resource = Get-AzResource -ResourceGroupName $ResourceGroup -ResourceType $ResourceType -Name $ResourceName
New-AzResourceLock -LockName $LockName -LockLevel $LockLevel -ResourceId $resource.ResourceId

# b) Lock a Resource Group
$LockName = "lock-rg-demo"
New-AzResourceLock -LockName $LockName -LockLevel $LockLevel -ResourceGroupName $ResourceGroup

# c) Lock a Subscription
$LockName = "lock-subscription"
New-AzResourceLock -LockName $LockName -LockLevel $LockLevel -Scope "/subscriptions/$SubscriptionId"