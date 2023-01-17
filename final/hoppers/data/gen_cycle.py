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
noup = int(cmdlinearg("noup",0))
assert(r*c<=tiles)
assert(cycle_rows%2==0) # Otherwise, the construction isn't possible

print(r,c,n)

# Generates testcases that looks like this:
# (With some small percent of the top part being rotated).
"""
vvvvvvv
vvvvvvv
vvvvvvv
>>>>>>v
^v<<<<<
^>>>>>v
^<<<<<<
"""

non_cycle_rows = r-cycle_rows

choices = ['<','>','^']
if noup:
    choices.remove('^')

for i in range(non_cycle_rows):
    row = []
    for j in range(c):
        nchoices = ["v"]
        row.append(random.choice(nchoices))
    if i != 0:
        for j in range(1,c-1):
            if random.uniform(0,1)<percent_rot:
                row[j] = random.choice(choices)

    if noup and i==r-1:
        row[0]='>'
        for j in range(1,c):
            row[j]='<'

    print("".join(row))

cycle = [["-" for j in range(c)] for i in range(cycle_rows)] 

if cycle_rows:
    for i in range(cycle_rows):
        cycle[i][0] = '^'

        direction = ">" if i % 2 == 0 else "<"
        for j in range(1, c):
            cycle[i][j] = direction

        if i%2==0:
            cycle[i][c-1] = 'v'
        else:
            cycle[i][1] = 'v'

    cycle[0][0] = '>'
    cycle[cycle_rows-1][1] = '<'


    for i in range(cycle_rows):
        print("".join(cycle[i]))



for i in range(n):
    if random.uniform(0,1)<percent_within:
        print(random.randint(cycle_rows,r-1), random.randint(0,c-1))
    else:
        print(random.randint(0,cycle_rows), random.randint(0,c-1))
