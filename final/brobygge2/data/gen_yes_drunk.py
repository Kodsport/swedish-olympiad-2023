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
p_deviate = float(cmdlinearg('p_deviate'))
lateyes = int(cmdlinearg('lateyes', 0))
assert(t<=n*m)

dirs = [[0,1],[0,-1],[1,0],[-1,0]]

# Third number is weight if rolled
dirs = [[0,1,-3],[0,-1,-3],[1,0,-1],[-1,0,-2]]


# Walk upwards, but sometimes switch direction for a while. Kind of like a drunk man going home- a semirandom walk which eventually arrives at its target
print(n,m,t)
q = PriorityQueue()
q.put((0, 0, (1, random.randint(0,m-1))))
seen = set()
path = []
while not q.empty():
    top = q.get()
    p = top[2]
    w = top[1]

    if p[0]<=0 or p[1]<0 or p[1] >= m:
        continue
    
    if p in seen:
        continue
    seen.add(p)

    path.append(p)

    if p[0]==n-2:
        break

    for dir in dirs:
        np = (p[0]+dir[0], p[1]+dir[1])
        nw = w
        if random.uniform(0,1)<p_deviate:
            nw += dir[2]
        
        q.put((nw+(n-1-np[0]), nw, np))

assert(len(path)<=t)
while len(path)<t: # Add noise
    p = (random.randint(1,n-2),random.randint(0,m-1))
    if p not in seen:
        seen.add(p)
        path.append(p)


if lateyes:
    path = reversed(path) # Put noise in front
else:
    random.shuffle(path)


for p in path:
    print(p[0],p[1])