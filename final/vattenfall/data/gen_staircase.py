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

lo = c//2+random.randint(0,int(k*2.5))
lo = max(0, min(lo, c-1-2*(n-1)))

whi = min(c-1, lo+k*3)
wlo = min(lo, whi-k+1)

print(r,c)
print(k,n)

seen = set()
for i in range(k):
    while True:
        p = random.randint(wlo,whi)
        if p not in seen:
            seen.add(p)
            print(p)
            break

p = [1, int(lo)]
for i in range(n):
    print(p[0],p[1])
    p[0]+=2
    p[1]+=2
