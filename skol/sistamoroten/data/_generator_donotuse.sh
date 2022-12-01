#!/usr/bin/env bash

PPATH=$(realpath ..)

REQUIRE_SAMPLE_REUSE=0
. ../../testdata_tools/gen.sh

use_solution joshua_m2n.cpp

compile gen_rand.py

samplegroup
limits n=20 m=5000
sample 1
sample 2
sample 3


group g1 20
limits n=2 m=100
tc_manual g1
tc rand1 gen_rand n=2 m=2
tc rand2 gen_rand n=2 m=13 eps=1e-3
tc rand3 gen_rand n=2 m=46 eps=1e-4
tc rand4 gen_rand n=2 m=97 eps=1e-2

group g2 20
limits n=6 m=6
tc_manual g2
tc rand5 gen_rand n=1 m=1
tc rand1
tc rand7 gen_rand n=5 m=6 eps=1e-4
tc rand8 gen_rand n=6 m=6 eps=1e-2
tc rand9 gen_rand n=6 m=6 eps=1e-1

group g3 20
include_group g2
limits n=12 m=12
tc_manual g3
tc rand10 gen_rand n=10 m=9 eps=1e-5
tc rand11 gen_rand n=11 m=12 eps=1e-3
tc rand12 gen_rand n=12 m=12 eps=1e-1
tc rand13 gen_rand n=12 m=10 eps=1e-2

group g4 20
include_group g3
limits n=20 m=100
tc_manual g4
tc rand14 gen_rand n=19 m=95 eps=1e-4
tc rand15 gen_rand n=20 m=69 eps=1e-3
tc rand16 gen_rand n=18 m=87 eps=1e-1
tc rand17 gen_rand n=20 m=3  eps=1e-2

group g5 20
include_group sample
include_group g3
limits n=20 m=5000
tc_manual g5
tc rand18 gen_rand n=19 m=4998 eps=1e-4
tc rand19 gen_rand n=20 m=4500 eps=1e-3
tc rand20 gen_rand n=18 m=4950 eps=1e-1
tc rand21 gen_rand n=20 m=2500 eps=1e-2