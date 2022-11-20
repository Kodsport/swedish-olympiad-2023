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

# TODO: after qualifiers, merge these
group g2 20
tc_manual g2

group g3 20
tc_manual g3

group g4 20
tc_manual g4

group g5 20
tc_manual g5
