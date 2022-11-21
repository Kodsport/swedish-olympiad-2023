#!/usr/bin/env bash

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution victor.cpp

compile gen_random.py

samplegroup
limits max_n=10
sample_manual 1
sample_manual 2
sample_manual 3

group group1 9
limits max_n=100 min_k=1 max_k=1
tc g1-1 gen_random n=1 k=1 min_height=1 max_height=1000000000 mode="normal" seed=0
tc g1-2 gen_random n=99 k=1 min_height=1 max_height=1000000000 mode="normal" seed=1
tc g1-3 gen_random n=99 k=1 min_height=10 max_height=100 mode="normal" seed=2
tc g1-4 gen_random n=100 k=1 min_height=1000000000 max_height=1000000000 mode="normal" seed=3
tc g1-5 gen_random n=100 k=1 min_height=1 max_height=1000000000 mode="unique" seed=4
tc g1-6 gen_random n=100 k=1 min_height=1 max_height=1000000000 mode="increasing-even-rect-distribution" seed=5
tc g1-7 gen_random n=100 k=1 min_height=1 max_height=1000000000 mode="derivative" seed=6
tc g1-8 gen_random n=100 k=1 min_height=100 max_height=10000 mode="derivative" seed=7
tc g1-9 gen_random n=100 k=1 min_height=1000000 max_height=100000000 mode="normal" seed=8


group group2 22
limits max_n=50000 increasing=1
tc g2-1 gen_random n=49999 k=0 min_height=1 max_height=1000000000 mode="increasing" seed=9
tc g2-2 gen_random n=15 k=20 min_height=1000 max_height=1000000000 mode="increasing" seed=10
tc g2-3 gen_random n=49999 k=10 min_height=1 max_height=1000000000 mode="increasing" seed=11
tc g2-4 gen_random n=50000 k=15 min_height=1000000000 max_height=1000000000 mode="increasing-even-rect-distribution" seed=12
tc g2-5 gen_random n=50000 k=20 min_height=1000 max_height=100000000 mode="increasing-even-rect-distribution" seed=13
tc g2-6 gen_random n=50000 k=7 min_height=1000 max_height=100000000 mode="increasing-even-rect-distribution" seed=14


group group3 25
limits max_n=50000 max_k=0
tc g3-1 gen_random n=49999 k=0 min_height=10 max_height=100 mode="normal" seed=15
tc g3-2 gen_random n=1 k=0 min_height=1 max_height=1000000000 mode="normal" seed=16
tc g3-3 gen_random n=49999 k=0 min_height=1000000000 max_height=1000000000 mode="normal" seed=17
tc g3-4 gen_random n=50000 k=0 min_height=1 max_height=1000000000 mode="unique" seed=15
tc g3-5 gen_random n=50000 k=0 min_height=1 max_height=1000000000 mode="derivative" seed=18
tc g3-6 gen_random n=50000 k=0 min_height=1000 max_height=1000000000 mode="derivative" seed=19
tc g3-7 gen_random n=50000 k=0 min_height=1000 max_height=1000000000 mode="derivative" seed=20
tc g3-8 gen_random n=50000 k=0 min_height=100 max_height=1000000 mode="normal" seed=21


group group4 16
include_group sample
include_group group1
limits max_n=2000
tc g4-1 gen_random n=1 k=2 min_height=1 max_height=1000000000 mode="normal" seed=21
tc g4-2 gen_random n=1999 k=15 min_height=1 max_height=1000000000 mode="normal" seed=22
tc g4-3 gen_random n=1999 k=20 min_height=1 max_height=1000000000 mode="normal" seed=23
tc g4-4 gen_random n=2000 k=18 min_height=100 max_height=1000000000 mode="normal" seed=24
tc g4-5 gen_random n=2000 k=4 min_height=1000000000 max_height=1000000000 mode="unique" seed=25
tc g4-6 gen_random n=2000 k=8 min_height=1 max_height=1000000000 mode="normal" seed=26
tc g4-7 gen_random n=2000 k=10 min_height=1 max_height=1000000000 mode="derivative" seed=27


group group5 28
include_group group2
include_group group3
include_group group4
limits max_n=50000
tc g5-1 gen_random n=49999 k=19 min_height=1 max_height=1000000000 mode="normal" seed = 28
tc g5-2 gen_random n=49999 k=20 min_height=1000 max_height=1000000000 mode="derivative" seed = 29
tc g5-3 gen_random n=49999 k=20 min_height=1 max_height=1000000000 mode="derivative" seed = 30
tc g5-4 gen_random n=50000 k=19 min_height=10 max_height=100 mode="normal" seed = 31
tc g5-5 gen_random n=50000 k=19 min_height=1000 max_height=1000000000 mode="normal" seed = 31
tc g5-6 gen_random n=50000 k=20 min_height=1 max_height=100 mode="derivative" seed = 32
tc g5-7 gen_random n=50000 k=20 min_height=1000000000 max_height=1000000000 mode="normal" seed = 34
tc g5-8 gen_random n=50000 k=20 min_height=1000 max_height=1000000000 mode="derivative" seed = 35
tc g5-9 gen_random n=50000 k=20 min_height=10000 max_height=10000000 mode="derivative" seed = 36
