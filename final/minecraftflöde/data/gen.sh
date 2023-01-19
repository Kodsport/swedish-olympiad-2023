#!/bin/bash
. ../../testdata_tools/gen.sh
#ulimit -s unlimited

use_solution joshua_full.cpp

compile gen_random.py

samplegroup
sample 1


group smallgeneral 15
tc 1
tc smallgeneralrand1 gen_random r=10 c=10 n=5 k=10
tc smallgeneralrand2 gen_random r=10 c=10 n=5 k=20
tc smallgeneralrand3 gen_random r=10 c=10 n=5 k=30
tc smallgeneralrand4 gen_random r=10 c=10 n=5 k=40
tc smallgeneralrand5 gen_random r=10 c=10 n=5 k=50
tc smallgeneralrand6 gen_random r=10 c=10 n=5 k=60