
. ./00-set-variables.ps1

az keyvault delete -g $rg -n $keyVaultName

az group delete -y -n $rg

az keyvault purge -l $location -n $keyVaultName --no-wait