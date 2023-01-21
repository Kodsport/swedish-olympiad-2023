#!/bin/bash
. ../../testdata_tools/gen.sh
ulimit -s unlimited

use_solution js.py

compile gen_random.py

samplegroup
sample 1
sample 2

group g1 56
limits hassol=1
tc rand-sol01 gen_random hassol=1 N=100
tc rand-sol02 gen_random hassol=1 N=200
tc rand-sol03 gen_random hassol=1 N=200
tc rand-sol04 gen_random hassol=1 N=200
tc rand-sol05 gen_random hassol=1 N=500
tc rand-sol06 gen_random hassol=1 N=500
tc rand-sol07 gen_random hassol=1 N=1000
tc rand-sol08 gen_random hassol=1 N=2000
tc rand-sol09 gen_random hassol=1 N=5000

group g2 44
include_group g1
tc 1
tc 2
tc rand01 gen_random N=100
tc rand02 gen_random N=200
tc rand03 gen_random N=200
tc rand04 gen_random N=200
tc rand05 gen_random N=500
tc rand06 gen_random N=500
tc rand07 gen_random N=1000
tc rand08 gen_random N=2000
tc rand09 gen_random N=5000
