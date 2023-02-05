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
tc small-1 gen n=3 q=10 maxA=100 maxX=100 seed=1
tc small-2 gen n=4 q=10 maxA=100 maxX=100 seed=2
tc small-3 gen n=3 q=10 maxA=100 maxX=100 seed=3
tc small-4 gen n=4 q=10 maxA=100 maxX=100 seed=4
tc small-5 gen n=5 q=10 maxA=100 maxX=100 seed=5
tc small-7 gen n=5 q=10 maxA=100 maxX=100 seed=7
tc small-6 gen n=10 q=10 maxA=100 maxX=100 seed=6
tc small-8 gen n=10 q=10 maxA=100 maxX=100 seed=8
tc small-9 gen n=10 q=10 maxA=100 maxX=100 seed=9
tc small-10 gen n=10 q=10 maxA=100 maxX=100 seed=10
tc small-11 gen n=20 q=2000 maxA=100 maxX=100 seed=11
tc small-12 gen n=20 q=2000 maxA=100 maxX=100 seed=12
tc small-13 gen n=20 q=2000 maxA=100 maxX=100 seed=13
tc small-14 gen n=20 q=2000 maxA=100 maxX=100 seed=14
tc small-15 gen n=20 q=2000 maxA=100 maxX=100 seed=15
tc small-16 gen n=20 q=2000 maxA=10 maxX=100 seed=16
tc small-17 gen n=20 q=2000 maxA=10 maxX=100 seed=17
tc small-18 gen n=20 q=2000 maxA=10 maxX=100 seed=18
tc small-19 gen n=20 q=2000 maxA=10 maxX=100 seed=19
tc small-20 gen n=20 q=2000 seed=20
tc small-21 gen n=20 q=2000 seed=21
tc small-22 gen n=20 q=2000 seed=22
tc small-23 gen n=20 q=2000 seed=23
tc small-24 gen n=20 q=2000 seed=24
tc small-25 gen n=20 q=2000 seed=25
tc small-26 gen n=20 q=2000 seed=26
tc small-27 gen n=20 q=2000 seed=27
tc small-28 gen n=20 q=2000 seed=28
tc small-29 gen n=20 q=2000 seed=29
tc small-30 gen n=2000 q=2000 seed=30
tc small-31 gen n=2000 q=2000 seed=31
tc small-32 gen n=2000 q=2000 seed=32
tc small-33 gen n=2000 q=2000 seed=33
tc small-34 gen n=2000 q=2000 seed=34
tc small-35 gen n=2000 q=2000 seed=35
tc small-36 gen n=2000 q=2000 modeTree=deep seed=36
tc small-37 gen n=2000 q=2000 modeTree=deep seed=37
tc small-38 gen n=2000 q=2000 modeTree=deep seed=38
tc small-39 gen n=2000 q=2000 modeTree=deeper seed=39
tc small-40 gen n=2000 q=2000 modeTree=deeper seed=40

group group2 16
limits modeTree=line maxA=100
tc line-small-weights-1 gen seed=1 n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-2 gen seed=2 n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-3 gen seed=3 n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-4 gen seed=4 n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-5 gen seed=5 n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-6 gen seed=6 n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-7 gen seed=7 n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-8 gen seed=8 n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-9 gen seed=9 n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-10 gen seed=10 n=$MAXN q=$MAXQ modeTree=line maxA=100
tc line-small-weights-11 gen seed=11 n=$MAXN q=$MAXQ modeTree=line maxA=100 modeWeights=specialLine
tc line-small-weights-12 gen seed=12 n=$MAXN q=$MAXQ modeTree=line maxA=100 modeWeights=specialLine
tc line-small-weights-13 gen seed=13 n=$MAXN q=$MAXQ modeTree=line maxA=100 modeWeights=specialLine
tc line-small-weights-14 gen seed=14 n=$MAXN q=$MAXQ modeTree=line maxA=100 modeWeights=specialLine
tc line-small-weights-15 gen seed=15 n=$MAXN q=$MAXQ modeTree=line maxA=100 modeWeights=specialLine modeQeries=startToEnd

