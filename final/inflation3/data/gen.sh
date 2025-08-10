#!/bin/bash
. ../../testdata_tools/gen.sh
ulimit -s unlimited

use_solution js.cpp

compile gen_random.py

samplegroup
sample 1

group g1 55
limits pct=1
tc rand-perc01 gen_random hi=1 I=0
tc rand-perc02 gen_random hi=1 I=5
tc rand-perc03 gen_random hi=1 I=10
tc rand-perc04 gen_random hi=2 I=0
tc rand-perc05 gen_random hi=2 I=5
tc rand-perc06 gen_random hi=2 I=10

group g2 45
include_group g1
tc 1
tc rand-sort01 gen_random sort=1 I=50 lo=10
tc rand-sort02 gen_random sort=1 I=50 lo=10
tc rand-sort03 gen_random sort=1 I=50 lo=10
tc rand-sort04 gen_random sort=1 I=50 lo=10
tc rand-sort05 gen_random sort=1 I=50 lo=10
tc rand-sort06 gen_random sort=1 I=50 lo=10
tc rand-01 gen_random
tc rand-02 gen_random
tc rand-03 gen_random
tc rand-04 gen_random
tc rand-05 gen_random
tc rand-06 gen_random
tc rand-07 gen_random
tc rand-08 gen_random
tc rand-09 gen_random
tc rand-10 gen_random
