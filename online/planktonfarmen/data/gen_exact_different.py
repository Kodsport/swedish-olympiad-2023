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
A = int(cmdlinearg('A'))
N = int(cmdlinearg('N'))
assert N % 2 == 0

divs = []
l = 1
while l * l <= A:
    if A % l == 0:
        divs.append([l, A//l])
    l += 1

res = []
for i in range(N // 2):
    res += random.choice(divs)

print(A)
print(N)
print(*res)
