#!/bin/bash
. ../../testdata_tools/gen.sh
#ulimit -s unlimited

use_solution joshua_full.cpp

compile gen_random.py
compile gen_many_collisions.py
compile gen_staircase.py

samplegroup
sample 1

group largenotuch 35
tc largenotouchcolls1 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=100000
tc largenotouchcolls2 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=100000
tc largenotouchcolls3 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=23400
tc largenotouchcolls4 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=100000
tc largenotouchcolls5 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=95001
tc largenotouchcolls6 gen_many_collisions r=1000000000 c=1000000000 k=100000 n=50000
tc largenotouchcolls7 gen_many_collisions r=1000000000 c=1000000000 k=80000  n=100000
tc largenotouchcolls8 gen_many_collisions r=1000000000 c=1000000000 k=50000  n=100000
tc largestaircase1 gen_staircase r=1000000000 c=1000000000 k=100000 n=23400
tc largestaircase2 gen_staircase r=1000000000 c=1000000000 k=100000 n=95001
tc largestaircase3 gen_staircase r=1000000000 c=1000000000 k=100000 n=50000
tc largestaircase4 gen_staircase r=1000000000 c=1000000000 k=100000 n=100000
tc largestaircase5 gen_staircase r=1000000000 c=1000000000 k=100000 n=100000


group smallgeneral 15
tc 1
tc smallgeneralrand1 gen_random r=10 c=10 n=5 k=10
tc smallgeneralrand2 gen_random r=10 c=10 n=5 k=20
tc smallgeneralrand3 gen_random r=10 c=10 n=5 k=30
tc smallgeneralrand4 gen_random r=10 c=10 n=5 k=40
tc smallgeneralrand5 gen_random r=10 c=10 n=5 k=50
tc smallgeneralrand6 gen_random r=10 c=10 n=5 k=60