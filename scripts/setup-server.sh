#!/bin/bash
flux install --components="source-controller,helm-controller"
helm upgrade -i --namespace homelab --create-namespace homelab --values charts/foundation/values.yaml charts/foundation --wait
kubectl label namespace homelab istio-injection=enabled
helm upgrade -i --namespace production --create-namespace production --values charts/environment/values.yaml charts/environment --wait
kubectl label namespace production istio-injection=enabled
