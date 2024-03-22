# Get your cluster credentials for kubecutl
# To add Environmental variables on Windows (Powershell): $Env:<variable-name> = "<new-value>"
# To add Environmental variables on Linux (sudo nano /etc/environment): VARIABLE_NAME="variable_value"
az aks get-credentials --resource-group $YOURRESOURCEGROUP --n $CLUSTERNAME




