
#region getLogin
#Write-Output "Service Principal Login to Azure"
az login `
    -service-principal `
    -username $servicePrincipal `
    -password $servicePrincipalSecret `
    -tenant $servicePrincipalTenantId 
Write-Output "Logged In"
Write-Output ""
#endregion

#region getSubscription
#Gets the right subscription to ensure the data goes to the right place
Write-Output  "Set Default for Azure Subscription"
az account set `
    - subscription $azureSubscriptionName
Write-Output "Default Subscription set"
Write-Output ""
#endregion

#region Create VM
#Creates a VM within a resource group
Write-Output "Creating VM in Az"
try{
    az vm create
    -resource-group $resourceGroupName
    -name $serverName `
    -image win2019datacenter `
    -admin-username $adminLogin `
    -admin-password $adminPassword
  }
catch {
    Write-Output "VM already exists in Azure"
    }
Write-Output "VM created"
write-Output ""
#endregion


