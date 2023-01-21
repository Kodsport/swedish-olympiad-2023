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
noaxis = int(cmdlinearg('noaxis',0))
nodiag = int(cmdlinearg('nodiag',0))
lo = c/2+random.randint(0,int(k*2.5))
assert(n<=c)

print(r,c)
print(k,n)

seen = set()
for i in range(k):
    while True:
        p = random.randint(lo,min(c-1,lo+k*3))
        if p not in seen:
            seen.add(p)
            print(p)
            break


points = (i for i in seen)

from heapq import *

q = list((random.randint(0,int(1e5)), i) for i in seen)
heapify(q)


dirs=[[0,0]]
if noaxis:
    dirs.extend([[0,1],[0,-1],[1,0],[-1,0]])
if nodiag:
    dirs.extend([[1,1],[1,-1],[-1,1],[-1,-1]])

currow = r-4
placed = 0
lowest = {}
while placed < n and currow>=4 and len(q):

    for i in range(100):
        if len(q)==0:
            break
        t = heappop(q)


        col = t[1]

        if col in lowest:
            row = lowest[c]-4
        else:
            lowest[c] = currow
            row=currow-2
        works = True
        for dir in dirs:
            if (row+dir[0],col+dir[1]) in seen:
                works = False
                break
        
        if works:
            seen.add((row,col))
            placed+=1
            print(row,col)
            heappush(q, (random.randint(0,int(1e5)),col+1))
            heappush(q, (random.randint(0,int(1e5)),col-1))
            break
    
    currow -=4

while placed < n:
    p = (random.randint(0,r-1),random.randint(0,c-1))
    if p not in seen:
        seen.add(p)
        print(p[0],p[1])
