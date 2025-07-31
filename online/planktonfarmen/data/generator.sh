#!/bin/bash
. ../../testdata_tools/gen.sh

use_solution js.py

compile gen_random.py # random pieces from exponential distribution
compile gen_exact_max.py # N pieces of sqrt(A)
compile gen_exact_1max.py # N/2 pieces of 1 and A
compile gen_exact_different.py # pairs where xy = A
compile gen_a2.py # pairs where xy = MAX_A and A = 2

# Generate answers to sample cases
samplegroup
limits A=1000000000 N=100000
sample 1
sample 2
sample 3

generalcases() {
  group=$1
  A=$2
  N=$3
  tc exact_max-$group gen_exact_max A=$A N=$N
  tc exact_1max-$group gen_exact_1max A=$A N=$N
  tc a2-$group gen_a2 A=$A N=$N
  tc exact_different-$group gen_exact_different A=$A N=$N
  tc rand-$group-01 gen_random A=$A N=$N
  tc rand-$group-02 gen_random A=$A N=$N
  tc rand-$group-03 gen_random A=$A N=$N
}

group group1 20
limits A=1000000000 N=100000
tc_manual ../poster.in

group group2 12
limits A=1000000000 N=300
include_group group1
tc 1
tc 2
tc 3
generalcases 2 1000000000 300

group group3 28
limits A=1000000000 N=2000
include_group group2
generalcases 3 1000000000 2000

group group4 29
limits A=3000 N=100000
include_group group1
tc 1
tc 2
tc 3
generalcases 4 3000 100000

group group5 11
limits A=1000000000 N=100000
include_group group3
include_group group4
generalcases 5 1000000000 100000
