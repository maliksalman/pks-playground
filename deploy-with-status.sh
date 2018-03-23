#!/bin/bash
DEPLOY=$1
if [[ -z $DEPLOY || ! -f "$DEPLOY-deployment.yml" ]]; then
  echo "Deployment NAME required with configuraiton in {NAME}-deployment.yml"
  exit 1
fi
  
kubectl apply -f ${DEPLOY}-deployment.yml; kubectl rollout status deployment ${DEPLOY}