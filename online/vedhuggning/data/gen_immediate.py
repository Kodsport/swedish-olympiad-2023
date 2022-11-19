#!/usr/bin/python3

import sys
import random
import math

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    if default is None:
        print("missing parameter", name)
        sys.exit(1)
    return default

random.seed(int(cmdlinearg('seed', sys.argv[-1])))
N = int(cmdlinearg('N'))
maxS = int(cmdlinearg('maxS', 10**9))

trees = []
for _ in range(N):
    trees.append((random.randint(0, maxS // N), random.randint(0, 1e9), random.randint(0, 1e9)))

S = min(sum(t[0] for t in trees), maxS)

print(N, S)
for l, v, t in trees:
    print(l, v, t)
