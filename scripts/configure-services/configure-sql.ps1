
if (-Not $runTableStorageInKubernetes) {
    echo "Restricting SQL server to subnet: $vnetSubnetName"

    az sql server vnet-rule create `
    -g $rg -s $sqlServerName -n "subnet-$vnetSubnetName" `
    --vnet-name $vnetName --subnet $vnetSubnetName
}
