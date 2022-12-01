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

# Each letter creates a clique between all the nodes with it

# Stolen from https://github.com/cheran-senthil/PyRival/blob/master/pyrival/data_structures/DisjointSetUnion.py
class UF:
    def __init__(self, n):
        self.parent = list(range(n))

    def find(self, a):
        acopy = a
        while a != self.parent[a]:
            a = self.parent[a]
        while acopy != a:
            self.parent[acopy], acopy = a, self.parent[acopy]
        return a

    def union(self, a, b):
        self.parent[self.find(b)] = self.find(a)

letters = [chr(i) for i in range(ord("A"), ord("Z")+1)]
l = 0

uf = UF(n)

edges = []
for i in range(n): edges.append([])

num_components = n
while num_components>1:
    a,b=random.randint(0,n-1),random.randint(0,n-1)
    if uf.find(a)!=uf.find(b):
        uf.union(a,b)
        edges[a].append(letters[l])
        edges[b].append(letters[l])
        l+=1
        num_components-=1


print(n)
for i in range(n):
    d = random.randint(avg_dist-dev, avg_dist+dev)
    print(d, "".join(edges[i]))
