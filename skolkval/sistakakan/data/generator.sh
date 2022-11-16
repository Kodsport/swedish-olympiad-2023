#!/usr/bin/env bash

PPATH=$(realpath ..)

REQUIRE_SAMPLE_REUSE=0
. ../../testdata_tools/gen.sh

use_solution joshua_m2n.cpp

samplegroup
limits n=25 m=10000
sample 1
sample 2
sample 3

group g1 20
limits n=2 m=100
tc_manual g1

group g2 20
limits n=6 m=6
tc_manual g2

group g3 20
limits n=12 m=12
tc_manual g3

group g4 20
limits n=20 m=100
tc_manual g4

group g5 20
limits n=25 m=10000
tc_manual g5

