#!/bin/bash

if [ $# -ne 2 ]
then 
  echo "usage: deploy.sh [namespace] [host]" 
  exit 1
fi

export NAMESPACE=$1
export HOST=$2
envsubst < caj-services.yaml | oc apply -f -
envsubst < destinationrules.yaml | oc apply -f -
envsubst < gateway.yaml | oc apply -f -