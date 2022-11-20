#!/usr/bin/env bash

PPATH=$(realpath ..)
REQUIRE_SAMPLE_REUSE=0
. ../../testdata_tools/gen.sh

use_solution nils.cpp

compile gen.py

samplegroup
limits t=0
sample_manual 1

testcase() {
	NAME=$(printf "%02d" $1)
	group group$NAME 10
	limits t=$1
	tc "case$NAME" "${@:2}" tc=$1
}


testcase 1 gen n=100000 maxy=0
testcase 2 gen n=100000 maxy=20
testcase 3 gen n=10 
testcase 4 gen n=40 
testcase 5 gen n=200 
testcase 6 gen n=800 
testcase 7 gen n=7000 
testcase 8 gen n=40000
testcase 9 gen n=80000
testcase 10 gen n=100000 


# Clamp final scores to 100
echo 'grading: custom' >> secret/testdata.yaml
for x in 01 02 03 04 05 06 07 08 09 10
do
    echo 'grading: default' >> secret/group$x/testdata.yaml
done
