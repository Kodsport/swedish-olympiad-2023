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
sample_manual 1

group group1 10
limits maxN=2000 maxQ=2000 
include_group sample
tc small-1 gen n=3 q=10 maxA=100 maxX=100
tc small-2 gen n=4 q=10 maxA=100 maxX=100
tc small-3 gen n=3 q=10 maxA=100 maxX=100
tc small-4 gen n=4 q=10 maxA=100 maxX=100
tc small-5 gen n=5 q=10 maxA=100 maxX=100
tc small-7 gen n=5 q=10 maxA=100 maxX=100
tc small-6 gen n=10 q=10 maxA=100 maxX=100
tc small-8 gen n=10 q=10 maxA=100 maxX=100
tc small-9 gen n=10 q=10 maxA=100 maxX=100
tc small-10 gen n=10 q=10 maxA=100 maxX=100
tc small-11 gen n=20 q=2000 maxA=100 maxX=100
tc small-12 gen n=20 q=2000 maxA=100 maxX=100
tc small-13 gen n=20 q=2000 maxA=100 maxX=100
tc small-14 gen n=20 q=2000 maxA=100 maxX=100
tc small-15 gen n=20 q=2000 maxA=100 maxX=100
tc small-16 gen n=20 q=2000 maxA=10 maxX=100
tc small-17 gen n=20 q=2000 maxA=10 maxX=100
tc small-18 gen n=20 q=2000 maxA=10 maxX=100
tc small-19 gen n=20 q=2000 maxA=10 maxX=100
tc small-20 gen n=20 q=2000
tc small-21 gen n=20 q=2000
tc small-22 gen n=20 q=2000
tc small-23 gen n=20 q=2000
tc small-24 gen n=20 q=2000
tc small-25 gen n=20 q=2000
tc small-26 gen n=20 q=2000
tc small-27 gen n=20 q=2000
tc small-28 gen n=20 q=2000
tc small-29 gen n=20 q=2000
tc small-30 gen n=2000 q=2000
tc small-31 gen n=2000 q=2000
tc small-32 gen n=2000 q=2000
tc small-33 gen n=2000 q=2000
tc small-34 gen n=2000 q=2000
tc small-35 gen n=2000 q=2000
tc small-36 gen n=2000 q=2000 modeTree=deep
tc small-37 gen n=2000 q=2000 modeTree=deep
tc small-38 gen n=2000 q=2000 modeTree=deep
tc small-39 gen n=2000 q=2000 modeTree=deeper
tc small-40 gen n=2000 q=2000 modeTree=deeper

group group2 20
limits modeTree=line maxA=100
tc line-small-weights-1 gen n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-2 gen n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-3 gen n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-4 gen n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-5 gen n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-6 gen n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-7 gen n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-8 gen n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-9 gen n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-10 gen n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-11 gen n=$MAXN q=$MAXQ modeTree=line maxA=100 modeWeights=specialLine
tc line-small-weights-12 gen n=$MAXN q=$MAXQ modeTree=line maxA=100 modeWeights=specialLine
tc line-small-weights-13 gen n=$MAXN q=$MAXQ modeTree=line maxA=100 modeWeights=specialLine
tc line-small-weights-14 gen n=$MAXN q=$MAXQ modeTree=line maxA=100 modeWeights=specialLine
tc line-small-weights-15 gen n=$MAXN q=$MAXQ modeTree=line maxA=100 modeWeights=specialLine modeQueries=startToEnd

group group3 25
limits modeTree=line
include_group group2
tc line-large-q-1 gen n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-2 gen n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-3 gen n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-4 gen n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-5 gen n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-6 gen n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-7 gen n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-8 gen n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-9 gen n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-10 gen n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-11 gen n=$MAXN q=$MAXQ modeTree=line modeWeights=specialLine
tc line-large-q-12 gen n=$MAXN q=$MAXQ modeTree=line modeWeights=specialLine
tc line-large-q-13 gen n=$MAXN q=$MAXQ modeTree=line modeWeights=specialLine
tc line-large-q-14 gen n=$MAXN q=$MAXQ modeTree=line modeWeights=specialLine
tc line-large-q-15 gen n=$MAXN q=$MAXQ modeTree=line modeWeights=specialLine modeQueries=startToEnd

