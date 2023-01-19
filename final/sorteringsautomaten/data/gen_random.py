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
one = int(cmdlinearg('one', 0))
    

X = random.sample(range(min_x, max_x+1), n)
X.sort()
if one == 1:
    X[0] = 1
print(n,t)
print(*X)
