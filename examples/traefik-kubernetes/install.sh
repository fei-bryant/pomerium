#!/bin/bash

helm upgrade --install \
    --namespace pomerium \
    --create-namespace \
    traefik traefik/traefik \
    --values values/traefik.yaml

helm upgrade --install \
    --namespace pomerium \
    --create-namespace \
    pomerium pomerium/pomerium \
    --values values/pomerium.yaml

kubectl apply -f crds/*.yaml

helm upgrade --install \
    --namespace pomerium \
    --create-namespace \
    nginx bitnami/nginx \
    --values values/nginx.yaml
