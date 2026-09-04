#!/bin/bash
. ../../../testdata_tools/gen.sh
#ulimit -s unlimited

use_solution joshua_full.cpp

compile gen_random.py
compile gen_many_collisions.py
compile gen_staircase.py
compile gen_platform.py
compile gen_lavacast.py
compile gen_doublestairs.py
compile gen_dense.py
compile gen_segments.py
compile gen_walls.py

samplegroup
sample 1
sample 2
sample 3

MAX_SIDELEN=1000000000

group g1 20
limits max_cells=1000
include_group sample
tc smallgeneralrand1 gen_random r=10 c=10 n=5 k=10
tc smallgeneralrand2 gen_random r=10 c=50 n=5 k=20
tc smallgeneralrand3 gen_random r=10 c=50 n=5 k=30
tc smallgeneralrand4 gen_random r=10 c=100 n=5 k=40
tc smallgeneralrand5 gen_random r=10 c=100 n=5 k=50
tc smallgeneralrand6 gen_random r=10 c=100 n=5 k=60
tc smallstaircase1 gen_staircase r=100 c=10  n=5  k=8
tc smallstaircase2 gen_staircase r=20  c=50 n=10 k=25
tc smallstaircase3 gen_staircase r=31  c=32 n=15 k=20
tc smalldoublestairs1 gen_doublestairs r=40 c=25 n=25
tc smalldoublestairs2 gen_doublestairs r=90 c=11 n=11
tc smalldoublestairs3 gen_doublestairs r=20 c=50 n=18
tc smalldense1 gen_dense r=10 c=100 n=300 k=50
tc smalldense2 gen_dense r=25 c=40 n=400 k=40
tc smalldense3 gen_dense r=10 c=100 n=800 k=100
tc smalldense4 gen_dense r=2 c=500 n=250 k=500
tc smalldense5 gen_dense r=1000 c=1 n=500 k=1
tc smalldense6 gen_dense r=50 c=20 n=150 k=20 w=8 h=49 anchor=left
tc smallsegments1 gen_segments r=20 c=50 n=80 k=25 maxlen=8
tc smallsegments2 gen_segments r=100 c=10 n=150 k=10 maxlen=6 vfrac=0.4
tc smallwalls1 gen_walls mode=segruns r=100 c=10 n=150 k=10 maxlen=8 abovefrac=0.3 pocketprob=0.3
tc smallwalls2 gen_walls mode=zigzag r=100 c=10 n=200 k=3 len=5
tc smalllavacast1 gen_lavacast r=40 c=25 n=30 k=6  band_multiplier=1.1
tc smalllavacast2 gen_lavacast r=30 c=33 n=35 k=8  band_multiplier=1.3
tc smalllavacast3 gen_lavacast r=30 c=33 n=30 k=6  band_multiplier=2
tc smalllavacast4 gen_lavacast r=20 c=50 n=30 k=20 band_multiplier=1.1


group g2 30
limits nodiag=1 noaxis=1
tc largenotouchcolls1 gen_many_collisions r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=100000
tc largenotouchcolls2 gen_many_collisions r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=100000
tc largenotouchcolls3 gen_many_collisions r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=23400
tc largenotouchcolls4 gen_many_collisions r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=100000
tc largenotouchcolls5 gen_many_collisions r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=95001
tc largenotouchcolls6 gen_many_collisions r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=50000
tc largenotouchcolls7 gen_many_collisions r=$MAX_SIDELEN c=$MAX_SIDELEN k=80000  n=100000
tc largenotouchcolls8 gen_many_collisions r=$MAX_SIDELEN c=$MAX_SIDELEN k=50000  n=100000
tc largestaircase1 gen_staircase r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=23400
tc largestaircase2 gen_staircase r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=95001
tc largestaircase3 gen_staircase r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=50000
tc largestaircase4 gen_staircase r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=100000
tc largestaircase5 gen_staircase r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=100000
tc g2-1 gen_doublestairs r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000
tc largedensenotouch1 gen_dense r=$MAX_SIDELEN c=40 n=100000 k=40 w=40 h=30000 nodiag=1 noaxis=1
tc largedensenotouch2 gen_dense r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=1001 w=1000 h=1500 anchor=left nodiag=1 noaxis=1
tc largedensenotouch3 gen_dense r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=1001 w=1000 h=1500 anchor=right nodiag=1 noaxis=1
tc largedensenotouch4 gen_dense r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=100000 w=200000 h=20 nodiag=1 noaxis=1


group g3 20
include_group g2
limits nodiag=1
tc largeplatform1 gen_platform r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=100000
tc largeplatform2 gen_platform r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=50000
tc largeplatform3 gen_platform r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=20000
tc largesegments1 gen_segments r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=3000 w=3000 h=200000 maxlen=40
tc largesegments2 gen_segments r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=300 w=300 h=200000 maxlen=10 vfrac=0.4
tc largesegments3 gen_segments r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=501 w=500 h=200000 maxlen=60 anchor=left
tc largesegments4 gen_segments r=$MAX_SIDELEN c=60 n=100000 k=60 w=60 h=200000 maxlen=20 vfrac=0.3
tc largesegments5 gen_segments r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=100000 w=100000 h=50 maxlen=100 vfrac=0.05
tc largedensenodiag1 gen_dense r=$MAX_SIDELEN c=50 n=100000 k=50 w=50 h=12000 nodiag=1


group g4 30
include_group g1 g2 g3
tc g4-1 gen_lavacast r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=100000 band_multiplier=1.1
tc g4-2 gen_lavacast r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=100000 band_multiplier=1.3
tc g4-3 gen_lavacast r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=100000 band_multiplier=2
tc g4-4 gen_lavacast r=$MAX_SIDELEN c=$MAX_SIDELEN k=100000 n=100000 band_multiplier=3
tc g4-5 gen_lavacast r=$MAX_SIDELEN c=$MAX_SIDELEN k=10000 n=100000 band_multiplier=1.5
tc g4-6 gen_lavacast r=$MAX_SIDELEN c=$MAX_SIDELEN k=5000 n=100000 band_multiplier=1.1
tc g4-7 gen_lavacast r=$MAX_SIDELEN c=$MAX_SIDELEN k=500 n=100000 band_multiplier=1.1
tc g4-8 gen_lavacast r=$MAX_SIDELEN c=$MAX_SIDELEN k=50 n=100000 band_multiplier=1.1
tc largedense1 gen_dense r=$MAX_SIDELEN c=40 n=100000 k=40 w=40 h=18000
tc largedense2 gen_dense r=$MAX_SIDELEN c=30 n=100000 k=30 w=30 h=7000
tc largedense3 gen_dense r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=301 w=300 h=3000 anchor=left
tc largedense4 gen_dense r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=301 w=300 h=3000 anchor=right
tc largedense5 gen_dense r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=100000 w=100000 h=10
tc largewalls1 gen_walls mode=segruns r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=3000 w=3000 maxlen=60 abovefrac=0.2 pocketprob=0.3
tc largewalls2 gen_walls mode=segruns r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=500 w=500 maxlen=5 abovefrac=0.5 pocketprob=0.1
tc largewalls3 gen_walls mode=segruns r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=2001 w=2000 maxlen=200 abovefrac=0.05 pocketprob=0.5 anchor=left
tc largezigzag1 gen_walls mode=zigzag r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=1 len=50
tc largezigzag2 gen_walls mode=zigzag r=$MAX_SIDELEN c=$MAX_SIDELEN n=100000 k=1000 len=5
tc largezigzag3 gen_walls mode=zigzag r=$MAX_SIDELEN c=104 n=100000 k=100 len=100 anchor=left
