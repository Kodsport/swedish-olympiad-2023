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

print(N)
has = [0]

out = []
for i in range(1, N):
    out.append((i - 1, i))

random.shuffle(out)
shuf = list(range(1, N))
random.shuffle(shuf)
shuf = [0] + shuf
for a, b in out:
    print(shuf[a], shuf[b])
