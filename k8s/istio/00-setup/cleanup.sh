#!/bin/bash

if [ $# -ne 2 ]
then 
  echo "usage: cleanup.sh [namespace] [host]" 
  exit 1
fi

export NAMESPACE=$1
export HOST=$2
envsubst < caj-services.yaml | oc delete -f -
envsubst < destinationrules.yaml | oc delete -f -
envsubst < gateway.yaml | oc delete -f -