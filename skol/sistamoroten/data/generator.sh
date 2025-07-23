#!/usr/bin/env bash

PPATH=$(realpath ..)

. ../../testdata_tools/gen.sh

use_solution joshua_m2n.cpp

compile gen_rand.py

samplegroup
limits n=20 m=5000
sample 1
sample 2
sample 3


group g1 20
limits minN=2 n=2 m=100
tc_manual g1
tc 1
tc g1-rand1 gen_rand n=2 m=2
tc g1-rand2 gen_rand n=2 m=13 eps=1e-3
tc g1-rand3 gen_rand n=2 m=46 eps=1e-4
tc g1-rand4 gen_rand n=2 m=97 eps=1e-2

group g2 20
limits n=6 m=6
tc_manual g2
tc 1
tc g2-rand5 gen_rand n=1 m=1
tc g1-rand1
tc g2-rand7 gen_rand n=5 m=6 eps=1e-4
tc g2-rand8 gen_rand n=6 m=6 eps=1e-2
tc g2-rand9 gen_rand n=6 m=6 eps=1e-1

group g3 20
include_group g2
limits n=12 m=12
tc_manual g3
tc 1
tc 2
tc g3-rand10 gen_rand n=10 m=9 eps=1e-5
tc g3-rand11 gen_rand n=11 m=12 eps=1e-3
tc g3-rand12 gen_rand n=12 m=12 eps=1e-1
tc g3-rand13 gen_rand n=12 m=10 eps=1e-2

group g4 20
include_group g3
limits n=20 m=100
tc_manual g4
tc 2
tc g4-rand14 gen_rand n=19 m=95 eps=1e-4
tc g4-rand15 gen_rand n=20 m=69 eps=1e-3
tc g4-rand16 gen_rand n=18 m=87 eps=1e-1
tc g4-rand17 gen_rand n=20 m=3  eps=1e-2

group g5 20
include_group sample
include_group g1
include_group g3
include_group g4
limits n=20 m=5000
tc_manual g5
tc g5-rand18 gen_rand n=19 m=4998 eps=1e-4
tc g5-rand19 gen_rand n=20 m=4500 eps=1e-3
tc g5-rand20 gen_rand n=18 m=4950 eps=1e-1
tc g5-rand21 gen_rand n=20 m=2500 eps=1e-2
