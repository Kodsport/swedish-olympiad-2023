#!/usr/bin/env bash

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

#ulimit -s unlimited

use_solution nils.cpp

compile gen_random.py

MAXN=200
MAXX=200
MAXA=40000
MAXQ=400000

samplegroup
limits maxn=$MAXN maxx=$MAXX maxa=$MAXA maxd=$MAXA maxq=$MAXQ
sample_manual 1

group group1 11
limits maxn=$MAXN maxx=$MAXX maxa=0 maxd=$MAXA maxq=$MAXQ
tc noattack-1 gen_random n=1 q=100 max_A=0 max_D=400
tc noattack-2 gen_random n=$MAXN max_A=0
tc noattack-3 gen_random n=$MAXN max_A=0
tc noattack-4 gen_random n=$MAXN max_A=0 min_a=150
tc noattack-5 gen_random n=$MAXN q=10 max_A=0 max_a=0
tc noattack-6 gen_random n=$MAXN max_A=0 min_D=20000 
tc noattack-7 gen_random n=$MAXN max_A=0 mode=exponential

group group2 16
limits maxn=5 maxx=$MAXX maxa=$MAXA maxd=$MAXA maxq=1000
tc small-1 gen_random n=1 q=10 max_A=400 max_D=400
tc small-2 gen_random n=2 q=1000 max_A=410 max_D=430
tc small-3 gen_random n=3 q=1000 max_A=650 max_D=650
tc small-4 gen_random n=4 q=1000 max_A=850 max_D=850
tc small-5 gen_random n=5 q=1000 max_A=1050 max_D=1050
tc small-6 gen_random n=5 q=1000 max_A=1250 max_D=1050
tc small-7 gen_random n=5 q=1000
tc small-8 gen_random n=5 q=1000 max_A=1000
tc small-9 gen_random n=5 q=1000 max_a=1 min_d=2 max_A=1000 max_D=5
tc small-10 gen_random n=5 q=1000 mode=exponential
tc 1

group group3 20
limits maxn=$MAXN maxx=$MAXX maxa=$MAXA maxd=0 maxq=$MAXQ
tc nodefence-1 gen_random n=1 q=100 max_D=0 max_A=800
tc nodefence-2 gen_random n=$MAXN q=$MAXQ max_D=0
tc nodefence-3 gen_random n=$MAXN q=$MAXQ max_a=1 min_d=2 max_D=0
tc nodefence-4 gen_random n=$MAXN q=$MAXQ max_d=5 max_D=0
tc nodefence-5 gen_random n=$MAXN q=$MAXQ max_D=0 mode=exponential

group group4 24
limits maxn=30 maxx=30 maxa=$MAXA maxd=$MAXA maxq=1000
tc medium-1 gen_random n=1 q=100 max_a=30 max_d=30 max_A=100 max_D=100
tc medium-2 gen_random n=30 q=1000 max_a=30 max_d=30 max_A=1000 max_D=1000
tc medium-3 gen_random n=30 q=1000 max_a=30 max_d=30
tc medium-4 gen_random n=30 q=1000 max_a=30 max_d=30 min_A=$MAXA min_D=$MAXA
tc medium-5 gen_random n=30 q=1000 max_a=1 min_d=2 max_d=30 max_A=1000 max_D=20
tc medium-6 gen_random n=30 q=1000 max_a=30 max_d=2 min_a=3 max_A=60
tc medium-7 gen_random n=30 q=1000 max_a=30 max_d=30 mode=exponential

group group5 29
limits maxn=$MAXN maxx=$MAXX maxa=$MAXA maxd=$MAXA maxq=$MAXQ
include_group group1
include_group group2
include_group group3
include_group group4
tc large-1 gen_random n=$MAXN q=$MAXQ 
tc large-2 gen_random n=$MAXN q=$MAXQ min_d=$MAXX min_a=$MAXX min_A=$MAXA min_D=$MAXA 
tc large-3 gen_random n=$MAXN q=$MAXQ max_a=10 min_d=11 max_D=1500
tc large-4 gen_random n=$MAXN q=$MAXQ max_d=10 min_a=11 max_A=2000
tc large-5 gen_random n=$MAXN q=$MAXQ min_a=100
tc large-6 gen_random n=$MAXN q=$MAXQ min_d=100
tc large-7 gen_random n=$MAXN q=$MAXQ min_a=100 min_d=100
tc large-8 gen_random n=$MAXN q=$MAXQ mode=exponential
tc large-9 gen_random n=$MAXN q=$MAXQ min_A=14000 min_D=14000 mode=exponential
tc large-10 gen_random n=$MAXN q=$MAXQ min_A=28000 min_D=28000 mode=exponential
