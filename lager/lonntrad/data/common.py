#!/usr/bin/python3

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

n = int(cmdlinearg('n'))
w = int(float(cmdlinearg('w')))
edge_order = cmdlinearg('eorder', 'normal')

def output(edges, randomize=True):
    assert len(edges) == n-1
    ren = list(range(n))
    if randomize:
        random.shuffle(ren)
    if edge_order == 'rev':
        edges = edges[::-1]
    elif edge_order == 'random':
        random.shuffle(edges)
    else:
        assert edge_order == 'normal'
    print(n)
    for (u, v) in edges:
        print(ren[u], ren[v], random.randint(0, w))
