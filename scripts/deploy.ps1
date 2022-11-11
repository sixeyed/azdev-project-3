
. ./00-set-variables.ps1

# core 
./create-core/01_create-rg.ps1
./create-core/02_create-vnet.ps1
./create-core/03_create-keyvault.ps1

# infra
./create-services/create-sql.ps1
./create-services/create-table-storage.ps1
./create-services/create-aks.ps1

# configuration
./configure-services/configure-keyvault.ps1
./configure-services/configure-sql.ps1

# app
./deploy/todo.ps1