#!/usr/bin/env bash

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution skogsvaktare.cpp

MAXN=500000
MAXF=500000

samplegroup
limits maxn=$MAXN maxf=$MAXF
sample 1
sample 2
sample 3

group group1 8
limits maxn=$MAXN maxf=$MAXF line=1
tc 1
tc_manual ../manual_tests/1a.in
tc_manual ../manual_tests/1b.in
tc_manual ../manual_tests/1c.in
tc_manual ../manual_tests/1d.in

group group2 18
limits maxn=$MAXN maxf=15
tc 1
tc 2
tc 3
tc_manual ../manual_tests/2a.in
tc_manual ../manual_tests/2b.in
tc_manual ../manual_tests/2c.in
tc_manual ../manual_tests/2d.in
tc_manual ../manual_tests/2e.in
tc_manual ../manual_tests/2f.in

group group3 23
limits maxn=2000 maxf=$MAXF
tc 1
tc 2
tc 3
tc_manual ../manual_tests/3a.in
tc_manual ../manual_tests/3b.in
tc_manual ../manual_tests/3c.in
tc_manual ../manual_tests/3d.in
tc_manual ../manual_tests/3e.in
tc_manual ../manual_tests/3f.in
tc_manual ../manual_tests/3g.in
tc_manual ../manual_tests/3h.in
tc_manual ../manual_tests/3i.in
tc_manual ../manual_tests/3j.in
tc_manual ../manual_tests/3k.in
tc_manual ../manual_tests/3l.in
tc_manual ../manual_tests/3m.in
tc_manual ../manual_tests/3n.in
tc_manual ../manual_tests/3o.in

group group4 51
limits maxn=$MAXN maxf=$MAXF
include_group group1
include_group group2
include_group group3
tc 1
tc 2
tc 3
tc_manual ../manual_tests/4a.in
tc_manual ../manual_tests/4b.in
tc_manual ../manual_tests/4c.in
tc_manual ../manual_tests/4d.in
tc_manual ../manual_tests/4e.in
tc_manual ../manual_tests/4f.in
tc_manual ../manual_tests/4g.in
tc_manual ../manual_tests/4h.in
tc_manual ../manual_tests/4i.in
tc_manual ../manual_tests/4j.in
tc_manual ../manual_tests/4k.in
tc_manual ../manual_tests/4l.in
tc_manual ../manual_tests/4m.in
tc_manual ../manual_tests/4n.in
tc_manual ../manual_tests/4o.in
tc_manual ../manual_tests/4p.in
tc_manual ../manual_tests/4q.in
tc_manual ../manual_tests/4r.in
tc_manual ../manual_tests/4s.in
tc_manual ../manual_tests/4t.in
