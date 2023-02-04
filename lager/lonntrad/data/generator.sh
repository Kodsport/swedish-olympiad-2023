#!/bin/bash
. ../../testdata_tools/gen.sh

use_solution ../../data/empty.py

compile gen_random.py
compile gen_tri.py

group g1 10
limits n=25
tc tiny-line-1 gen_random n=25 w=0 mode=line
tc tiny-line-2 gen_random n=25 w=1e9 mode=line
tc tiny-rand-1 gen_random n=4 w=4 mode=random
tc tiny-rand-2 gen_random n=10 w=4 mode=random
tc tiny-rand-3 gen_random n=10 w=4 mode=random
tc tiny-rand-4 gen_random n=25 w=4 mode=random
tc tiny-rand-5 gen_random n=25 w=4 mode=random
tc tiny-binary-1 gen_random n=25 w=0 mode=binary
tc tiny-binary-2 gen_random n=25 w=0 mode=binary eorder=rev
tc tiny-tri-1 gen_tri n=25 k=6 w=1e9

group g2 15
limits n=175
tc small-line-1 gen_random n=175 w=0 mode=line
tc small-line-2 gen_random n=175 w=0 mode=line eorder=rev
tc small-line-3 gen_random n=175 w=1e9 mode=line
tc small-line-sorted1 gen_random n=175 w=0 mode=line randominds=0
tc small-line-sorted2 gen_random n=175 w=0 mode=line eorder=rev randominds=0
tc small-rand-1 gen_random n=175 w=0 mode=random
tc small-rand-2 gen_random n=175 w=1e9 mode=random
tc small-rand-3 gen_random n=175 w=0 mode=random eorder=rev
tc small-rand-4 gen_random n=175 w=0 mode=random eorder=random
tc small-binary-1 gen_random n=175 w=0 mode=binary
tc small-binary-2 gen_random n=175 w=0 mode=binary eorder=rev
tc small-tri-1 gen_tri n=175 k=6 w=1e9

group g3 40
limits n=350
include_group g2
tc med-line-1 gen_random n=350 w=0 mode=line
tc med-line-2 gen_random n=350 w=0 mode=line eorder=rev
tc med-line-3 gen_random n=350 w=0 mode=line eorder=random
tc med-line-4 gen_random n=350 w=1e9 mode=line
tc med-line-sorted1 gen_random n=350 w=0 mode=line randominds=0
tc med-line-sorted2 gen_random n=350 w=0 mode=line eorder=rev randominds=0
tc med-line-sorted3 gen_random n=350 w=0 mode=line eorder=random randominds=0
tc med-line-sorted4 gen_random n=350 w=1e9 mode=line randominds=0
tc med-tri-1 gen_tri n=350 k=6 w=0 eorder=random
tc med-tri-2 gen_tri n=350 k=6 w=1e9
tc med-rand-1 gen_random n=349 w=0 mode=random eorder=random
tc med-rand-2 gen_random n=350 w=0 mode=random eorder=rev
tc med-rand-3 gen_random n=350 w=0 mode=random
tc med-rand-4 gen_random n=350 w=1e9 mode=random
tc med-rand-5 gen_random n=350 w=0 mode=random extra=4
tc med-rand-6 gen_random n=349 w=0 mode=random eorder=random
tc med-binary-1 gen_random n=350 w=0 mode=binary eorder=random
tc med-binary-2 gen_random n=350 w=0 mode=binary eorder=rev
tc med-binary-3 gen_random n=350 w=0 mode=binary
tc med-binary-4 gen_random n=350 w=0 mode=binary2
tc med-binary-5 gen_random n=350 w=1e9 mode=binary
tc med-binary-6 gen_random n=350 w=0 mode=binary extra=4 extraord=2
tc med-binary-7 gen_random n=350 w=0 mode=binary extra=6 extraord=1
tc med-binary-8 gen_random n=350 w=1e9 mode=binary extra=4
tc med-binary-9 gen_random n=350 w=1e9 mode=binary
tc med-binary-10 gen_random n=350 w=1e9 mode=binary
tc med-deep-1 gen_random n=350 w=0 mode=deeper
tc med-deep-2 gen_random n=350 w=1e9 mode=deeper
tc med-tristar-1 gen_random n=350 w=0 mode=binary extra=130
tc med-tristar-2 gen_random n=350 w=0 mode=binary extra=130 extraord=1

group g4 10
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

group g5 25
limits n=1000
include_group g3
include_group g4
tc tri-1 gen_tri n=1000 k=6 w=0
tc rand-1 gen_random n=999 w=0 mode=random eorder=random
tc binary-1 gen_random n=1000 w=0 mode=binary eorder=random
tc tri-2 gen_tri n=1000 k=6 w=0 eorder=rev
tc tri-3 gen_tri n=1000 k=6 w=0 eorder=random
tc tri-4 gen_tri n=1000 k=6 w=1e9
tc rand-2 gen_random n=1000 w=0 mode=random eorder=rev
tc rand-3 gen_random n=1000 w=0 mode=random
tc rand-4 gen_random n=1000 w=1e9 mode=random
tc rand-5 gen_random n=1000 w=0 mode=random extra=5
tc rand-6 gen_random n=1000 w=0 mode=random eorder=random
tc binary-2 gen_random n=1000 w=0 mode=binary eorder=rev
tc binary-3 gen_random n=1000 w=0 mode=binary
tc binary-4 gen_random n=1000 w=0 mode=binary2
tc binary-5 gen_random n=1000 w=1e9 mode=binary
tc binary-6 gen_random n=1000 w=0 mode=binary extra=5 extraord=2
tc binary-7 gen_random n=1000 w=0 mode=binary extra=7 extraord=1
tc binary-8 gen_random n=1000 w=1e9 mode=binary extra=5
tc binary-9 gen_random n=1000 w=1e9 mode=binary
tc binary-10 gen_random n=1000 w=1e9 mode=binary
tc deep-1 gen_random n=1000 w=0 mode=deeper
tc deep-2 gen_random n=1000 w=1e9 mode=deeper
tc tristar-1 gen_random n=1000 w=0 mode=binary extra=333
tc tristar-2 gen_random n=1000 w=0 mode=binary extra=333 extraord=1
