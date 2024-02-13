az aks create --resource-group YOURRESOURCEGROUP --name YOURCLUSTERNAME \
--enable-addons monitoring,http_application_routing \
--kubernetes-version 1.14.3 --generate-ssh-keys \
--service-principal application-id-from-rbac --client-secret client-secret-from-rbac



