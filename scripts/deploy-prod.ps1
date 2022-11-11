
$env:ENVIRONMENT_NAME='prod'
$env:AKS_NODE_COUNT='3'

$env:DEPLOY_SQL=$true
$env:DEPLOY_STORAGE=$true

$env:SQL_DB_COMPUTE_MODEL='Provisioned'
$env:SQL_DB_MAX_SIZE='32GB'
$env:SQL_DB_CAPACITY='4'

./deploy.ps1