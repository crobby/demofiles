#/bin/bash
oc delete configmap masterconfig workerconfig clusterconfig setworkers

oc create configmap masterconfig --from-file=masterconfig_test

oc create configmap workerconfig --from-file=workerconfig_test

oc create configmap clusterconfig --from-literal=sparkmasterconfig=masterconfig \
                                  --from-literal=sparkworkerconfig=workerconfig

oc create configmap setworkers --from-literal=workercount=5
