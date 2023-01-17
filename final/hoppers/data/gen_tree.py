#!/usr/bin/python3

import sys
import random
import math
sys.setrecursionlimit(int(1e6))

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
max_depth = int(cmdlinearg("max_depth"))
noup = int(cmdlinearg("noup", 0))
branching_factor = int(cmdlinearg("branching", 3))

assert(r*c<=tiles)

print(r,c,n)


choices = ['<','>','v','^']
if noup:
    choices.pop()

grid = [["-" for i in range(c)] for j in range(r)]


positions = []
for i in range(r):
    for j in range(c):
        positions.append([i,j])
random.shuffle(positions)

directions = [[0,1,'<'],[0,-1,'>'],[-1,0,'v'],[1,0,'^']]
if noup:
    directions.pop()

placed = 0
placements = []

def dfsplace(i,j,depth, dir):
    if i < 0 or i >= r or j < 0 or j >= c:
        return
    if grid[i][j]!='-':
        return
    if depth>max_depth:
        return

    grid[i][j] = dir
    random.shuffle(directions)
    for i in range(branching_factor):
        dir_ = directions[i]
        dfsplace(i+dir_[0],j+dir_[1],depth+1,dir_[2])

    # Try to place nodes as deep as possible in the tree
    global placed
    if placed<n:
        placements.append([i,j])
        placed+=1

for pos in positions:
    if grid[pos[0]][pos[1]] != '-':
        continue

    dfsplace(pos[0],pos[1], 0, random.choice(choices))

for i in range(r):
    if grid[i][0] == '<':
        grid[i][0] = '>'
    if grid[i][c-1] == '>':
        grid[i][c-1] = '<'

for i in range(c):
    if grid[0][i] == '^':
        grid[0][i] = 'v'
    if grid[r-1][i] == 'v':
        if noup:
            if i == 0:
                grid[r-1][i] = '>'
            else:
                grid[r-1][i] = '<'
        else:
            grid[r-1][i] = '^'

for i in range(r):
    print("".join(grid[i]))

for placement in placements:
    print(placement[0], placement[1])

while placed < n:
    print(random.randint(0,r-1), random.randint(0,c-1))
    placed += 1
