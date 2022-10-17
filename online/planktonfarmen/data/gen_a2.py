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
assert N%2 == 0

print(2)
print(N)

L = N // 2
X = [1] * L + [A] * L
random.shuffle(X)
print(*X)
