$root = "C:\1Lab\cloud-resume-challenge-serverless\infrastructure\modules\networking"

$files = @(
    "kv/",
    "stg/",
    "stg/main.tf",
    "stg/variables.tf",
    "stg/outputs.tf",
    "kv/main.tf",
    "kv/variables.tf",
    "kv/outputs.tf"

)

foreach ($file in $files) {
    $fullPath = Join-Path -Path $root -ChildPath $file
    if ($file.EndsWith("/")) {
        New-Item -Path $fullPath -ItemType Directory -Force | Out-Null
    }
    else {
        $dir = Split-Path -Path $fullPath -Parent
        if (-not (Test-Path -Path $dir)) {
            New-Item -Path $dir -ItemType Directory -Force | Out-Null
        }
        New-Item -Path $fullPath -ItemType File -Force | Out-Null
    }
}

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