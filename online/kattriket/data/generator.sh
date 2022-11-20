#!/bin/bash
. ../../testdata_tools/gen.sh
ulimit -s unlimited

use_solution js.py

compile gen_random_parent.py
compile gen_d1.py
compile gen_deepleaves.py
compile gen_line.py
compile gen_random_lines.py
compile gen_rep.py

samplegroup
sample 1
sample 2

group group1 21
limits isstar=1
tc 1
tc d1 gen_d1 N=100000
tc line gen_line N=100000
tc randline-10 gen_random_lines N=100000 K=10
tc randline-100 gen_random_lines N=100000 K=100
tc randline-1000 gen_random_lines N=100000 K=1000
tc randline-10000 gen_random_lines N=100000 K=10000
tc randline-100000 gen_random_lines N=100000 K=100000

group group2 28
limits maxN=1000
tc 2

tc line-small gen_line N=1000
tc d1-small gen_d1 N=1000
tc deepleaves-small gen_deepleaves N=1000
tc rep-small gen_rep N=1000
tc randpar-small-01 gen_random_parent N=1000
tc randpar-small-02 gen_random_parent N=1000
tc randpar-small-03 gen_random_parent N=1000
tc randline-small-10 gen_random_lines N=1000 K=10
tc randline-small-100 gen_random_lines N=1000 K=50
tc randline-small-1000 gen_random_lines N=1000 K=100

group group3 51
include_group group1
include_group group2

tc rep gen_rep N=100000
tc deepleaves gen_deepleaves N=100000
tc randpar-01 gen_random_parent N=100000
tc randpar-02 gen_random_parent N=100000
tc randpar-03 gen_random_parent N=100000
tc randpar-04 gen_random_parent N=100000
tc randpar-05 gen_random_parent N=100000
