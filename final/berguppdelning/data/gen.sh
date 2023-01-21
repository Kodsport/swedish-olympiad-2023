#!/bin/bash
REQUIRE_SAMPLE_REUSE=0

. ../../testdata_tools/gen.sh
#ulimit -s unlimited

use_solution olle.cpp

compile genPerlin.py


samplegroup
limits r=2 c=2 n=3 noise=""
sample 1

samplegroup
limits r=4 c=6 noise=""
sample 2


testcase() {
    NAME=$(printf "%02d" $1)
    group group$NAME 10
    limits t=$1 "${@:2}"
    tc "case$NAME" "${@:2}" tc=$1
}

testcase 1  genPerlin r=10  c=10     n=10    noise="spikey" bandsz=0.15
testcase 2  genPerlin r=1   c=100000 n=1000  noise="spikey"
testcase 3  genPerlin r=2   c=10000  n=1000  noise="spikey"
testcase 4  genPerlin r=200 c=200    n=40    noise="binary" roundthresh=0.40
testcase 5  genPerlin r=50  c=50     n=250   noise="spikey" bandsz=0.15
testcase 6  genPerlin r=200 c=200    n=2     noise="smooth" bandsz=0.15
testcase 7  genPerlin r=200 c=200    n=400   noise="smooth" bandsz=0.15
testcase 8  genPerlin r=400 c=400    n=16000 noise="spikey" bandsz=0.15
testcase 9  genPerlin r=400 c=400    n=16000 noise="smooth" bandsz=0.15
testcase 10 genPerlin r=400 c=400    n=16000 noise="olle"

# Clamp final scores to 100
echo 'grading: custom' >> testdata.yaml
echo 'grading: default' >> secret/testdata.yaml
echo 'grading: default' >> sample/testdata.yaml