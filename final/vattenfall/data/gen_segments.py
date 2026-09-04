#!/usr/bin/python3

# Random isolated line segments (horizontal shelves and vertical bars) inside
# a band of the grid. Segments never touch each other, not even diagonally, so
# the output is valid for group 3 (and this is the most general shape group 3
# allows). Shelves overlap in columns across rows, so water leaving one shelf
# lands on another, and water often lands in the interior of a shelf.
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
maxlen = int(cmdlinearg('maxlen', 40))
vfrac = float(cmdlinearg('vfrac', 0.2))  # fraction of segments that are vertical
anchor = cmdlinearg('anchor', 'random')

if anchor == 'left':
    x0 = 0
elif anchor == 'right':
    x0 = c - w
elif anchor == 'mid':
    x0 = (c - w) // 2
else:
    x0 = random.randint(0, c - w)
y0 = r - h

cliffs = set()
attempts = 0
while len(cliffs) < n:
    attempts += 1
    assert attempts <= 20 * n + 1000, "band too dense for isolated segments"
    L = random.randint(1, min(maxlen, n - len(cliffs)))
    if random.random() < vfrac:
        L = min(L, h)
        y = y0 + random.randrange(h - L + 1)
        x = x0 + random.randrange(w)
        seg = [(y + i, x) for i in range(L)]
    else:
        L = min(L, w)
        y = y0 + random.randrange(h)
        x = x0 + random.randrange(w - L + 1)
        seg = [(y, x + i) for i in range(L)]
    if any((a + da, b + db) in cliffs
           for a, b in seg for da in (-1, 0, 1) for db in (-1, 0, 1)):
        continue
    cliffs.update(seg)

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
