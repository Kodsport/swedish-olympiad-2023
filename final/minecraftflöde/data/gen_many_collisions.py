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


points = (i for i in seen)

from heapq import *

q = list((random.randint(0,int(1e5)), i) for i in seen)
heapify(q)


dirs=[[0,1],[0,-1],[1,0],[-1,0],[1,1],[1,-1],[-1,1],[-1,-1],[0,0]]
currow = r-4
placed = 0
lowest = {}
while placed < n and currow>=4 and len(q):

    for i in range(100):
        if len(q)==0:
            break
        t = heappop(q)


        c = t[1]

        if c in lowest:
            r = lowest[c]-4
        else:
            lowest[c] = currow
        works = True
        for dir in dirs:
            if (r+dir[0],c+dir[1]) in seen:
                works = False
                break
        
        if works:
            seen.add((r,c))
            placed+=1
            print(r,c)
            break
    
    currow -=4