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
n = int(cmdlinearg('n'))

sols = set()

def rec(i, strength, ppl_diff, n, people):
    if strength==0 and  ppl_diff==0 and i!=0:
        sols.add(tuple(people))

    if i==len(people): return

    for j in range(0,n+1):
        newpeople = [k for k in people]
        newpeople[i] += j
        rec(i+1,strength-j*(i+1), ppl_diff-j, n, newpeople)
        rec(i+1,strength+j*(i+1), ppl_diff+j, n, newpeople)

rec(0,0,0,n,[0,0,0,0])
print("[")
for sol in sols:
    print("[",end="")
    print(", ".join(str(i) for i in sol),end="")
    print("],")
print("]")