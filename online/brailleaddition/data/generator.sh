#!/usr/bin/env bash

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

use_solution js.cpp lk.py

compile gen_random.py
compile gen_zero.py

sample 1
sample 2
sample 3

group g1 31
limits only1=1
tc exact01 gen_random n=1 m=1 flag=1
tc exact02 gen_random n=2 m=2 flag=1
tc exact03 gen_random n=3 m=3 flag=1
tc exact04 gen_random n=4 m=4 flag=1
tc exact05 gen_random n=2 m=5 flag=1
tc exact06 gen_random n=3 m=6 flag=1
tc exact07 gen_random n=4 m=7 flag=1
tc exact08 gen_random n=8 m=5 flag=1
tc exact09 gen_random n=9 m=9 flag=1


group g2 69
include_group g1
tc 1
tc 2
tc 3
tc zero01 gen_zero n=1 m=0
tc zero02 gen_zero n=0 m=1
tc zero03 gen_zero n=0 m=9
tc zero04 gen_zero n=9 m=0
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