group group3 9
limits modeTree=line
include_group group2
tc line-large-q-1 gen seed=1 n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-2 gen seed=2 n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-3 gen seed=3 n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-4 gen seed=4 n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-5 gen seed=5 n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-6 gen seed=6 n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-7 gen seed=7 n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-8 gen seed=8 n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-9 gen seed=9 n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-10 gen seed=10 n=$MAXN q=$MAXQ modeTree=line
tc line-large-q-11 gen seed=11 n=$MAXN q=$MAXQ modeTree=line modeWeights=specialLine
tc line-large-q-12 gen seed=12 n=$MAXN q=$MAXQ modeTree=line modeWeights=specialLine
tc line-large-q-13 gen seed=13 n=$MAXN q=$MAXQ modeTree=line modeWeights=specialLine
tc line-large-q-14 gen seed=14 n=$MAXN q=$MAXQ modeTree=line modeWeights=specialLine
tc line-large-q-15 gen seed=15 n=$MAXN q=$MAXQ modeTree=line modeWeights=specialLine modeQeries=startToEnd

group group4 18
limits endAtOne=1
tc end-at-one-1 gen n=3 q=10 maxA=100 maxX=100 seed=1 endAtOne=1
tc end-at-one-2 gen n=3 q=10 maxA=100 maxX=100 seed=2 endAtOne=1
tc end-at-one-3 gen n=3 q=10 maxA=100 maxX=100 seed=3 endAtOne=1
tc end-at-one-4 gen n=4 q=10 maxA=100 maxX=100 seed=4 endAtOne=1
tc end-at-one-5 gen n=5 q=10 maxA=100 maxX=100 seed=5 endAtOne=1
tc end-at-one-7 gen n=5 q=10 maxA=100 maxX=100 seed=7 endAtOne=1
tc end-at-one-6 gen n=10 q=10 maxA=100 maxX=100 seed=6 endAtOne=1
tc end-at-one-8 gen n=10 q=10 maxA=100 maxX=100 seed=8 endAtOne=1
tc end-at-one-9 gen n=10 q=10 maxA=100 maxX=100 seed=9 endAtOne=1
tc end-at-one-10 gen n=10 q=10 maxA=100 maxX=100 seed=10 endAtOne=1
tc end-at-one-11 gen n=20 q=2000 maxA=100 maxX=100 seed=11 endAtOne=1
tc end-at-one-12 gen n=20 q=2000 maxA=100 maxX=100 seed=12 endAtOne=1
tc end-at-one-13 gen n=20 q=2000 maxA=100 maxX=100 seed=13 endAtOne=1
tc end-at-one-14 gen n=20 q=2000 maxA=100 maxX=100 seed=14 endAtOne=1
tc end-at-one-15 gen n=20 q=2000 maxA=100 maxX=100 seed=15 endAtOne=1
tc end-at-one-16 gen n=20 q=2000 maxA=10 maxX=100 seed=16 endAtOne=1
tc end-at-one-17 gen n=20 q=2000 maxA=10 maxX=100 seed=17 endAtOne=1
tc end-at-one-18 gen n=20 q=2000 maxA=10 maxX=100 seed=18 endAtOne=1
tc end-at-one-19 gen n=20 q=2000 maxA=10 maxX=100 seed=19 endAtOne=1
tc end-at-one-20 gen n=20 q=2000 seed=20 endAtOne=1
tc end-at-one-21 gen n=20 q=2000 seed=21 endAtOne=1
tc end-at-one-22 gen n=20 q=2000 seed=22 endAtOne=1
tc end-at-one-23 gen n=20 q=2000 seed=23 endAtOne=1
tc end-at-one-24 gen n=20 q=2000 seed=24 endAtOne=1
tc end-at-one-25 gen n=20 q=2000 seed=25 endAtOne=1
tc end-at-one-26 gen n=20 q=2000 seed=26 endAtOne=1
tc end-at-one-27 gen n=20 q=2000 seed=27 endAtOne=1
tc end-at-one-28 gen n=20 q=2000 seed=28 endAtOne=1
tc end-at-one-29 gen n=20 q=2000 seed=29 endAtOne=1
tc end-at-one-30 gen n=20 q=2000 seed=30 endAtOne=1
tc end-at-one-31 gen n=$MAXN q=$MAXQ seed=31 endAtOne=1
tc end-at-one-32 gen n=$MAXN q=$MAXQ seed=32 endAtOne=1
tc end-at-one-33 gen n=$MAXN q=$MAXQ seed=33 endAtOne=1
tc end-at-one-34 gen n=$MAXN q=$MAXQ seed=34 endAtOne=1
tc end-at-one-35 gen n=$MAXN q=$MAXQ seed=35 endAtOne=1
tc end-at-one-36 gen n=$MAXN q=$MAXQ modeTree=deep seed=36 endAtOne=1
tc end-at-one-37 gen n=$MAXN q=$MAXQ modeTree=deep seed=37 endAtOne=1
tc end-at-one-38 gen n=$MAXN q=$MAXQ modeTree=deep seed=38 endAtOne=1
tc end-at-one-39 gen n=$MAXN q=$MAXQ modeTree=deeper seed=39 endAtOne=1
tc end-at-one-40 gen n=$MAXN q=$MAXQ modeTree=deeper seed=40 endAtOne=1

