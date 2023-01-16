#!/bin/bash
. ../../testdata_tools/gen.sh
ulimit -s unlimited

use_solution joshua.cpp

compile gen_random.py
compile gen_cycle.py
compile gen_noup.py
compile gen_tree.py

samplegroup
sample 1
sample 2
sample 3
sample 4
sample 5

group small 1
limits maxtiles=1000 maxn=1000
tc 1
tc 2
tc 3
tc 4
tc 5
tc smallrand1 gen_random tiles=1000 r=100 n=1000
tc smallrand2 gen_random tiles=1000 r=200 n=1000
tc smallrand3 gen_random tiles=1000 r=400 n=1000
tc smallrand4 gen_random tiles=1000 r=10  n=1000
tc smallrand5 gen_random tiles=1000 r=100 n=1000
tc smallcycle1 gen_cycle tiles=1000 r=30 n=1000 p_within=0.1 cycle_rows=15 p_rot=0.1
tc smallcycle2 gen_cycle tiles=1000 r=30 n=1000 p_within=0.1 cycle_rows=15 p_rot=0.1

group noup 10
limits maxtiles=1000000 maxn=100000
tc nouprand1 gen_noup tiles=1000000 r=10000 n=100000
tc nouprand2 gen_noup tiles=1000000 r=1000  n=100000
tc nouprand3 gen_noup tiles=1000000 r=400   n=100000
tc nouprand4 gen_noup tiles=1000000 r=10    n=100000
tc nouprand5 gen_noup tiles=1000000 r=100   n=100000


group large 100
include_group small
limits maxtiles=1000000 maxn=100000
tc largerand1 gen_random tiles=1000000 r=1000  n=100000
tc largerand2 gen_random tiles=1000000 r=10000 n=100000
tc largerand3 gen_random tiles=1000000 r=400   n=100000
tc largerand4 gen_random tiles=1000000 r=10    n=100000
tc largerand5 gen_random tiles=1000000 r=100   n=100000
tc largecycle1 gen_cycle tiles=1000000 r=1000 n=100000 p_within=0.1 cycle_rows=500 p_rot=0.1
tc largecycle2 gen_cycle tiles=1000000 r=1000 n=100000 p_within=0.5 cycle_rows=500 p_rot=0.1
tc largecycle3 gen_cycle tiles=1000000 r=1000 n=100000 p_within=0.1 cycle_rows=500 p_rot=0.6
tc largecycle4 gen_cycle tiles=1000000 r=1000 n=100000 p_within=0.8 cycle_rows=500 p_rot=0.2
tc largecycle5 gen_cycle tiles=1000000 r=1000 n=100000 p_within=0.9 cycle_rows=900 p_rot=0.1
tc largecycle6 gen_cycle tiles=1000000 r=100  n=100000 p_within=0.5 cycle_rows=50 p_rot=0.1
tc largecycle7 gen_cycle tiles=1000000 r=100  n=100000 p_within=0.8 cycle_rows=50 p_rot=0.1
tc largetree1  gen_tree  tiles=1000000 r=1000 n=100000 max_depth=20
tc largetree2  gen_tree  tiles=1000000 r=1000 n=100000 max_depth=1000
tc largetree3  gen_tree  tiles=1000000 r=1000 n=100000 max_depth=100000
