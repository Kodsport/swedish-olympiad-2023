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

MAXQ = 2 * 10**5
MAXN = 400
MAXX = 400
MAXA = 160000

random.seed(int(cmdlinearg('seed', sys.argv[-1])))
n = int(cmdlinearg('n'))
q = int(cmdlinearg('q', MAXQ))
min_a = int(cmdlinearg('min_a', 0))
max_a = int(cmdlinearg('max_a', MAXX))
min_d = int(cmdlinearg('min_d', 0))
max_d = int(cmdlinearg('max_d', MAXX))

min_A = int(cmdlinearg('min_A', 0))
max_A = int(cmdlinearg('max_A', MAXA))
min_D = int(cmdlinearg('min_D', 0))
max_D = int(cmdlinearg('max_D', MAXA))

mode = cmdlinearg('mode', 'random')

if mode == 'random':
    print(n)
    for i in range(n):
        a = random.randint(min_a, max_a)
        d = random.randint(min_d, max_d)
        print(a,d)

    print(q)
    for i in range(q):
        A = random.randint(min_A, max_A)
        D = random.randint(min_D, max_D)
        print(A, D)
elif mode == 'exponential':
    print(n)
    a = 1
    d = 1
    for i in range(n):
        a = min(a, max_a)
        d = min(d, max_d)
        if a == max_a or d == max_d:
            print(a, random.randint(min_d, max_d))
        else:
            print(a, d)
        a *= 2
        d *= 2
    
    print(q)
    for i in range(q):
        A = random.randint(min_A, max_A)
        D = random.randint(min_D, max_D)
        print(A, D)