group group5 14
include_group sample
include_group group1
include_group group3
include_group group4
tc large-1  gen seed=1 n=$MAXN q=$MAXQ
tc large-2  gen seed=2 n=$MAXN q=$MAXQ
tc large-3  gen seed=3 n=$MAXN q=$MAXQ
tc large-4  gen seed=4 n=$MAXN q=$MAXQ
tc large-5  gen seed=5 n=$MAXN q=$MAXQ
tc large-6  gen seed=6 n=$MAXN q=$MAXQ modeTree=deep
tc large-7  gen seed=7 n=$MAXN q=$MAXQ modeTree=deep
tc large-8  gen seed=8 n=$MAXN q=$MAXQ modeTree=deep
tc large-9  gen seed=9 n=$MAXN q=$MAXQ modeTree=deep
tc large-10 gen seed=10 n=$MAXN q=$MAXQ modeTree=deeper
tc large-11 gen seed=11 n=$MAXN q=$MAXQ modeTree=deeper
tc large-12 gen seed=12 n=$MAXN q=$MAXQ modeTree=killCubic modeWeights=killCubic
tc large-13 gen seed=13 n=$MAXN q=$MAXQ modeTree=killCubic modeWeights=killCubic
tc large-14 gen seed=14 n=$MAXN q=$MAXQ modeTree=killCubic modeWeights=killCubic
tc large-15 gen seed=15 n=$MAXN q=$MAXQ modeTree=killCubic modeWeights=killCubic
tc large-16 gen seed=16 n=$MAXN q=$MAXQ modeTree=killCubic modeQueries=startToEnd modeWeights=killCubic
tc large-17 gen seed=17 n=$MAXN q=$MAXQ modeTree=killCubic modeQueries=startToEnd modeWeights=killCubic
tc large-18 gen seed=18 n=$MAXN q=$MAXQ modeTree=killCubic modeQueries=startToEnd modeWeights=killCubic
tc large-19 gen seed=19 n=$MAXN q=$MAXQ modeTree=killCubic modeQueries=startToEnd modeWeights=killCubic
tc large-20 gen seed=20 n=$MAXN q=$MAXQ modeTree=killCubic modeQueries=startToEnd modeWeights=killCubic




