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
tiles = int(cmdlinearg('tiles'))
r = int(cmdlinearg('r'))
c = int(cmdlinearg('c', tiles/r))
n = int(cmdlinearg('n'))
assert(r*c<=tiles)

print(r,c,n)
choices = ['<','>','v']
for i in range(r):
    row = []
    for j in range(c):
        nchoices = [i for i in choices]
        if i==r-1: nchoices.remove('v')
        if j==0: nchoices.remove('<')
        if j==c-1: nchoices.remove('>')
        row.append(random.choice(nchoices))
    print("".join(row))
    
for i in range(n):
    print(random.randint(0,r-1),random.randint(0,c-1))
