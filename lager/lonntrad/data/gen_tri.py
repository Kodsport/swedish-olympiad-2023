#!/usr/bin/python3

from common import *

ind = 0
edges = []

def rec(k, avail):
    global ind
    assert avail > 0
    mid = ind
    ind += 1
    if avail == 1 or k == 0:
        return (mid, mid, 1)
    avail -= 1
    size = 1
    leaves = []
    for i in range(3):
        if not avail:
            break
        a,b,s = rec(k-1, avail)
        avail -= s
        size += s
        edges.append((mid, a))
        leaves.append(b)
    assert leaves
    if len(leaves) == 1:
        leaves.append(mid)
    return (leaves[0], leaves[1], size)

k = int(cmdlinearg('k'))
rec(k, n)
assert ind == n, "k too small"
output(edges)
