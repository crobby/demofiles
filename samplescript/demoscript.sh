#!/bin/sh

echo "Re-creating configmaps"
pushd ../democonfigs
./make_test_configs.sh
popd
echo "Creating cluster"
oshinko create democluster --storedconfig=setworkers

echo "Waiting 15 seconds for cluster to come up"
sleep 15
oshinko get democluster -o json

echo "***********Running sample program"
./smoketest.sh democluster

echo "***********Deleting cluster"
oshinko delete democluster

