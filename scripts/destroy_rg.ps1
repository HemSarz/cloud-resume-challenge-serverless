$tfazrgs = az group list --query "[].name" -o tsv
$exclude = "azureapp-auto-alerts-f0865a-gb_hemensarzalihotmail_onmicrosoft_com"

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