group group4 25
limits endAtOne=1
tc end-at-one-1 gen n=3 q=10 maxA=100 maxX=100 endAtOne=1
tc end-at-one-2 gen n=3 q=10 maxA=100 maxX=100 endAtOne=1
tc end-at-one-3 gen n=3 q=10 maxA=100 maxX=100 endAtOne=1
tc end-at-one-4 gen n=4 q=10 maxA=100 maxX=100 endAtOne=1
tc end-at-one-5 gen n=5 q=10 maxA=100 maxX=100 endAtOne=1
tc end-at-one-7 gen n=5 q=10 maxA=100 maxX=100 endAtOne=1
tc end-at-one-6 gen n=10 q=10 maxA=100 maxX=100 endAtOne=1
tc end-at-one-8 gen n=10 q=10 maxA=100 maxX=100 endAtOne=1
tc end-at-one-9 gen n=10 q=10 maxA=100 maxX=100 endAtOne=1
tc end-at-one-10 gen n=10 q=10 maxA=100 maxX=100 endAtOne=1
tc end-at-one-11 gen n=20 q=2000 maxA=100 maxX=100 endAtOne=1
tc end-at-one-12 gen n=20 q=2000 maxA=100 maxX=100 endAtOne=1
tc end-at-one-13 gen n=20 q=2000 maxA=100 maxX=100 endAtOne=1
tc end-at-one-14 gen n=20 q=2000 maxA=100 maxX=100 endAtOne=1
tc end-at-one-15 gen n=20 q=2000 maxA=100 maxX=100 endAtOne=1
tc end-at-one-16 gen n=20 q=2000 maxA=10 maxX=100 endAtOne=1
tc end-at-one-17 gen n=20 q=2000 maxA=10 maxX=100 endAtOne=1
tc end-at-one-18 gen n=20 q=2000 maxA=10 maxX=100 endAtOne=1
tc end-at-one-19 gen n=20 q=2000 maxA=10 maxX=100 endAtOne=1
tc end-at-one-20 gen n=20 q=2000 endAtOne=1
tc end-at-one-21 gen n=20 q=2000 endAtOne=1
tc end-at-one-22 gen n=20 q=2000 endAtOne=1
tc end-at-one-23 gen n=20 q=2000 endAtOne=1
tc end-at-one-24 gen n=20 q=2000 endAtOne=1
tc end-at-one-25 gen n=20 q=2000 endAtOne=1
tc end-at-one-26 gen n=20 q=2000 endAtOne=1
tc end-at-one-27 gen n=20 q=2000 endAtOne=1
tc end-at-one-28 gen n=20 q=2000 endAtOne=1
tc end-at-one-29 gen n=20 q=2000 endAtOne=1
tc end-at-one-30 gen n=20 q=2000 endAtOne=1
tc end-at-one-31 gen n=$MAXN q=$MAXQ endAtOne=1
tc end-at-one-32 gen n=$MAXN q=$MAXQ endAtOne=1
tc end-at-one-33 gen n=$MAXN q=$MAXQ endAtOne=1
tc end-at-one-34 gen n=$MAXN q=$MAXQ endAtOne=1
tc end-at-one-35 gen n=$MAXN q=$MAXQ endAtOne=1
tc end-at-one-36 gen n=$MAXN q=$MAXQ modeTree=deep endAtOne=1
tc end-at-one-37 gen n=$MAXN q=$MAXQ modeTree=deep endAtOne=1
tc end-at-one-38 gen n=$MAXN q=$MAXQ modeTree=deep endAtOne=1
tc end-at-one-39 gen n=$MAXN q=$MAXQ modeTree=deeper endAtOne=1
tc end-at-one-40 gen n=$MAXN q=$MAXQ modeTree=deeper endAtOne=1

group group5 20
include_group sample
include_group group1
include_group group3
include_group group4
tc large-1  gen n=$MAXN q=$MAXQ
tc large-2  gen n=$MAXN q=$MAXQ
tc large-3  gen n=$MAXN q=$MAXQ
tc large-4  gen n=$MAXN q=$MAXQ
tc large-5  gen n=$MAXN q=$MAXQ
tc large-6  gen n=$MAXN q=$MAXQ modeTree=deep
tc large-7  gen n=$MAXN q=$MAXQ modeTree=deep
tc large-8  gen n=$MAXN q=$MAXQ modeTree=deep
tc large-9  gen n=$MAXN q=$MAXQ modeTree=deep
tc large-10 gen n=$MAXN q=$MAXQ modeTree=deeper
tc large-11 gen n=$MAXN q=$MAXQ modeTree=deeper
tc large-12 gen n=$MAXN q=$MAXQ modeTree=killCubic modeWeights=killCubic
tc large-13 gen n=$MAXN q=$MAXQ modeTree=killCubic modeWeights=killCubic
tc large-14 gen n=$MAXN q=$MAXQ modeTree=killCubic modeWeights=killCubic
tc large-15 gen n=$MAXN q=$MAXQ modeTree=killCubic modeWeights=killCubic
tc large-16 gen n=$MAXN q=$MAXQ modeTree=killCubic modeQueries=startToEnd modeWeights=killCubic
tc large-17 gen n=$MAXN q=$MAXQ modeTree=killCubic modeQueries=startToEnd modeWeights=killCubic
tc large-18 gen n=$MAXN q=$MAXQ modeTree=killCubic modeQueries=startToEnd modeWeights=killCubic
tc large-19 gen n=$MAXN q=$MAXQ modeTree=killCubic modeQueries=startToEnd modeWeights=killCubic
tc large-20 gen n=$MAXN q=$MAXQ modeTree=killCubic modeQueries=startToEnd modeWeights=killCubic




