# Usage: bash -f ./deploy.sh
#        Supported Options - 
#              --csi-driver-enabled=<yes/no> (default no, if yes provide following two parameters)
#              --csi-driver-sp-client-id=<Azure Service Principle ID, having access to Azure Key Vault>
#              --csi-driver-sp-client-secret=<Azure Service Principle Secret, having access to Azure Key Vault>
#              --acr-imagepullsecret-enabled=<yes/no> (default no, if yes provide following three parameters)
#              --acr-imagepullsecret-sp-client-id=<Azure Service Principle ID, having access to Azure Container Registry>
#              --acr-imagepullsecret-sp-client-secret=<Azure Service Principle Secret, having access to Azure Container Registry>
#              --acr-full-name=<Azure Container Registry full name ex. example.azurecr.io>
#              --helm-chart-path=<Helm Chart Folder Path or URL to .tgz file for the applications >
#              --helm-chart-release-name=<Helm Release Name>
#              --helm-chart-set-parameters=<","(comma) separated Helm Set parameters needed to be overwritten for integration test env>
#              --kubectl-check-services=<","(comma) separated Pod names needed to be check if up and running>
#              --kubectl-check-services-selector-label=<ex. app.kubernetes.io/name or name etc.> (default app.kubernetes.io/name)
#              --kubectl-port-forward-services=<","(comma) separated Service names needed to port-forward for testing>