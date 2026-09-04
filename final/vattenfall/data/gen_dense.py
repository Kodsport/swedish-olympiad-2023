#!/usr/bin/python3

# Dense random block of cliffs inside a band of the grid.
#
# The band is h rows tall (the topmost rows, so water meets it immediately)
# and w columns wide, anchored at the left edge, right edge, middle, or a
# random horizontal position. With nodiag=1 / noaxis=1 cliffs are placed by
# rejection sampling so that the group 2 / group 3 touching constraints hold.
# Water columns are drawn from the band plus one column on each side, or from
# the whole grid if k does not fit there.

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

random.seed(int(cmdlinearg('seed', sys.argv[-1])))
r = int(cmdlinearg('r'))
c = int(cmdlinearg('c'))
n = int(cmdlinearg('n'))
k = int(cmdlinearg('k'))
w = min(int(cmdlinearg('w', c)), c)
h = min(int(cmdlinearg('h', r - 1)), r - 1)
anchor = cmdlinearg('anchor', 'random')
nodiag = int(cmdlinearg('nodiag', 0))
noaxis = int(cmdlinearg('noaxis', 0))

if anchor == 'left':
    x0 = 0
elif anchor == 'right':
    x0 = c - w
elif anchor == 'mid':
    x0 = (c - w) // 2
else:
    x0 = random.randint(0, c - w)
y0 = r - h

forbidden = []
if noaxis:
    forbidden += [(-1, 0), (1, 0), (0, -1), (0, 1)]
if nodiag:
    forbidden += [(-1, -1), (-1, 1), (1, -1), (1, 1)]

cliffs = set()
if not forbidden:
    assert n <= w * h, "band has fewer cells than n"
    for idx in random.sample(range(w * h), n):
        cliffs.add((y0 + idx // w, x0 + idx % w))
else:
    attempts = 0
    while len(cliffs) < n:
        attempts += 1
        assert attempts <= 50 * n + 1000, "band too dense for the touching constraints"
        p = (y0 + random.randrange(h), x0 + random.randrange(w))
        if p in cliffs:
            continue
        if any((p[0] + dr, p[1] + dc) in cliffs for dr, dc in forbidden):
            continue
        cliffs.add(p)

lo, hi = max(0, x0 - 1), min(c - 1, x0 + w)
if k > hi - lo + 1:
    lo, hi = 0, c - 1
water = random.sample(range(lo, hi + 1), k)

print(r, c)
print(k, n)
for v in water:
    print(v)
cliffs = list(cliffs)
random.shuffle(cliffs)
for p in cliffs:
    print(*p)
