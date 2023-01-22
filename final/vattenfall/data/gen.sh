#!/bin/bash
. ../../testdata_tools/gen.sh
#ulimit -s unlimited

use_solution joshua_full.cpp

compile gen_random.py
compile gen_many_collisions.py
compile gen_staircase.py
compile gen_platform.py

samplegroup
sample 1
sample 2
sample 3

group smallgeneral 20
limits r=1000 c=1000
tc 1
tc 2
tc 3
tc smallgeneralrand1 gen_random r=10 c=10 n=5 k=10
tc smallgeneralrand2 gen_random r=10 c=50 n=5 k=20
tc smallgeneralrand3 gen_random r=10 c=50 n=5 k=30
tc smallgeneralrand4 gen_random r=10 c=100 n=5 k=40
tc smallgeneralrand5 gen_random r=10 c=100 n=5 k=50
tc smallgeneralrand6 gen_random r=10 c=100 n=5 k=60


group largenotouch 30
limits nodiag=1 noaxis=1
tc largenotouchcolls1 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=100000 no_diag=1 no_axis=1
tc largenotouchcolls2 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=100000 no_diag=1 no_axis=1
tc largenotouchcolls3 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=23400  no_diag=1 no_axis=1
tc largenotouchcolls4 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=100000 no_diag=1 no_axis=1
tc largenotouchcolls5 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=95001  no_diag=1 no_axis=1
tc largenotouchcolls6 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=50000  no_diag=1 no_axis=1
tc largenotouchcolls7 gen_many_collisions r=1000000000 c=1000000000 k=80000  n=100000 no_diag=1 no_axis=1
tc largenotouchcolls8 gen_many_collisions r=1000000000 c=1000000000 k=50000  n=100000 no_diag=1 no_axis=1
tc largestaircase1 gen_staircase r=1000000000 c=1000000000 k=100000 n=23400
tc largestaircase2 gen_staircase r=1000000000 c=1000000000 k=100000 n=95001
tc largestaircase3 gen_staircase r=1000000000 c=1000000000 k=100000 n=50000
tc largestaircase4 gen_staircase r=1000000000 c=1000000000 k=100000 n=100000
tc largestaircase5 gen_staircase r=1000000000 c=1000000000 k=100000 n=100000


group largenodiag 20
include_group largenotouch
limits nodiag=1
tc largenodiagcolls1 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=100000 no_diag=1
tc largenodiagcolls2 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=100000 no_diag=1
tc largenodiagcolls3 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=23400  no_diag=1
tc largenodiagcolls4 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=100000 no_diag=1
tc largenodiagcolls5 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=95001  no_diag=1
tc largenodiagcolls6 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=50000  no_diag=1
tc largenodiagcolls7 gen_many_collisions r=1000000000 c=1000000000 k=80000  n=100000 no_diag=1
tc largenodiagcolls8 gen_many_collisions r=1000000000 c=1000000000 k=50000  n=100000 no_diag=1
tc largeplatform1 gen_platform r=1000000000 c=1000000000 n=100000 k=100000
tc largeplatform2 gen_platform r=1000000000 c=1000000000 n=100000 k=50000
tc largeplatform3 gen_platform r=1000000000 c=1000000000 n=100000 k=20000


group full 30
include_group largenodiag
include_group largenotouch
include_group smallgeneral
tc fullcolls1 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=100000
tc fullcolls2 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=100000
tc fullcolls3 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=23400
tc fullcolls4 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=100000
tc fullcolls5 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=95001
tc fullcolls6 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=50000
tc fullcolls7 gen_many_collisions r=1000000000 c=1000000000 k=80000  n=100000
tc fullcolls8 gen_many_collisions r=1000000000 c=1000000000 k=50000  n=100000

