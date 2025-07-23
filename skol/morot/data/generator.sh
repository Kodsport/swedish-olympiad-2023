#!/usr/bin/env bash

PPATH=$(realpath ..)

. ../../testdata_tools/gen.sh

use_solution js.py

compile gen_nosame.py
compile gen_rand.py
compile gen_last_same.py

samplegroup
sample 1
sample 2
sample 3

group g1 40
limits nosame=1
tc nosame1 gen_nosame
tc nosame2 gen_nosame
tc nosame3 gen_nosame
tc nosame4 gen_nosame
tc nosame5 gen_nosame
tc nosame6 gen_nosame
tc nosame7 gen_nosame
tc nosame8 gen_nosame
tc nosame9 gen_nosame
tc nosame10 gen_nosame

group g2 60
include_group sample
include_group g1
tc_manual one
tc rand1 gen_rand
tc rand2 gen_rand
tc rand3 gen_rand
tc rand4 gen_rand
tc rand5 gen_rand
tc last_same1 gen_last_same
tc last_same2 gen_last_same
tc last_same3 gen_last_same
