
echo "Creating Virtual Network: $vnetName"

az network vnet create -g $rg -l $location `
 -n $vnetName --address-prefix "10.20.0.0/16"

az network vnet subnet create -g $rg `
 --vnet-name $vnetName -n $vnetSubnetName `
 --address-prefix "10.20.1.0/24"

 az network vnet subnet update -g $rg `
 --vnet-name $vnetName -n $vnetSubnetName `
 --service-endpoints Microsoft.KeyVault Microsoft.Sql