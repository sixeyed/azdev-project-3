
echo "Restricting KeyVault to subnet: $vnetSubnetName"

az keyvault network-rule add `
  -g $rg -n $keyVaultName `
  --vnet-name $vnetName --subnet $vnetSubnetName

az keyvault update `
  -g $rg -n $keyVaultName `
  --default-action 'Deny'

echo "Adding KeyVault policy for AKS MI: $aksName"

$id=$(az aks show -g $rg -n $aksName --query addonProfiles.azureKeyvaultSecretsProvider.identity.clientId -o tsv)

az keyvault set-policy `
  -g $rg -n $keyVaultName `
  --secret-permissions get --spn $id