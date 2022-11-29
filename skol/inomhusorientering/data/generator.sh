#!/usr/bin/env bash

PPATH=$(realpath ..)

REQUIRE_SAMPLE_REUSE=0
. ../../testdata_tools/gen.sh

use_solution js.cpp

samplegroup
sample 1
sample 2

group g1 20
limits onlya=1
tc_manual g1

group g2 80
tc_manual g2
tc_manual g3
tc_manual g4
tc_manual g5
