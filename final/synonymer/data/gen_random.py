#!/usr/bin/python3

import sys
import string
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

def w():
    return ''.join(random.choice(string.ascii_lowercase) for _ in range(20))

min2 = bool(cmdlinearg('hassol', False))
N = int(cmdlinearg('N'))
l = int(cmdlinearg('l', N // (4 if min2 else 2)))
r = int(cmdlinearg('r', N // (4 if min2 else 2)))
A = [w() for _ in range(l)]
B = [w() for _ in range(r)]
ts = set()

for a in A:
    ts.add((a, random.choice(B)))

for b in B:
    if min2:
        a1, a2 = random.sample(A,2)
        ts.add((a1, b))
        ts.add((a2, b))

allts = set((a, b) for a in A for b in B) - ts
ts.update(random.sample(list(allts), N - len(ts)))

print(len(ts))
for a, b in ts:
    print(a, b)

print(1000)
print(*[random.choice(A) for _ in range(1000)])
