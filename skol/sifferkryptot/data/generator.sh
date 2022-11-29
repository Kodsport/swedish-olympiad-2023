#!/usr/bin/env bash

PPATH=$(realpath ..)

REQUIRE_SAMPLE_REUSE=0
. ../../testdata_tools/gen.sh

use_solution js.cpp

samplegroup
sample 1
sample 2

group g1 40
limits noconsec12=1
tc_manual g1
tc_manual g2

group g2 60
tc_manual g3
tc_manual g4
tc_manual g5
