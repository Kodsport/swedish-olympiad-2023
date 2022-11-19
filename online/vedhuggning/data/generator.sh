#!/bin/bash
. ../../testdata_tools/gen.sh
ulimit -s unlimited

use_solution js.cpp

compile gen_immediate.py
compile gen_onemore.py

samplegroup
sample 1
sample 2

group group1 1
limits maxN=1
tc 1

tc immediate-n1 gen_immediate N=1
tc onemore-n1 gen_onemore N=1

group group2 2
limits maxN=1000 maxS=1000
tc 2

tc immediate-n1000s gen_immediate N=1000 maxS=1000
tc onemore-n1000s gen_onemore N=1000 maxS=1000

group group3 4
limits maxN=1000
include_group group1
include_group group2

tc immediate-n1000 gen_immediate N=1000
tc onemore-n1000 gen_onemore N=1000

group group4 8
include_group group3

tc immediate gen_immediate N=200000
tc onemore gen_onemore N=200000
