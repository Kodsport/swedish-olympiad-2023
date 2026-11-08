#!/usr/bin/env bash

. ../../../testdata_tools/gen.sh

use_solution js.cpp

compile gen.py

samplegroup
sample 1
sample 2

group g1 20
limits mxS=300
include_group sample
tg_manual ../manual_tests/tiny
tc small1 gen idx=0 num_add=70
tc small2 gen idx=1 num_add=32
tc small3 gen idx=2 num_add=5
tc small4 gen idx=3 num_add=12
tc small5 gen idx=4 num_add=50
tc small6 gen idx=5 num_add=69
tc small7 gen idx=6 num_add=17
tc small8 gen idx=7 num_add=1
for idx in {0..6}; do
    tc g1-tiny-$idx gen idx=$idx num_add=0
done

group g2 20
include_group g1
limits mxS=2000
tg_manual ../manual_tests/small
tc medium1 gen idx=0 num_add=490
tc medium2 gen idx=1 num_add=325
tc medium3 gen idx=2 num_add=50
tc medium4 gen idx=3 num_add=120
tc medium5 gen idx=4 num_add=50
tc medium6 gen idx=5 num_add=350
tc medium7 gen idx=6 num_add=170
tc medium8 gen idx=7 num_add=10

group g3 20
limits no4=1
tg_manual ../manual_tests/no_4
tc no4_1 gen idx=0 no4=1 num_add=2300000
tc no4_2 gen idx=1 no4=1 num_add=5000
tc no4_3 gen idx=2 no4=1 num_add=120000
tc no4_4 gen idx=3 no4=1 num_add=500000
tc no4_5 gen idx=4 no4=1 num_add=10
tc g1-tiny-5
for idx in {1..4}; do
    tc g3-tiny-$idx gen idx=$idx num_add=0 no4=1
done

group g4 40
include_group g2 g3
tg_manual ../manual_tests/full
tc large1 gen idx=0 num_add=2300000
tc large2 gen idx=1 num_add=1200000
tc large3 gen idx=2 num_add=500000
tc large4 gen idx=3 num_add=1700000
tc large5 gen idx=4 num_add=600000
tc large6 gen idx=5 num_add=2000000
tc large7 gen idx=6 num_add=1745687
tc large8 gen idx=7 num_add=1176562
