#!/bin/bash
. ../../testdata_tools/gen.sh

use_solution ../../data/empty.py

compile gen_random.py

group g1 10
limits n=30
tc tiny-line-1 gen_random n=30 w=0 mode=line
tc tiny-line-2 gen_random n=30 w=1e9 mode=line
tc tiny-rand-1 gen_random n=4 w=4 mode=random
tc tiny-rand-2 gen_random n=10 w=4 mode=random
tc tiny-rand-3 gen_random n=10 w=4 mode=random
tc tiny-rand-4 gen_random n=30 w=4 mode=random
tc tiny-rand-5 gen_random n=30 w=4 mode=random
tc tiny-binary-1 gen_random n=30 w=0 mode=binary
tc tiny-binary-2 gen_random n=30 w=0 mode=binary eorder=rev

group g2 15
limits n=300
tc small-line-1 gen_random n=300 w=0 mode=line
tc small-line-2 gen_random n=300 w=0 mode=line eorder=rev
tc small-line-3 gen_random n=300 w=1e9 mode=line
tc small-line-sorted1 gen_random n=300 w=0 mode=line randominds=0
tc small-line-sorted2 gen_random n=300 w=0 mode=line eorder=rev randominds=0
tc small-rand-1 gen_random n=300 w=0 mode=random
tc small-rand-2 gen_random n=300 w=1e9 mode=random
tc small-rand-3 gen_random n=300 w=0 mode=random eorder=rev
tc small-rand-4 gen_random n=300 w=0 mode=random eorder=random
tc small-binary-1 gen_random n=300 w=0 mode=binary
tc small-binary-2 gen_random n=300 w=0 mode=binary eorder=rev

group g3 15
limits n=1000 line=1
tc tiny-line-1
tc tiny-line-2
tc small-line-1
tc small-line-1
tc small-line-2
tc small-line-sorted1
tc small-line-sorted2
tc line-1 gen_random n=1000 w=0 mode=line
tc line-2 gen_random n=1000 w=0 mode=line eorder=rev
tc line-3 gen_random n=1000 w=0 mode=line eorder=random
tc line-4 gen_random n=1000 w=1e9 mode=line
tc line-sorted1 gen_random n=1000 w=0 mode=line randominds=0
tc line-sorted2 gen_random n=1000 w=0 mode=line eorder=rev randominds=0
tc line-sorted3 gen_random n=1000 w=0 mode=line eorder=random randominds=0
tc line-sorted4 gen_random n=1000 w=1e9 mode=line randominds=0

group g4 60
limits n=1000
include_group g3
tc rand-1 gen_random n=999 w=0 mode=random eorder=random
tc rand-2 gen_random n=1000 w=0 mode=random eorder=rev
tc rand-3 gen_random n=1000 w=0 mode=random
tc rand-4 gen_random n=1000 w=1e9 mode=random
tc rand-5 gen_random n=1000 w=0 mode=random extra=5
tc binary-1 gen_random n=1000 w=0 mode=binary eorder=random
tc binary-2 gen_random n=1000 w=0 mode=binary eorder=rev
tc binary-3 gen_random n=1000 w=0 mode=binary
tc binary-4 gen_random n=1000 w=0 mode=binary2
tc binary-5 gen_random n=1000 w=1e9 mode=binary
tc binary-6 gen_random n=1000 w=0 mode=binary extra=5 extraord=2
tc binary-7 gen_random n=1000 w=0 mode=binary extra=7 extraord=1
tc binary-8 gen_random n=1000 w=1e9 mode=binary extra=5
tc deep-1 gen_random n=1000 w=0 mode=deeper
tc deep-2 gen_random n=1000 w=1e9 mode=deeper
tc tristar-1 gen_random n=1000 w=0 mode=binary extra=333
tc tristar-2 gen_random n=1000 w=0 mode=binary extra=333 extraord=1
