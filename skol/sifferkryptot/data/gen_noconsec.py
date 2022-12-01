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
lo = int(cmdlinearg('lo', 1))
hi = int(cmdlinearg('hi', 29)) # 29 letters in swedish alphabet

alphabet = [i for i in range(lo, hi)] 

def is12(i):
    return i=='1' or i=='2'

out = ""
while len(out) < n:
    nextC = str(random.choice(alphabet))

    if len(out+nextC)<=n and not (len(out)>1 and is12(out[-1]) and is12(out[-2]) and is12(nextC[0])):
        out += nextC

print(out)