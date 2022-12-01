#!/usr/bin/env bash

PPATH=$(realpath ..)

REQUIRE_SAMPLE_REUSE=0
. ../../testdata_tools/gen.sh

use_solution js.cpp

compile gen_rand.py
compile gen_noconsec.py

samplegroup
sample 1
sample 2

group g1 40
limits noconsec12=1
tc_manual g1
tc_manual g2
tc noconsec1 gen_noconsec
tc noconsec2 gen_noconsec
tc noconsec3 gen_noconsec
tc noconsec4 gen_noconsec

group g2 60
tc rand1 gen_rand
tc rand2 gen_rand
tc rand3 gen_rand
tc rand4 gen_rand
tc rand5 gen_rand lo=10 n=2
tc rand6 gen_rand lo=10 n=4
tc rand7 gen_rand lo=10 n=14
tc rand8 gen_rand lo=20 n=12
tc rand9 gen_rand lo=20 n=10
tc rand10 gen_rand lo=20 n=8
tc rand11 gen_rand hi=9
tc rand12 gen_rand hi=9
tc rand13 gen_rand hi=9
tc_manual g3
tc_manual g4
tc_manual g5
