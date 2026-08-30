#!/usr/bin/env bash

. ../../../testdata_tools/gen.sh

use_solution js.cpp

compile gen_a.py
compile gen_rand.py
compile gen_complete.py
compile gen_tree.py

samplegroup
sample 1
sample 2

group g1 20
limits onlya=1
tc 1
tg_manual ../manual_tests/g1
tc only_a1 gen_a n=3  d=3 dev=1
tc only_a2 gen_a n=10 d=50 dev=20
tc only_a3 gen_a n=15 d=1 dev=0
tc only_a4 gen_a n=9  d=95 dev=1
tc only_a5 gen_a n=5  d=70 dev=10


group g2 80
include_group g1
tc 2
tg_manual ../manual_tests/g2
tc complete1 gen_complete n=5 d=50 dev=20
tc complete2 gen_complete n=10 d=10 dev=2
tc complete3 gen_complete n=15 d=90 dev=7
tc tree1 gen_tree n=10 d=20 dev=10
tc tree2 gen_tree n=4 d=70 dev=10
tc tree3 gen_tree n=7 d=50 dev=30
tc rand1 gen_rand n=12 d=20 dev=13
tc rand2 gen_rand n=6 d=60 dev=13
tc rand3 gen_rand n=5 d=40 dev=35
tc rand4 gen_rand n=10 d=2 dev=1
tc rand5 gen_rand n=11 d=95 dev=3
