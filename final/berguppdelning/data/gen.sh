#!/bin/bash
REQUIRE_SAMPLE_REUSE=0

. ../../testdata_tools/gen.sh
ulimit -s unlimited

use_solution olle.cpp

compile genPerlin.py


samplegroup
limits r=4 c=4 nsize=3
sample 1


testcase() {
	NAME=$(printf "%02d" $1)
	group group$NAME 10
	limits t=$1 "${@:2}"
	tc "case$NAME" "${@:2}" tc=$1
}

testcase 1  genPerlin r=10  c=10 nsize=10     base_noise="(100,[NoiseData(3,0.5),NoiseData(20,0.5)])"
testcase 2  genPerlin r=1   c=100000 nsize=1000 base_noise="(100,[NoiseData(3,0.5),NoiseData(20,0.5)])"
testcase 3  genPerlin r=2   c=10000 nsize=1000 base_noise="(100,[NoiseData(3,0.5),NoiseData(20,0.5)])"
testcase 4  genPerlin r=200 c=200 nsize=40    base_noise="(100,[NoiseData(3,0.5),NoiseData(20,0.5)])"
testcase 5  genPerlin r=50  c=50 nsize=250    base_noise="(100,[NoiseData(3,0.5),NoiseData(20,0.5)])"
testcase 6  genPerlin r=200 c=200 nsize=2     base_noise="(100,[NoiseData(3,0.5),NoiseData(20,0.5)])"
testcase 7  genPerlin r=200 c=200 nsize=400   base_noise="(100,[NoiseData(3,0.5),NoiseData(20,0.5)])"
testcase 8  genPerlin r=400 c=400 nsize=16000 base_noise="(100,[NoiseData(3,0.5),NoiseData(20,0.5)])"
testcase 9  genPerlin r=400 c=400 nsize=16000 base_noise="(100,[NoiseData(3,0.5),NoiseData(20,0.5)])"
testcase 10 genPerlin r=400 c=400 nsize=16000 base_noise="(100,[NoiseData(3,0.5),NoiseData(20,0.5)])"

# Clamp final scores to 100
echo 'grading: custom' >> testdata.yaml
echo 'grading: default' >> secret/testdata.yaml
echo 'grading: default' >> sample/testdata.yaml