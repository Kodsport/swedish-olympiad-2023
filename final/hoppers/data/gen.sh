#!/bin/bash
. ../../testdata_tools/gen.sh
ulimit -s unlimited

use_solution joshua.cpp

compile gen_random.py
compile gen_cycle.py
compile gen_noup.py
compile gen_tree.py
compile gen_eq_dist.cpp

samplegroup
limits maxn=100 maxtiles=100
sample 1
sample 2
sample 3

group small 10
include_group sample
limits maxtiles=1000 maxn=1000
tc 1
tc 2
tc 3
tc_manual ../manual_tc/manual1.in
tc_manual ../manual_tc/manual2.in
tc_manual ../manual_tc/manual3.in
tc_manual ../manual_tc/manual4.in
tc_manual ../manual_tc/manual5.in
tc_manual ../manual_tc/manual6.in
tc_manual ../manual_tc/manual7.in
tc smallrand1 gen_random tiles=1000 r=100 n=500
tc smallrand2 gen_random tiles=1000 r=200 n=500
tc smallrand3 gen_random tiles=1000 r=400 n=500
tc smallrand4 gen_random tiles=1000 r=10  n=500
tc smallrand5 gen_random tiles=1000 r=100 n=500
tc smallcycle1 gen_cycle tiles=1000 r=30  n=500 p_within=0.2 cycle_rows=14 p_rot=0.1
tc smallcycle2 gen_cycle tiles=1000 r=30  n=500 p_within=0.2 cycle_rows=14 p_rot=0.1
tc smalltree1  gen_tree  tiles=1000 r=30  n=500 max_depth=5
tc smalltree2  gen_tree  tiles=1000 r=20  n=500 max_depth=10
tc smalltree3  gen_tree  tiles=1000 r=10  n=500 max_depth=100
tc smalltree4  gen_tree  tiles=1000 r=100 n=500 max_depth=500
tc smalltree5  gen_tree  tiles=1000 r=30  n=500 max_depth=5   branching=1
tc smalltree6  gen_tree  tiles=1000 r=20  n=500 max_depth=10  branching=1
tc smalltree7  gen_tree  tiles=1000 r=10  n=500 max_depth=100 branching=1
tc smalltree8  gen_tree  tiles=1000 r=100 n=500 max_depth=500 branching=1
tc smalltree9  gen_tree  tiles=1000 r=30  n=500 max_depth=5   branching=2
tc smalltree10 gen_tree  tiles=1000 r=20  n=500 max_depth=10  branching=2
tc smalltree11 gen_tree  tiles=1000 r=10  n=500 max_depth=100 branching=2
tc smalltree12 gen_tree  tiles=1000 r=100 n=500 max_depth=500 branching=2

group medium 35
include_group small
limits maxtiles=1000000 maxn=1000
tc mediumrand1 gen_random tiles=1000000 r=1000  n=1000
tc mediumrand2 gen_random tiles=1000000 r=10000 n=1000
tc mediumrand3 gen_random tiles=1000000 r=400   n=1000
tc mediumrand4 gen_random tiles=1000000 r=10    n=1000
tc mediumrand5 gen_random tiles=1000000 r=100   n=1000
tc mediumcycle1 gen_cycle tiles=1000000 r=1000  n=1000 p_within=0.1 cycle_rows=500 p_rot=0.1
tc mediumcycle2 gen_cycle tiles=1000000 r=1000  n=1000 p_within=0.5 cycle_rows=500 p_rot=0.1
tc mediumcycle3 gen_cycle tiles=1000000 r=1000  n=1000 p_within=0.1 cycle_rows=500 p_rot=0.6
tc mediumcycle4 gen_cycle tiles=1000000 r=1000  n=1000 p_within=0.8 cycle_rows=500 p_rot=0.2
tc mediumcycle5 gen_cycle tiles=1000000 r=1000  n=1000 p_within=0.9 cycle_rows=900 p_rot=0.1
tc mediumcycle6 gen_cycle tiles=1000000 r=100   n=1000 p_within=0.5 cycle_rows=50 p_rot=0.1
tc mediumcycle7 gen_cycle tiles=1000000 r=100   n=1000 p_within=0.8 cycle_rows=50 p_rot=0.1
tc mediumtree1  gen_tree  tiles=1000000 r=1000  n=1000 max_depth=20
tc mediumtree2  gen_tree  tiles=1000000 r=1000  n=1000 max_depth=1000
tc mediumtree3  gen_tree  tiles=1000000 r=1000  n=1000 max_depth=100000
tc mediumtree4  gen_tree  tiles=1000000 r=1000  n=1000 max_depth=1000000

