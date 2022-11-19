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
N = int(cmdlinearg('N'))
K = int(cmdlinearg('K'))

def add_seg_at(S, start, frac):
    lo = start
    hi = lo + 4 * int(N * frac / 4)
    S[lo] = S[lo + 1] = 'V'
    for i in range(lo + 3, hi - 2, 2):
        S[i] = 'V'
    S[hi] = S[hi - 1] = 'V'

print(N, K)
S = ['F']*N

add_seg_at(S, int(N*0.2), 0.2)
add_seg_at(S, int(N*0.5), 0.2)
add_seg_at(S, int(N*0.75), 0.2)

for i in range(2,N-3):
    if 'V' not in S[i-2:i+3]:
        S[i] = 'V'

print(''.join(S))
