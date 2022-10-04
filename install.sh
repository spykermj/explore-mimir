kubectl create ns monitoring
kubectl -n monitoring create secret generic kubepromsecret --from-file secrets/kubepromsecret
kubectl create ns mimir
kubectl -n mimir create secret generic mimir-credentials --from-file secrets/mimir-credentials
helm install -n mimir etcd charts/etcd
helm install -n mimir mimir charts/mimir-distributed -f charts/mimir.yaml
helm install -n monitoring prometheus charts/kube-prometheus-stack -f charts/kps.yaml
