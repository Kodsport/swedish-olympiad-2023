#!/bin/bash
. ../../final/testdata_tools/gen.sh

use_solution ../../data/empty.py

compile gen_random.py

group g1 100
tc rand-1 gen_random n=100000 w=0 mode=random eorder=random
tc rand-2 gen_random n=100000 w=0 mode=random eorder=rev
tc rand-3 gen_random n=100000 w=0 mode=random
tc rand-4 gen_random n=100000 w=1e9 mode=random
tc binary-1 gen_random n=100000 w=0 mode=binary eorder=random
tc binary-2 gen_random n=100000 w=0 mode=binary eorder=rev
tc binary-3 gen_random n=100000 w=0 mode=binary
tc binary-4 gen_random n=100000 w=0 mode=binary2
tc binary-5 gen_random n=100000 w=1e9 mode=binary
tc line-1 gen_random n=100000 w=0 mode=line
tc line-2 gen_random n=100000 w=0 mode=line eorder=rev
tc line-3 gen_random n=100000 w=0 mode=line eorder=random
tc line-4 gen_random n=100000 w=1e9 mode=line
