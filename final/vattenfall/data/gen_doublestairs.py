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
center = c//2

m_max = n//2

v_max = (r-2)//m_max
v_spacing = max(2, min(int((r // m_max) * 0.9), v_max))

placed_cliffs = set()

m = 0
while len(placed_cliffs) < n:
    placed_cliffs.add((r-1- m * v_spacing, center + m))
    placed_cliffs.add((r-1- m * v_spacing, center - m))
    m += 1


print(r,c)
print(1,n)
print(center)

cliffs = list(placed_cliffs)
random.shuffle(cliffs)
cliffs = cliffs[:n]
for i in range(n):
    print(*cliffs[i])
