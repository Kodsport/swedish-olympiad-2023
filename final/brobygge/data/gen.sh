#!/bin/bash
. ../../testdata_tools/gen.sh
ulimit -s unlimited

use_solution joshua_uf.cpp

compile gen_no.py
compile gen_yes_drunk.py
compile gen_yes_randomwalk.py
compile gen_yes_lateyes.py

samplegroup
limits maxn=10 maxm=10 maxt=10
sample 1

group g1thin 10
limits maxn=4
tc thinrandno1 gen_no n=4 m=1000000000 t=100000
tc thinrandno2 gen_no n=4 m=100000000 t=100000
tc thinrandno3 gen_no n=4 m=10000000 t=100000
tc thindrunkyes1 gen_yes_drunk n=4 m=1000000000 t=100000 p_deviate=0.2
tc thindrunkyes2 gen_yes_drunk n=4 m=1000000000 t=100000 p_deviate=0.4
tc thindrunkyes3 gen_yes_drunk n=4 m=1000000000 t=100000 p_deviate=0.6
tc thindrunkyes4 gen_yes_drunk n=3 m=1000000000 t=100000 p_deviate=0.8
tc thindrunkyes5 gen_yes_drunk n=4 m=1000000000 t=100000 p_deviate=0.2 lateyes=1
tc thindrunkyes6 gen_yes_drunk n=4 m=1000000000 t=100000 p_deviate=0.4 lateyes=1
tc thindrunkyes7 gen_yes_drunk n=3 m=1000000000 t=100000 p_deviate=0.6 lateyes=1
tc thindrunkyes8 gen_yes_drunk n=3 m=1000000000 t=100000 p_deviate=0.8 lateyes=1


group g2small 20
include_group sample
limits maxn=50 maxm=50
tc smallrandno1 gen_no n=50 m=50 t=700
tc smallrandno2 gen_no n=50 m=50 t=500
tc smallrandno3 gen_no n=20 m=20 t=50
tc smallrandno4 gen_no n=30 m=30 t=300
tc smallrandno5 gen_no n=40 m=40 t=600
tc smalldrunkyes1 gen_yes_drunk n=50 m=50 t=2000 p_deviate=0.2
tc smalldrunkyes2 gen_yes_drunk n=50 m=50 t=2000 p_deviate=0.4
tc smalldrunkyes3 gen_yes_drunk n=50 m=50 t=2000 p_deviate=0.6
tc smalldrunkyes4 gen_yes_drunk n=50 m=50 t=2000 p_deviate=0.8
tc smalldrunkyes5 gen_yes_drunk n=50 m=50 t=2000 p_deviate=0.2 lateyes=1
tc smalldrunkyes6 gen_yes_drunk n=50 m=50 t=2000 p_deviate=0.4 lateyes=1
tc smalldrunkyes7 gen_yes_drunk n=50 m=50 t=2000 p_deviate=0.6 lateyes=1
tc smalldrunkyes8 gen_yes_drunk n=50 m=50 t=2000 p_deviate=0.8 lateyes=1
tc smallwalkyes1 gen_yes_randomwalk n=50 m=50 t=2000 p_walking=0.1
tc smallwalkyes2 gen_yes_randomwalk n=50 m=50 t=2000 p_walking=0.3
tc smallwalkyes3 gen_yes_randomwalk n=50 m=50 t=2000 p_walking=0.5
tc smallwalkyes4 gen_yes_randomwalk n=50 m=50 t=2000 p_walking=0.7
tc smalllateyes gen_yes_lateyes n=50 m=50 t=1000

group g3medium 30
include_group sample
include_group g2small
limits maxn=1000 maxm=1000
tc mediumrandno1 gen_no n=1000 m=1000 t=100000
tc mediumrandno2 gen_no n=500 m=1000  t=100000
tc mediumrandno3 gen_no n=1000 m=500  t=100000
tc mediumrandno4 gen_no n=500 m=500   t=100000
tc mediumrandno5 gen_no n=690 m=420   t=100000
tc mediumdrunkyes1 gen_yes_drunk n=1000 m=1000 t=100000 p_deviate=0.2
tc mediumdrunkyes2 gen_yes_drunk n=1000 m=1000 t=100000 p_deviate=0.4
tc mediumdrunkyes3 gen_yes_drunk n=1000 m=1000 t=100000 p_deviate=0.6
tc mediumdrunkyes4 gen_yes_drunk n=1000 m=1000 t=100000 p_deviate=0.8
tc mediumdrunkyes5 gen_yes_drunk n=1000 m=1000 t=100000 p_deviate=0.2 lateyes=1
tc mediumdrunkyes6 gen_yes_drunk n=1000 m=1000 t=100000 p_deviate=0.4 lateyes=1
tc mediumdrunkyes7 gen_yes_drunk n=1000 m=1000 t=100000 p_deviate=0.6 lateyes=1
tc mediumdrunkyes8 gen_yes_drunk n=1000 m=1000 t=100000 p_deviate=0.8 lateyes=1
tc mediumwalkyes1 gen_yes_randomwalk n=1000 m=1000 t=100000 p_walking=0.1
tc mediumwalkyes2 gen_yes_randomwalk n=1000 m=1000 t=100000 p_walking=0.3
tc mediumwalkyes3 gen_yes_randomwalk n=1000 m=1000 t=100000 p_walking=0.5
tc mediumwalkyes4 gen_yes_randomwalk n=1000 m=1000 t=100000 p_walking=0.7
tc mediumlateyes  gen_yes_lateyes n=1000 m=1000 t=2000


