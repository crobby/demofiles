#!/bin/bash
oc delete configmap masterconfig masternorp workerconfig clusterconfig setworkers

oc create configmap masterconfig --from-file=masterconfig_test

oc create configmap masternorp --from-file=masterconfig_no_rp

oc create configmap workerconfig --from-file=workerconfig_test

oc create configmap clusterconfig --from-literal=sparkmasterconfig=masterconfig \
                                  --from-literal=sparkworkerconfig=workerconfig \
                                  --from-literal=workercount=3

oc create configmap setworkers --from-literal=workercount=3
