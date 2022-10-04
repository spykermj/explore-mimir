# Mimir Learning

For the purposes of this learning, TLS is going to be skipped as an issue completely. For a
production configuration, all components should communicate with each other using TLS if it is
communication inside the k8s cluster or communication over an ingress. As a service mesh can
typically solve this once for all components, it is left as an exercise that can be delt with
separately.

That said, here are the minimum required features for a viable Mimir POC.

1. Multi-tenant operating mode - done
1. De-duplication if incoming HA prometheus data - this means using consul or etc
1. Basic authentication for sending data to Mimir - done
