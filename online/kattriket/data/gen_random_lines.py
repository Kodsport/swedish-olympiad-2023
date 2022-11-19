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
K = int(cmdlinearg('K'))

print(N)
has = [0]

out = []

xs = [-1] + sorted(random.sample(range(0, N-1+K-1), K - 1)) + [N-1+K-1]
p = [xs[i + 1] - xs[i] - 1 for i in range(K)]
p = [x for x in p if x]
assert(sum(p) == N-1)

at = 1
for l in p:
    out.append((0, at))
    at += 1
    for k in range(l - 1):
        out.append((at - 1, at))
        at += 1

random.shuffle(out)
shuf = list(range(1, N))
random.shuffle(shuf)
shuf = [0] + shuf
for a, b in out:
    print(shuf[a], shuf[b])
