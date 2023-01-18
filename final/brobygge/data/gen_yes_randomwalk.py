#!/usr/bin/python3

import sys
import random
import math
from queue import PriorityQueue

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    if default is None:
        print("missing parameter", name)
        sys.exit(1)
    return default

random.seed(int(cmdlinearg('seed', sys.argv[-1])))
n = int(cmdlinearg('n'))
m = int(cmdlinearg('m'))
t = int(cmdlinearg('t'))
p_walking = float(cmdlinearg('p_walking'))
assert(t<=n*m)

dirs = [[0,1],[0,-1],[1,0],[-1,0]]



print(n,m,t)

seen = set()
path = []
p = (random.randint(1,n-2),random.randint(0,m-1))
while len(path)<t*p_walking:
    if p not in seen:
        path.append(p)
    seen.add(p)
    random.shuffle(dirs)
    for dir in dirs:
        np = (p[0]+dir[0], p[1]+dir[1])
        if np[0]<=0 or np[0]>=n-1 or np[1]<0 or np[1]>=m: continue
        p = np
        break

connectpath = []

lowest = (10000000000000, 0)
highest = (0, 0)

for p in path:
    if p[0]>highest[0]:
        highest = p
    if p[0]<lowest[0]:
        lowest = p

lowest = [i for i in lowest]
highest = [i for i in highest]
while lowest[0]>0:
    if tuple(lowest) not in seen:
        seen.add(tuple(lowest))
        connectpath.append(tuple(lowest))
    lowest[0]-=1

while highest[0]<n-1:
    if tuple(highest) not in seen:
        seen.add(tuple(highest))
        connectpath.append(tuple(highest))
    highest[0]+=1

noise = []
while len(path)+len(connectpath)+len(noise)<t:
    p = (random.randint(1,n-2),random.randint(0,m-1))
    if p not in seen:
        seen.add(p)
        noise.append(p)

noise.extend(connectpath)
random.shuffle(noise)
path.extend(noise)

for p in path:
    p = tuple(p)
    print(p[0],p[1])