#!/usr/bin/env bash

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution flood.cpp

MAXR=200000
MAXC=200000
MAXRC=200000
MAXX=99999
MAXQ=100000

samplegroup
limits maxr=$MAXR maxc=$MAXC maxrc=$MAXRC maxx=$MAXX maxq=$MAXQ
sample 1
sample 2
sample 3

group group1 8
limits maxr=$MAXR maxc=$MAXC maxrc=10000 maxx=$MAXX maxq=10000
tc 1
tc 2
tc 3
tc_manual ../manual_tests/1a.in
tc_manual ../manual_tests/1b.in
tc_manual ../manual_tests/1c.in
tc_manual ../manual_tests/1d.in
tc_manual ../manual_tests/1e.in
tc_manual ../manual_tests/1f.in
tc_manual ../manual_tests/1g.in

group group2 9
limits maxr=1 maxc=$MAXC maxrc=$MAXRC maxx=$MAXX maxq=$MAXQ
tc_manual ../manual_tests/2a.in
tc_manual ../manual_tests/2b.in
tc_manual ../manual_tests/2c.in

group group3 31
limits maxr=$MAXR maxc=$MAXC maxrc=$MAXRC maxx=1 maxq=$MAXQ
tc_manual ../manual_tests/3a.in
tc_manual ../manual_tests/3b.in
tc_manual ../manual_tests/3c.in
tc_manual ../manual_tests/3d.in
tc_manual ../manual_tests/3e.in

group group4 52
limits maxr=$MAXR maxc=$MAXC maxrc=$MAXRC maxx=$MAXX maxq=$MAXQ
include_group group1
include_group group2
include_group group3
tc_manual ../manual_tests/4a.in
tc_manual ../manual_tests/4b.in
tc_manual ../manual_tests/4c.in
tc_manual ../manual_tests/4d.in
tc_manual ../manual_tests/4e.in
tc_manual ../manual_tests/4f.in
tc_manual ../manual_tests/4g.in
tc_manual ../manual_tests/4h.in
tc_manual ../manual_tests/4i.in