group g4smallT 15
include_group sample
include_group g2small
limits maxt=2000
tc smallTrandno1 gen_no n=100  m=1000000000 t=2000
tc smallTrandno2 gen_no n=200  m=1000000000 t=2000
tc smallTrandno3 gen_no n=400  m=1000000000 t=2000
tc smallTrandno4 gen_no n=50   m=1000000000 t=2000
tc smallTrandno5 gen_no n=1000 m=1000000000 t=2000
tc smallTdrunkyes1 gen_yes_drunk n=400  m=1000000000 t=2000 p_deviate=0.2
tc smallTdrunkyes2 gen_yes_drunk n=200  m=1000000000 t=2000 p_deviate=0.4
tc smallTdrunkyes3 gen_yes_drunk n=100  m=1000000000 t=2000 p_deviate=0.6
tc smallTdrunkyes4 gen_yes_drunk n=50   m=1000000000 t=2000 p_deviate=0.8
tc smallTdrunkyes5 gen_yes_drunk n=1000 m=1000000000 t=2000 p_deviate=0.2 lateyes=1
tc smallTdrunkyes6 gen_yes_drunk n=500  m=1000000000 t=2000 p_deviate=0.4 lateyes=1
tc smallTdrunkyes7 gen_yes_drunk n=100  m=1000000000 t=2000 p_deviate=0.6 lateyes=1
tc smallTdrunkyes8 gen_yes_drunk n=10   m=1000000000 t=2000 p_deviate=0.8 lateyes=1
tc smallTwalkyes1 gen_yes_randomwalk n=1000 m=1000000000 t=2000 p_walking=0.1
tc smallTwalkyes2 gen_yes_randomwalk n=900  m=1000000000 t=2000 p_walking=0.3
tc smallTwalkyes3 gen_yes_randomwalk n=700  m=1000000000 t=2000 p_walking=0.5
tc smallTwalkyes4 gen_yes_randomwalk n=500  m=1000000000 t=2000 p_walking=0.7
tc smallTlateyes  gen_yes_lateyes n=1000 m=1000000000 t=2000

group g5large 25
include_group sample
include_group g1thin
include_group g2small
include_group g3medium
include_group g4smallT
tc largerandno1 gen_no n=1000000000 m=1000000000 t=100000
tc largerandno2 gen_no n=100000 m=1000000000     t=100000
tc largerandno3 gen_no n=10000 m=1000000000      t=100000
tc largerandno4 gen_no n=1000 m=100000           t=100000
tc largerandno5 gen_no n=100 m=1000000000        t=100000
tc largedrunkyes1 gen_yes_drunk n=10000 m=100000 t=100000 p_deviate=0.2
tc largedrunkyes2 gen_yes_drunk n=10000 m=100000 t=100000 p_deviate=0.4
tc largedrunkyes3 gen_yes_drunk n=10000 m=100000 t=100000 p_deviate=0.6
tc largedrunkyes4 gen_yes_drunk n=1000  m=100000 t=100000 p_deviate=0.8
tc largedrunkyes5 gen_yes_drunk n=10000 m=100000 t=100000 p_deviate=0.2 lateyes=1
tc largedrunkyes6 gen_yes_drunk n=10000 m=100000 t=100000 p_deviate=0.4 lateyes=1
tc largedrunkyes7 gen_yes_drunk n=10000 m=100000 t=100000 p_deviate=0.6 lateyes=1
tc largedrunkyes8 gen_yes_drunk n=10000 m=100000 t=100000 p_deviate=0.8 lateyes=1
tc largewalkyes1 gen_yes_randomwalk n=10000 m=100000 t=100000 p_walking=0.1
tc largewalkyes2 gen_yes_randomwalk n=10000 m=100000 t=100000 p_walking=0.3
tc largewalkyes3 gen_yes_randomwalk n=10000 m=100000 t=100000 p_walking=0.5
tc largewalkyes4 gen_yes_randomwalk n=10000 m=100000 t=100000 p_walking=0.7
tc largewalkyes5 gen_yes_randomwalk n=60000 m=100000 t=100000 p_walking=0.1
tc largelateyes  gen_yes_lateyes n=60000 m=1000000000 t=100000
