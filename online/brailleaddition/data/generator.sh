#!/usr/bin/env bash

PPATH=$(realpath ..)
REQUIRE_SAMPLE_REUSE=0
. ../../testdata_tools/gen.sh

use_solution js.cpp lk.py

compile gen_random.py

sample 1
sample 2

group gg 100
tc exact1 gen_random n=1 m=1
tc exact2 gen_random n=2 m=2
tc exact3 gen_random n=3 m=3
tc exact4 gen_random n=4 m=4
tc exact5 gen_random n=5 m=5
tc exact6 gen_random n=6 m=6
tc exact7 gen_random n=7 m=7
tc exact8 gen_random n=8 m=8
tc exact9 gen_random n=9 m=9
tc exact12 gen_random n=1 m=2
tc exact13 gen_random n=1 m=3
tc exact14 gen_random n=1 m=4
tc exact15 gen_random n=1 m=5
tc exact16 gen_random n=1 m=6
tc exact17 gen_random n=1 m=7
tc exact18 gen_random n=1 m=8
tc exact19 gen_random n=1 m=9