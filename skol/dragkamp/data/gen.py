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
idx = int(cmdlinearg('idx'))
no_4 = int(cmdlinearg("no4", False))
num_add = int(cmdlinearg("num_add"))

cases = [
[2, 3, 0, 1],
[0, 1, 2, 1],
[3, 3, 3, 3],
[1, 0, 3, 2],
[2, 2, 2, 2],
[1, 2, 1, 0],
[1, 3, 3, 1],
[1, 1, 1, 1]
]

cases_no4 = [
[1, 2, 1, 0],
[5, 10, 5, 0],
[3, 6, 3, 0],
[4, 8, 4, 0],
[2, 4, 2, 0]
]

if no_4:
    tc = cases_no4[idx]
else:
    tc = cases[idx]

for i in range(len(tc)-no_4):
    tc[i] += random.randint(0,num_add)*4
print(" ".join(str(i) for i in tc))
