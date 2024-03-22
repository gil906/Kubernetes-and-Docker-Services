#MetalLB (If the cluster is not running on cloud):
#install MetalLB using kubectl by applying the manifest:


kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.10.2/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.10.2/manifests/metallb.yaml
#Configure MetalLB:
#After installing the MetalLB manifests, you need to configure it to specify the range of IP addresses it can assign to services. You can do this by creating a ConfigMap:

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f metallb-config.yaml

