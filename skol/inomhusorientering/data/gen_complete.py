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
n = int(cmdlinearg('n', random.randint(1, 15)))
avg_dist = int(cmdlinearg('d'))
dev = int(cmdlinearg('dev'))

# Each letter creates a clique between all the nodes with it

letters = [chr(i) for i in range(ord("A"), ord("Z")+1)]

group = "".join([letters[i] for i in range(n)])

print(n)
for i in range(n):
    d = random.randint(avg_dist-dev, avg_dist+dev)
    print(d, group)