group linetrees 15
limits maxtiles=1000000 maxn=100000
tc linetree1 gen_cycle tiles=1000000 r=1000  n=100000 p_within=0.1 cycle_rows=500 p_rot=0.0
tc linetree2 gen_cycle tiles=1000000 r=1000  n=100000 p_within=0.5 cycle_rows=500 p_rot=0.0
tc linetree3 gen_cycle tiles=1000000 r=1000  n=100000 p_within=0.1 cycle_rows=500 p_rot=0.0
tc linetree4 gen_cycle tiles=1000000 r=1000  n=100000 p_within=0.8 cycle_rows=500 p_rot=0.0
tc linetree5 gen_cycle tiles=1000000 r=1000  n=100000 p_within=0.9 cycle_rows=900 p_rot=0.0
tc linetree6 gen_cycle tiles=1000000 r=100   n=100000 p_within=0.5 cycle_rows=50  p_rot=0.0
tc linetree7 gen_cycle tiles=1000000 r=100   n=100000 p_within=0.8 cycle_rows=50  p_rot=0.0
tc linetree8 gen_cycle tiles=1000000  r=100000 n=100000 p_within=0.5 cycle_rows=50000 p_rot=0.0
tc linetree9 gen_cycle tiles=1000000  r=100000 n=100000 p_within=0.8 cycle_rows=50000 p_rot=0.0
tc linetree10 gen_cycle tiles=1000000 r=100000 n=100000 p_within=0.3 cycle_rows=50000 p_rot=0.0
tc linetree11 gen_cycle tiles=1000000 r=100000 n=100000 p_within=0.7 cycle_rows=50000 p_rot=0.0

group noup 25
limits maxtiles=1000000 maxn=100000 noup=1
tc nouprand1 gen_noup tiles=1000000 r=10000 n=100000
tc nouprand2 gen_noup tiles=1000000 r=1000  n=100000
tc nouprand3 gen_noup tiles=1000000 r=400   n=100000
tc nouprand4 gen_noup tiles=1000000 r=10    n=100000
tc nouprand5 gen_noup tiles=1000000 r=100   n=100000
tc nouptree1 gen_tree tiles=1000000 r=1000  n=100000 noup=1 max_depth=20
tc nouptree2 gen_tree tiles=1000000 r=1000  n=100000 noup=1 max_depth=100000
tc nouptree3 gen_tree tiles=1000000 r=1000  n=100000 noup=1 max_depth=1000000
tc nouptree4 gen_tree tiles=1000000 r=1000  n=100000 noup=1 max_depth=100000 branching=1
tc nouptree5 gen_tree tiles=1000000 r=1000  n=100000 noup=1 max_depth=500000 branching=2
tc noupalldown1 gen_cycle tiles=1000000 r=100000 n=100000 p_within=1 cycle_rows=0 p_rot=0.05 noup=1
tc noupalldown2 gen_cycle tiles=1000000 r=500000 n=100000 p_within=1 cycle_rows=0 p_rot=0.1  noup=1
tc noupalldown3 gen_cycle tiles=1000000 r=500000 n=100000 p_within=1 cycle_rows=0 p_rot=0.15 noup=1


group large 15
include_group small
include_group medium
include_group noup
include_group linetrees
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
tc largetree4  gen_tree  tiles=1000000 r=1000 n=100000 max_depth=1000000
tc largetree5  gen_tree  tiles=1000000 r=1000 n=100000 max_depth=20      branching=1
tc largetree6  gen_tree  tiles=1000000 r=1000 n=100000 max_depth=1000    branching=1
tc largetree7  gen_tree  tiles=1000000 r=1000 n=100000 max_depth=100000  branching=1
tc largetree8  gen_tree  tiles=1000000 r=1000 n=100000 max_depth=1000000 branching=1
tc largeeqdist1 gen_eq_dist 8 0.5 1000 
tc largeeqdist2 gen_eq_dist 8 0.4 20000 
tc largeeqdist3 gen_eq_dist 8 0.3 40000 
tc largeeqdist4 gen_eq_dist 8 0.2 60000 
tc largeeqdist5 gen_eq_dist 8 0.1 80000