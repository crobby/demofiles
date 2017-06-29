#!/bin/sh

CLUSTERNAME=$1
WORKERDEPLOYMENT="${CLUSTERNAME}-w"

oc login -u developer -p dev
oc project myproject

WORKERPOD=`oc get pods | grep -m 1 "${CLUSTERNAME}-w" | sed 's/\s\+/ /g' | cut -d' ' -f1`
echo "Going to run smoke test on POD: $WORKERPOD"
oc cp ./runit.sh $WORKERPOD:/tmp/
echo "oc exec ${WORKERPOD} -- /tmp/runit.sh"

oc exec ${WORKERPOD} -- /tmp/runit.sh

