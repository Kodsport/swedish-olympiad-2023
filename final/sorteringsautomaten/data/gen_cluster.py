#!/usr/bin/python3

import sys
import random

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
t = int(cmdlinearg('t'))
min_x = int(cmdlinearg('min_x', 1))
max_x = int(cmdlinearg('max_x', 10**9))

print(n,t)
X = []
for i in range(n):
    if random.randint(0, 1) == 0:
        X.append(min_x)
        min_x += 1
    else:
        X.append(max_x)
        max_x -= 1
X.sort()
print(*X)
