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
min_d = int(cmdlinearg('min_d', 1))
max_d = int(cmdlinearg('max_d', 10**6))
diff = int(cmdlinearg('diff', 10**9))

if diff > n:
    diff = n

D2 = random.sample(range(min_d, max_d+1), diff)
D = [D2[random.randrange(0, len(D2))] for _ in range(n)]

print(n,t)
prev = 0
X = []
for i in range(n):
    X.append(prev + D[i])
    prev = X[-1]
print(*X)
