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
k = int(cmdlinearg('n'))
lo = c/2+random.randint(0,int(k*2.5))
assert(n<=c)

print(r,c)
print(n,k)

seen = set()
for i in range(k):
    while True:
        p = random.randint(lo,lo+k*3)
        if p not in seen:
            seen.add(p)
            print(p)
            break



dirs=[[0,1],[0,-1],[1,0],[-1,0],[1,1],[1,-1],[-1,1],[-1,-1],[0,0]]
p = [0, int(lo)]
for i in range(n):
    print(p[0],p[1])
    p[0]+=2
    p[1]+=2