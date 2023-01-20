#!/usr/bin/python3

import sys
import random
import math
from queue import PriorityQueue

def fmt(v):
    return "{:.2f}".format(v).rstrip('0').rstrip('.')

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    if default is None:
        print("missing parameter", name)
        sys.exit(1)
    return default

random.seed(int(cmdlinearg('seed', sys.argv[-1])))

I = float(cmdlinearg('I', math.exp(random.uniform(math.log(0.1), math.log(1000)))))
lo = math.log(float(cmdlinearg('lo', 0.001)))
hi = math.log(float(cmdlinearg('hi', 1000)))
sort = bool(cmdlinearg('sort', False))

print(fmt(I))
A = [math.exp(random.uniform(lo, hi)) for _ in range(30)]
if sort: A = sorted(A)
A = [fmt(x) for x in A]
print(*A)
