# variables
$environmentName = if ($env:ENVIRONMENT_NAME) { $env:ENVIRONMENT_NAME } else { 'dev' };
$aksNodeCount = if ($env:AKS_NODE_COUNT) { $env:AKS_NODE_COUNT } else { '1' }
$sqlDatabaseComputeModel = if ($env:SQL_DB_COMPUTE_MODEL) { $env:SQL_DB_COMPUTE_MODEL } else { 'Serverless' }
$sqlDatabaseMaxSize = if ($env:SQL_DB_MAX_SIZE) { $env:SQL_DB_MAX_SIZE } else { '1GB' }
$sqlDatabaseCapacity = if ($env:SQL_DB_CAPACITY) { $env:SQL_DB_CAPACITY } else { '1' }
$runSqlServerInKubernetes= if ($env:DEPLOY_SQL -eq $true) { $false } else { $true }
$runTableStorageInKubernetes= if ($env:DEPLOY_STORAGE -eq $true) { $false } else { $true }

# core
$appName="todo$environmentName"
$projectName="proj3$appName"
$rg="rg-$($projectName)"
$location='eastus'

# sql server
$sqlServerName="sql$($projectName)"
$sqlUserName='sqluser'
$sqlPassword=$([System.Guid]::NewGuid().ToString().Substring(0,6) + "-!!*" + [System.Guid]::NewGuid().ToString().Substring(0,6))

# sql database
$sqlDatabaseName="sqldb-$($projectName)"
$sqlDatabaseEdition='GeneralPurpose'
$sqlDatabaseFamily='Gen5'

# aks
$aksName="aks-$($projectName)"

# storage account
$storageAccountName="sa$($projectName)"

# keyvault
$keyVaultName="kv$($projectName)"

# vnet:
$vnetName="vn$($projectName)"
$vnetSubnetName='app'