
echo "Creating AKS cluster: $aksName"

$subnetId=$(az network vnet subnet show -g $rg --vnet-name $vnetName -n $vnetSubnetName --query id -o tsv)

az aks create `
  -l $location -g $rg -n $aksName `
  --node-count $aksNodeCount `
  --enable-addons azure-keyvault-secrets-provider `
  --enable-managed-identity `
  --network-plugin azure `
  --vnet-subnet-id $subnetId
