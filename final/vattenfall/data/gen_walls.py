#!/usr/bin/python3

# Structured group 4 obstacles where the cell above a shelf matters.
#
# mode=segruns: horizontal runs stacked downwards inside a band, each with
#   stones directly above some interior cells (splitting the run into
#   segments that water can only leave at their own ends) and, with
#   probability pocketprob, walls above both ends so the run is a dead end.
#   Water columns are drawn from the band plus one column on each side.
#
# mode=zigzag: a funnel of floors of length len, alternating which end is
#   walled, so a single stream of water must traverse every floor and exit on
#   alternating sides all the way down. Water enters in the middle of the top
#   floor; extra water columns (up to len+2) land on the funnel too, the rest
#   fall freely elsewhere.
#
# Cliffs are emitted in construction order and cut off at exactly n, so the
# structure is intact except possibly for the last run or floor.

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
mode = cmdlinearg('mode', 'segruns')
anchor = cmdlinearg('anchor', 'random')

cliffs = set()
order = []

def add(p):
    if len(order) >= n or p in cliffs:
        return
    if not (1 <= p[0] <= r - 1 and 0 <= p[1] <= c - 1):
        return
    cliffs.add(p)
    order.append(p)

if mode == 'segruns':
    maxlen = int(cmdlinearg('maxlen', 60))
    abovefrac = float(cmdlinearg('abovefrac', 0.2))
    pocketprob = float(cmdlinearg('pocketprob', 0.3))
    w = min(int(cmdlinearg('w', c)), c)
    if anchor == 'left':
        x0 = 0
    elif anchor == 'right':
        x0 = c - w
    elif anchor == 'mid':
        x0 = (c - w) // 2
    else:
        x0 = random.randint(0, c - w)

    row = r - 2
    while len(order) < n and row >= 1:
        L = min(random.randint(2, maxlen), w)
        x = x0 + random.randrange(w - L + 1)
        for i in range(L):
            add((row, x + i))
        for i in range(1, L - 1):
            if random.random() < abovefrac:
                add((row + 1, x + i))
        if random.random() < pocketprob:
            add((row + 1, x - 1))
            add((row + 1, x + L))
        row -= random.randint(2, 4)
    assert len(order) == n, "not enough rows to place n cliffs"

    lo, hi = max(0, x0 - 1), min(c - 1, x0 + w)
    if k > hi - lo + 1:
        lo, hi = 0, c - 1
    water = random.sample(range(lo, hi + 1), k)

elif mode == 'zigzag':
    L = int(cmdlinearg('len', 50))
    assert L + 4 <= c, "grid too narrow for the funnel"
    # floors use columns xb-1 .. xb+L, walls sit at xb-2 and xb+L+1
    if anchor == 'left':
        xb = 2
    elif anchor == 'right':
        xb = c - L - 2
    elif anchor == 'mid':
        xb = (c - L) // 2
    else:
        xb = random.randint(2, c - L - 2)

    row = r - 2
    i = 0
    while len(order) < n and row >= 1:
        if i % 2 == 0:
            # enter at the right end, wall on the right, exit left at xb-1
            for j in range(L + 1):
                add((row, xb + j))
            add((row + 1, xb + L + 1))
        else:
            # enter at the left end (xb-1), wall on the left, exit right at xb+L
            for j in range(L + 1):
                add((row, xb - 1 + j))
            add((row + 1, xb - 2))
        row -= 2
        i += 1
    assert len(order) == n, "not enough rows to place n cliffs"

    funnel = [xb + L // 2] + random.sample(
        [v for v in range(xb - 1, xb + L + 1) if v != xb + L // 2], min(k, L + 2) - 1)
    water = list(funnel)
    seen = set(water)
    while len(water) < k:
        v = random.randint(0, c - 1)
        if v not in seen:
            seen.add(v)
            water.append(v)
    random.shuffle(water)
else:
    print("unknown mode", mode)
    sys.exit(1)

print(r, c)
print(k, n)
for v in water:
    print(v)
for p in order:
    print(*p)
