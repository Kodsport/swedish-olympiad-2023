#!/bin/bash
. ../../testdata_tools/gen.sh
ulimit -s unlimited

use_solution js.cpp

compile gen_immediate.py
compile gen_onemore.py
compile gen_singlegrow.py
compile gen_singlegrow2.py
compile gen_random.py

samplegroup
sample 1
sample 2

group group1 1
limits maxN=1
tc 1

tc immediate-n1 gen_immediate N=1
tc onemore-n1 gen_onemore N=1
tc singlegrow-n1 gen_singlegrow N=1
tc singlegrow2-n1 gen_singlegrow2 N=1

tc rand-n1-01 gen_random N=1
tc rand-n1-02 gen_random N=1
tc rand-n1-03 gen_random N=1
tc rand-n1-04 gen_random N=1

group group2 2
limits maxN=1000 maxS=1000
tc 2

tc immediate-n1000s gen_immediate N=1000 maxS=1000
tc onemore-n1000s gen_onemore N=1000 maxS=1000
tc singlegrow-n1000s gen_singlegrow N=1000 maxS=1000
tc singlegrow2-n1000s gen_singlegrow2 N=1000 maxS=1000

tc rand-n10s-01 gen_random N=10 maxS=1000
tc rand-n10s-02 gen_random N=10 maxS=1000
tc rand-n10s-03 gen_random N=10 maxS=1000
tc rand-n1000s-01 gen_random N=1000 maxS=1000
tc rand-n1000s-02 gen_random N=1000 maxS=1000
tc rand-n1000s-03 gen_random N=1000 maxS=1000

group group3 4
limits maxN=1000
include_group group1
include_group group2

tc immediate-n1000 gen_immediate N=1000
tc onemore-n1000 gen_onemore N=1000
tc singlegrow-n1000 gen_singlegrow N=1000
tc singlegrow2-n1000 gen_singlegrow2 N=1000

tc rand-n1000-01 gen_random N=1000
tc rand-n1000-02 gen_random N=1000
tc rand-n1000-03 gen_random N=1000
tc rand-n1000-04 gen_random N=1000
tc rand-n1000-05 gen_random N=1000
tc rand-n1000-06 gen_random N=1000

group group4 8
include_group group3

tc immediate gen_immediate N=200000
tc onemore gen_onemore N=200000
tc singlegrow gen_singlegrow N=200000
tc singlegrow2 gen_singlegrow2 N=200000

tc rand-01 gen_random N=200000
tc rand-02 gen_random N=200000
tc rand-03 gen_random N=200000
tc rand-04 gen_random N=200000
tc rand-05 gen_random N=200000
tc rand-06 gen_random N=200000
tc rand-07 gen_random N=200000
