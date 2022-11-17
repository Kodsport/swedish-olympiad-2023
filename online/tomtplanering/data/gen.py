#!/usr/bin/env python3

import sys
import random

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    assert default is not None, name
    return default

random.seed(int(cmdlinearg('seed', sys.argv[-1])))

print(cmdlinearg('tc'))

n = int(cmdlinearg('n', 10**5))
maxy = int(cmdlinearg('maxy', 10**6))
maxx = 10**6


print(n)
seen = set()
for _ in range(n):
    x = random.randint(0, maxx)
    y = random.randint(0, maxy)
    while x * maxx + y in seen:
        x = random.randint(0, maxx)
        y = random.randint(0, maxy)
    seen.add(x * maxx + y)
    print(x, y)

