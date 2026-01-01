Install-Module Az -Scope CurrentUser -Force
Connect-AzAccount

# a) Tag a Resource
$ResourceGroup = "rg-demo"
$ResourceName = "myVM"
$ResourceType = "Microsoft.Compute/virtualMachines"
$Tags = @{
    Environment = "Dev"
    Project     = "Contoso"
}

$resource = Get-AzResource -ResourceGroupName $ResourceGroup -ResourceType $ResourceType -Name $ResourceName
Set-AzResource -ResourceId $resource.ResourceId -Tag $Tags -Force

# b) Tag a Resource Group
$ResourceGroup = "rg-demo"
$Tags = @{
    Environment = "Dev"
    Project     = "Contoso"
}

Set-AzResourceGroup -Name $ResourceGroup -Tag $Tags

# c) Tag a Subscription
$SubscriptionId = "<SUBSCRIPTION_ID>"
$Tags = @{
    Environment = "Dev"
    Project     = "Contoso"
}

Select-AzSubscription -SubscriptionId $SubscriptionId
Set-AzSubscription -SubscriptionId $SubscriptionId -Tag $Tags


