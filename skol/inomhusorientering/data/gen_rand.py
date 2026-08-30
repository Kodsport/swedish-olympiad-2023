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
n = int(cmdlinearg('n', random.randint(1, 15)))
avg_dist = int(cmdlinearg('d'))
dev = int(cmdlinearg('dev'))


MAX_CLIQUE = int(cmdlinearg('maxclique', 4))
EXTRA_CLIQUES = int(cmdlinearg('extra', 3))

stairs = []

order = list(range(n))
random.shuffle(order)
connected, rest = order[:1], order[1:]
while rest:
    k = random.randint(1, min(MAX_CLIQUE - 1, len(rest)))
    joining, rest = rest[:k], rest[k:]
    stairs.append([random.choice(connected)] + joining)
    connected += joining

for _ in range(random.randint(0, EXTRA_CLIQUES)):
    if len(stairs) == 26: break
    stairs.append(random.sample(range(n), random.randint(2, min(MAX_CLIQUE, n))))

assert len(stairs) <= 26, "more than 26 stairwells needed"

names = random.sample([chr(i) for i in range(ord("A"), ord("Z") + 1)], len(stairs))

edges = [[] for _ in range(n)]
for name, areas in zip(names, stairs):
    for a in areas:
        edges[a].append(name)

print(n)
for i in range(n):
    d = random.randint(avg_dist-dev, avg_dist+dev)
    random.shuffle(edges[i])
    print(d, "".join(edges[i]))
