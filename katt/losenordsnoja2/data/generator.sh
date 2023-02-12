#!/usr/bin/env bash

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

use_solution ../../data/empty.py

samplegroup
limits maxn=100000
# sample_manual 1

group group1 14
limits maxn=1000 valid=1
tc_manual ../manual_tests/1a.in
tc_manual ../manual_tests/1b.in
tc_manual ../manual_tests/1c.in
tc_manual ../manual_tests/1d.in
tc_manual ../manual_tests/1e.in
tc_manual ../manual_tests/1f.in
tc_manual ../manual_tests/1g.in
tc_manual ../manual_tests/1h.in

group group2 7
limits maxn=1000
include_group group1
tc_manual ../manual_tests/2a.in
tc_manual ../manual_tests/2b.in
tc_manual ../manual_tests/2c.in
tc_manual ../manual_tests/2d.in
tc_manual ../manual_tests/2e.in
tc_manual ../manual_tests/2f.in
tc_manual ../manual_tests/2g.in
tc_manual ../manual_tests/2h.in

group group3 57
limits maxn=100000 valid=1 linear=1
tc_manual ../manual_tests/3a.in
tc_manual ../manual_tests/3b.in
tc_manual ../manual_tests/3c.in
tc_manual ../manual_tests/3d.in
tc_manual ../manual_tests/3e.in
tc_manual ../manual_tests/3f.in
tc_manual ../manual_tests/3g.in
tc_manual ../manual_tests/3h.in

group group4 22
limits maxn=100000 linear=1
include_group group3
tc_manual ../manual_tests/4a.in
tc_manual ../manual_tests/4b.in
tc_manual ../manual_tests/4c.in
tc_manual ../manual_tests/4d.in
tc_manual ../manual_tests/4e.in
tc_manual ../manual_tests/4f.in
tc_manual ../manual_tests/4g.in
tc_manual ../manual_tests/4h.in
