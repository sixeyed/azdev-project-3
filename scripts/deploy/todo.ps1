
if ($runSqlServerInKubernetes) {
    $connectionString='<placeholder>'
}
else {
    echo "Building connection string for SQL DB: $sqlServerName"
    $connectionStringTemplate=$(az sql db show-connection-string --server $sqlServerName --client ado.net -o tsv)
    $connectionString=$connectionStringTemplate.Replace('<databasename>', $sqlDatabaseName).Replace('<username>', $sqlUserName).Replace('<password>', $sqlPassword)
}

if ($runTableStorageInKubernetes) {
    $tableStorageConnectionString='<placeholder>'
}
else {
    echo "Building connection string for Storage Account: $storageAccountName"
    $tableStorageConnectionString=$(az storage account show-connection-string -g $rg -n $storageAccountName --query connectionString -o tsv)
}

echo "Deploying to AKS: $aksName with Helm values: values-$($environmentName).yaml"

az aks get-credentials -g $rg -n $aksName --overwrite-existing

helm upgrade --install `
  -n $appName --create-namespace `
  -f ../helm/values.yaml `
  -f "../helm/values-$($environmentName).yaml" `
  --set include.sqlServer=$($runSqlServerInKubernetes.ToString().ToLower()) `
  --set include.azurite=$($runTableStorageInKubernetes.ToString().ToLower()) `
  --set connectionStrings.sqlServer="$($connectionString.Replace(",", "\,"))" `
  --set connectionStrings.tableStorage=$tableStorageConnectionString `
  $appName ../helm/
