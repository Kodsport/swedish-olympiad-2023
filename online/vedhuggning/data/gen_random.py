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
S = maxS

while True:
    trees = []
    for _ in range(N):
        trees.append((random.randint(0, maxS // N // 3), random.randint(0, max(5, 2 * int(math.sqrt(maxS // N)))), random.randint(0, max(5, 2 * int(math.sqrt(maxS // N))))))
    tot = sum(t[0] + t[1] * t[2] for t in trees)
    if tot >= S: break

print(N, S)
for l, v, t in trees:
    print(l, v, t)
