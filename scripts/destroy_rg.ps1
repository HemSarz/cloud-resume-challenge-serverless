$tfazrgs = az group list --query "[].name" -o tsv
$exclude = "azureapp-auto-alerts-f0865a-gb_hemensarzalihotmail_onmicrosoft_com"
$dspName = "tfazspn"
$appId = az ad sp list --display-name $dspName --query [].appId -o tsv

if ($tfazrgs -ne $null) {
    foreach ($rg in $tfazrgs) {
        if ($rg -eq $exclude) {
            Write-Host "Skipping resource group: $rg"
            continue
        }
        Write-Host "Deleting resource group: $rg"
        az group delete --name $rg --yes --no-wait
    }
}
else {
    Write-Host "No resource groups found to delete."
}

# Then delete the federated credentials for the service principal
    $fics = az ad app federated-credential list --id $appId --query "[].id" -o tsv
   foreach ($ficId in $fics) {
        Write-Host "Deleting federated credential: $ficId"
        az ad app federated-credential delete --id $appId --federated-credential-id $ficId
    }
   