#!/bin/bash
. ../../testdata_tools/gen.sh

use_solution js.py

compile gen_random.py
compile gen_pat.py
compile gen_singlewin.py
compile gen_singletwowin.py
compile gen_twotwowin.py
compile gen_threetwowin.py

samplegroup
sample 1
sample 2
sample 3

group group1 10
limits K=1

tc 1
tc k1-101 gen_pat N=999 K=1 pat=VF
tc k1-single-v gen_pat N=1 K=1 pat=F
tc k1-single-f gen_pat N=1 K=1 pat=V
tc k1-all-v gen_random N=1000 K=1 dens=100
tc k1-all-f gen_random N=1000 K=1 dens=-1
tc k1-v-half gen_random N=1000 K=1 dens=50
tc k1-v-10 gen_random N=1000 K=1 dens=10
tc k1-v-25 gen_random N=1000 K=1 dens=25
tc k1-v-75 gen_random N=1000 K=1 dens=75
tc k1-singlewin gen_singlewin N=1000 K=1
tc k1-singletwowin gen_singletwowin N=1000 K=1
tc k1-twotwowin gen_twotwowin N=1000 K=1

group group2 20
limits K=2

tc 2
tc k2-101 gen_pat N=999 K=2 pat=VF
tc k2-min-v gen_pat N=2 K=2 pat=F
tc k2-min-f gen_pat N=2 K=2 pat=V
tc k2-all-v gen_random N=1000 K=2 dens=100
tc k2-all-f gen_random N=1000 K=2 dens=-1
tc k2-v-half gen_random N=1000 K=2 dens=50
tc k2-v-10 gen_random N=1000 K=2 dens=10
tc k2-v-25 gen_random N=1000 K=2 dens=25
tc k2-v-75 gen_random N=1000 K=2 dens=75
tc k2-singlewin gen_singlewin N=1000 K=2
tc k2-twotwowin gen_twotwowin N=1000 K=2
tc k2-threetwowin gen_threetwowin N=1000 K=2

group group3 30
limits K=3

tc 3
tc k3-101 gen_pat N=999 K=3 pat=VF
tc k3-min-v gen_random N=3 K=3 dens=100
tc k3-min-f gen_random N=3 K=3 dens=-1
tc k3-all-v gen_random N=1000 K=3 dens=100
tc k3-all-f gen_random N=1000 K=3 dens=-1
tc k3-v-half gen_random N=1000 K=3 dens=50
tc k3-v-10 gen_random N=1000 K=3 dens=10
tc k3-v-25 gen_random N=1000 K=3 dens=25
tc k3-v-75 gen_random N=1000 K=3 dens=75
tc k3-singlewin gen_singlewin N=1000 K=3
tc k3-threetwowin gen_threetwowin N=1000 K=3

group group4 40
include_group group1
include_group group2
include_group group3

tc 101 gen_pat N=999 K=499 pat=VF
tc all-v gen_random N=1000 K=100 dens=100
tc all-f gen_random N=1000 K=100 dens=-1
tc v-half gen_random N=1000 K=3 dens=50
tc v-10 gen_random N=1000 K=10 dens=10
tc v-25 gen_random N=1000 K=30 dens=25
tc v-75 gen_random N=1000 K=500 dens=75
tc singlewin gen_singlewin N=1000 K=10
tc threetwowin gen_threetwowin N=1000 K=10
tc v-10-k100 gen_random N=1000 K=100 dens=10
tc v-25-k100 gen_random N=1000 K=100 dens=10
tc v-75-k100 gen_random N=1000 K=100 dens=10
tc v-90-k100 gen_random N=1000 K=100 dens=10
