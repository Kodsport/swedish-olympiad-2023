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
cycle_rows = int(cmdlinearg("cycle_rows"))
percent_within = float(cmdlinearg("p_within")) # Percent within cycle
percent_rot = float(cmdlinearg("p_rot")) # Percent of upper part that's rotated
assert(r*c<=tiles)

print(r,c,n)

# Generates testcases that looks like this:
# (With some small percent of the top part being rotated)
"""
vvvvvvv
vvvvvvv
vvvvvvv
vvvvvvv
>>>>>v<
^v<<<<^
^<>>>>^
"""

non_cycle_rows = r-cycle_rows

choices = ['<','>','^']

for i in range(non_cycle_rows):
    row = []
    for j in range(c):
        nchoices = ["v"]
        row.append(random.choice(nchoices))
    if i != 0:
        for i in range(1,c-1):
            if random.uniform(0,1)<percent_rot:
                row[i] = random.choice(choices)
    print("".join(row))

cycle = [["-" for j in range(c)] for i in range(cycle_rows)] 

for i in range(cycle_rows):
    cycle[i][0] = '^'
    cycle[i][c-1] = '^'

    direction = ">" if i % 2 == 0 else "<"
    for j in range(1, c-1):
        cycle[i][j] = direction

    if i%2==0:
        cycle[i][c-2] = 'v'
    else:
        cycle[i][1] = 'v'

cycle[0][0] = '>'
cycle[0][c-1] = '<'
cycle[cycle_rows-1][1] = '<'
cycle[cycle_rows-1][c-2] = '>'

for i in range(cycle_rows):
    print("".join(cycle[i]))



for i in range(n):
    if random.uniform(0,1)<percent_within:
        print(random.randint(cycle_rows,r-1), random.randint(0,c-1))
    else:
        print(random.randint(0,cycle_rows), random.randint(0,c-1))
