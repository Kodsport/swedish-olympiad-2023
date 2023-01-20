#!/bin/bash
REQUIRE_SAMPLE_REUSE=0

. ../../testdata_tools/gen.sh
ulimit -s unlimited

use_solution olle.cpp

compile genPerlin.py


samplegroup
sample 1

group tiny 10
tc tiny1 genPerlin r=100 c=100 t=1 nsize=20 base_noise="(100,[NoiseData(3,0.5),NoiseData(20,0.5)])"


group 
