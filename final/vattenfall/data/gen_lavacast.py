#!/usr/bin/python3

# This generator is kind of buggy

import sys
import random
import math
sys.setrecursionlimit(int(1e6)+10)

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    if default is None:
        print("missing parameter", name)
        sys.exit(1)
    return default

random.seed(int(cmdlinearg('seed', sys.argv[-1])))
r = int(cmdlinearg('r'))
c = int(cmdlinearg('c'))
n = int(cmdlinearg('n'))
k = int(cmdlinearg('k'))
band_multiplier = float(cmdlinearg('band_multiplier'))
center = c//2



seen = set()
# Create a semi-dense band
for i in range(k):
    while True:
        p = random.randint(center, center + int(band_multiplier*k))
        if p not in seen:
            seen.add(p)
            break



from heapq import *

q = list((random.randint(0,int(1e9)), (r-1, i)) for i in sorted(seen))
heapify(q)

seen_water = set()
def try_push(pos):
    if pos[0] < 0 or pos[0] >= r or pos[1] < 0 or pos[1] >= c:
        return
    if pos in placed_cliffs:
        return
    if pos in seen_water:
        return
    seen_water.add(pos)
    heappush(q, (random.randint(0,int(1e9)), pos))

placed_cliffs = set()

def add_cliff(pos):
    if pos[0] < 1 or pos[0] >= r or pos[1] < 0 or pos[1] >= c:
        return
    placed_cliffs.add(pos)

while len(placed_cliffs) < n:
    #print(len(placed_cliffs))
    _, pos = heappop(q)

    pos_down = (pos[0]-1, pos[1])
    if pos_down[0] == 0:
        continue

    if pos_down in placed_cliffs:
        # Propagate to the sides
        try_push((pos[0], pos[1]+1))
        try_push((pos[0], pos[1]-1))
    else:
        if random.randint(0, 1): # Jump down
            if random.randint(0, 1):
                # One step down
                try_push((pos[0]-1, pos[1]))
            else:
                # Jump down far
                try_push((pos[0]-random.randint(1, int(pos[0]**0.5)), pos[1]))
        else:
            if random.randint(0, 10) == 0:
                # Dead end
                add_cliff((pos[0]-1, pos[1]))
                add_cliff((pos[0], pos[1]+1))
                add_cliff((pos[0], pos[1]-1))
            else:
                add_cliff((pos[0]-1, pos[1]))
                try_push((pos[0], pos[1]+1))
                try_push((pos[0], pos[1]-1))


print(r,c)
print(k,n)
for p in seen:
    print(p)

cliffs = list(placed_cliffs)
random.shuffle(cliffs)
cliffs = cliffs[:n]
for i in range(n):
    print(*cliffs[i])
