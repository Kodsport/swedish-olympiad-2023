#!/usr/bin/python3

import sys
import random
import math
sys.setrecursionlimit(int(1e6)+10)

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    if default is None:
        print("missing parameter", name)
        sys.exit(1)
    return default

random.seed(int(cmdlinearg('seed', sys.argv[-1])))
r = int(cmdlinearg('r'))
c = int(cmdlinearg('c'))
n = int(cmdlinearg('n'))
k = int(cmdlinearg('k'))
assert(n<=c)
assert(k<=n)

print(r,c)
print(k,n)

row = random.randint(1,r-1)
col = random.randint(0,int(c/2))
for i in range(k):
    print(col+i)

for i in range(n):
    print(row, col+i)