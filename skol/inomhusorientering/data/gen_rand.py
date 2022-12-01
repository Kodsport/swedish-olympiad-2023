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

uf = UF(n)

letters = [chr(i) for i in range(ord("A"), ord("Z")+1)]
letterIdx = [0] * n

edges = []
for i in range(n): edges.append([])

num_components = n
out = ""
num_components = n
while num_components>1:
    a,b=random.randint(0,n-1),random.randint(0,n-1)
    if a==b: continue
    if letterIdx[a]==letterIdx[b]:
        edges[a].append(letters[letterIdx[a]])
        edges[b].append(letters[letterIdx[b]])
        letterIdx[a]+=1
        letterIdx[b]+=1
    elif letterIdx[a]<letterIdx[b]:
        edges[a].append(letters[letterIdx[a]])
        letterIdx[a]+=1
    else:
        edges[b].append(letters[letterIdx[b]])
        letterIdx[b]+=1

    if uf.find(a)!=uf.find(b):
        uf.union(a,b)
        num_components-=1


print(n)
for i in range(n):
    d = random.randint(avg_dist-dev, avg_dist+dev)
    print(d, "".join(edges[i]))
