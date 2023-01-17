#!/usr/bin/env bash

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

#ulimit -s unlimited

# The ans-files will be garbage since the problem is interactive
# But there must be ans files, so...
use_solution nils.cpp

compile gen_random.py

MAXN=1000
MAXX=1000000000

# no sample
#samplegroup
#limits maxn=$MAXN maxx=$MAXX t=2
#sample_manual 1

group group1 15
limits maxn=1 maxx=$MAXX t=1
tc one-1 gen_random n=1 t=1
tc one-2 gen_random n=1 t=1
tc one-3 gen_random n=1 t=1
tc one-4 gen_random n=1 t=1 max_x=1
tc one-5 gen_random n=1 t=1 min_x=$MAXX
tc one-6 gen_random n=1 t=1 min_x=2 max_x=2

group group2 15
limits maxn=2 maxx=$MAXX t=2
tc two-1 gen_random n=2 t=2
tc two-2 gen_random n=2 t=2
tc two-3 gen_random n=2 t=2
tc two-4 gen_random n=2 t=2 max_x=2
tc two-5 gen_random n=2 t=2 min_x=$(($MAXX-1))
tc two-6 gen_random n=2 t=2 min_x=444444444 max_x=444444445

group group3 11
limits maxn=$MAXN maxx=$MAXX t=3
tc smallx-1 gen_random n=1 t=3 max_x=1
tc smallx-2 gen_random n=1 t=3 min_x=2 max_x=2
tc smallx-3 gen_random n=2 t=3 max_x=3
tc smallx-4 gen_random n=20 t=3 max_x=21
tc smallx-5 gen_random n=$MAXN t=3 max_x=$MAXN
tc smallx-6 gen_random n=$MAXN t=3 max_x=$(($MAXN+1))
tc smallx-7 gen_random n=$MAXN t=3 max_x=$(($MAXN+1))
tc smallx-8 gen_random n=$MAXN t=3 max_x=$(($MAXN+1))
tc smallx-9 gen_random n=$MAXN t=3 max_x=$(($MAXN+1))
tc smallx-10 gen_random n=$MAXN t=3 min_x=2 max_x=$(($MAXN+1))

group group4 37
limits maxn=100 maxx=10000 t=4
tc almost-1 gen_random n=1 t=4 max_x=1
tc almost-2 gen_random n=5 t=4 max_x=5
tc almost-3 gen_random n=100 t=4 max_x=10000
tc almost-4 gen_random n=100 t=4 max_x=10000
tc almost-5 gen_random n=100 t=4 max_x=10000
tc almost-6 gen_random n=100 t=4 min_x=1000 max_x=10000
tc almost-7 gen_random n=100 t=4 min_x=9777 max_x=10000

group group5 22
limits maxn=$MAXN maxx=$MAXX t=5
tc large-1 gen_random n=10 t=5
tc large-2 gen_random n=100 t=5
tc large-3 gen_random n=$MAXN t=5
tc large-4 gen_random n=$MAXN t=5
tc large-5 gen_random n=$MAXN t=5
tc large-6 gen_random n=$MAXN t=5 min_x=$(($MAXX-7000))
