#!/usr/bin/env bash

PPATH=$(realpath ..)

REQUIRE_SAMPLE_REUSE=0
. ../../testdata_tools/gen.sh

use_solution js.cpp

samplegroup
sample 1
sample 2

group g1 20
limits mxS=300
tc_manual g1

group g2 20
limits mxS=2000
tc_manual g2

group g3 20
limits no4=1
tc_manual g3

group g4 40
tc_manual g4
tc_manual g5