helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add grafana https://grafana.github.io/helm-charts
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add hashicorp https://helm.releases.hashicorp.com
helm install consul hashicorp/consul --version=0.40.0 --set global.name=consul --create-namespace --namespace consul -f values/consul.yaml
kubectl create ns monitoring
kubectl -n monitoring create secret generic kubepromsecret --from-file secrets/kubepromsecret
kubectl create ns mimir
kubectl -n mimir create secret generic mimir-credentials --from-file secrets/mimir-credentials
# helm install -n mimir etcd bitnami/etcd --version 8.5.5
helm install -n mimir mimir grafana/mimir-distributed --version 3.1.0 -f values/mimir.yaml
helm install -n monitoring prometheus prometheus-community/kube-prometheus-stack --version 40.3.1 -f values/kps.yaml
