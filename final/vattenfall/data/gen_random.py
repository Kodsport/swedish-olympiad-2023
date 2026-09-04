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

print(r,c)
print(k,n)

seen = set()
for i in range(k):
    while True:
        p = random.randint(0,c-1)
        if p not in seen:
            seen.add(p)
            print(p)
            break

seenpoints = set()
for i in range(n):
    while True:
        pr = random.randint(1,r-1)
        pc = random.randint(0,c-1)
        if (pr,pc) not in seen:
            seen.add((pr,pc))
            print(pr,pc)
            break