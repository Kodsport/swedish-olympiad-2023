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

assert(t<=n*m)




print(n,m,t)

seen = set()
path = []
for i in range(1, n-1):
    p = (i,10)
    path.append(p)
    seen.add(p)


noise = []
while len(path)+len(noise)<t:
    p = (random.randint(1,n/2),random.randint(0,m-1))
    if p not in seen:
        seen.add(p)
        noise.append(p)

noise.extend(path)

for p in noise:
    p = tuple(p)
    print(p[0],p[1])