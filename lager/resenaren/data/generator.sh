#!/usr/bin/env bash

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

#ulimit -s unlimited

use_solution abdullah.cpp opt
ulimit -s unlimited

compile gen.py

MAXN=200000
MAXX=1000000000
MAXA=1000000000
MAXQ=100000

samplegroup
sample 1
sample 2

group group1 10
limits maxN=2000 maxQ=2000 
include_group sample
tc small-1 gen n=3 q=10 maxA=100 maxX=100
tc small-4 gen n=4 q=10 maxA=100 maxX=100
tc small-5 gen n=5 q=10 maxA=100 maxX=100
tc small-6 gen n=10 q=10 maxA=100 maxX=100
tc small-8 gen n=10 q=10 maxA=100 maxX=100
tc small-11 gen n=20 q=2000 maxA=100 maxX=100
tc small-12 gen n=20 q=2000 maxA=100 maxX=100
tc small-16 gen n=20 q=2000 maxA=10 maxX=100
tc small-17 gen n=20 q=2000 maxA=10 maxX=100
tc small-20 gen n=20 q=2000
tc small-21 gen n=20 q=2000
tc small-30 gen n=2000 q=2000
tc small-31 gen n=2000 q=2000
tc small-32 gen n=2000 q=2000
tc small-36 gen n=2000 q=2000 modeTree=deep
tc small-37 gen n=2000 q=2000 modeTree=deep
tc small-39 gen n=2000 q=2000 modeTree=deeper
tc small-40 gen n=2000 q=2000 modeTree=deeper

group group2 20
limits modeTree=line maxA=100
tc line-small-weights-1 gen n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-2 gen n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-11 gen n=$MAXN q=$MAXQ modeTree=line maxA=100 modeWeights=specialLine
tc line-small-weights-15 gen n=$MAXN q=$MAXQ modeTree=line maxA=100 modeWeights=specialLine modeQueries=startToEnd

group group3 25
limits modeTree=line
include_group group2
tc line-large-q-1 gen n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-2 gen n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-11 gen n=$MAXN q=$MAXQ modeTree=line modeWeights=specialLine
tc line-large-q-15 gen n=$MAXN q=$MAXQ modeTree=line modeWeights=specialLine modeQueries=startToEnd

group group4 25
limits endAtOne=1
tc end-at-one-1 gen n=3 q=10 maxA=100 maxX=100 endAtOne=1
tc end-at-one-3 gen n=3 q=10 maxA=100 maxX=100 endAtOne=1
tc end-at-one-5 gen n=5 q=10 maxA=100 maxX=100 endAtOne=1
tc end-at-one-6 gen n=10 q=10 maxA=100 maxX=100 endAtOne=1
tc end-at-one-11 gen n=20 q=2000 maxA=100 maxX=100 endAtOne=1
tc end-at-one-12 gen n=20 q=2000 maxA=100 maxX=100 endAtOne=1
tc end-at-one-16 gen n=20 q=2000 maxA=10 maxX=100 endAtOne=1
tc end-at-one-20 gen n=20 q=2000 endAtOne=1
tc end-at-one-21 gen n=20 q=2000 endAtOne=1
tc end-at-one-31 gen n=$MAXN q=$MAXQ endAtOne=1
tc end-at-one-32 gen n=$MAXN q=$MAXQ endAtOne=1
tc end-at-one-36 gen n=$MAXN q=$MAXQ modeTree=deep endAtOne=1
tc end-at-one-37 gen n=$MAXN q=$MAXQ modeTree=deep endAtOne=1
tc end-at-one-39 gen n=$MAXN q=$MAXQ modeTree=deeper endAtOne=1

group group5 20
include_group sample
include_group group1
include_group group3
include_group group4
tc large-1  gen n=$MAXN q=$MAXQ
tc large-2  gen n=$MAXN q=$MAXQ
tc large-6  gen n=$MAXN q=$MAXQ modeTree=deep
tc large-7  gen n=$MAXN q=$MAXQ modeTree=deep
tc large-10 gen n=$MAXN q=$MAXQ modeTree=deeper
tc large-11 gen n=$MAXN q=$MAXQ modeTree=deeper
tc large-12 gen n=$MAXN q=$MAXQ modeTree=killCubic modeWeights=killCubic
tc large-13 gen n=$MAXN q=$MAXQ modeTree=killCubic modeWeights=killCubic
tc large-16 gen n=$MAXN q=$MAXQ modeTree=killCubic modeQueries=startToEnd modeWeights=killCubic
tc large-17 gen n=$MAXN q=$MAXQ modeTree=killCubic modeQueries=startToEnd modeWeights=killCubic
