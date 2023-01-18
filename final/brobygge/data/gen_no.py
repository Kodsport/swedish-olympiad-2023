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
n = int(cmdlinearg('n'))
m = int(cmdlinearg('m'))
t = int(cmdlinearg('t'))
assert(t<=n*m/2.3)

par = [i for i in range(t+2)]

def find(x):
    if par[x]==x: return x
    par[x]=find(par[x])
    return par[x]

# No size optimization cuz lazy
def merge(a,b):
    a = find(a)
    b = find(b)
    if a==b: return

    par[a] = b

start = t
end = t+1

dirs = [[0,1],[0,-1],[1,0],[-1,0]]

# Add bridges as long as they do not connect the start and end
posToIndex = {}
print(n,m,t)
for ind in range(t):
    while True:
        r = random.randint(1, n-2)
        c = random.randint(0, m-1)
        if (r,c) in posToIndex:
            continue

        works = True
        for i in range(4):
            for j in range(4):
                if i==j: continue
                n1 = (r+dirs[i][0], c+dirs[i][1])
                n2 = (r+dirs[j][0], c+dirs[j][1])
                if n1 in posToIndex and n2 in posToIndex:
                    components = [find(posToIndex[n1]), find(posToIndex[n2])]
                    if start in components and end in components:
                        works = False
                        break

        if works:
            for i in range(4):
                n1 = (r+dirs[i][0], c+dirs[i][1])
                if n1 in posToIndex:
                    merge(ind, posToIndex[n1])

            posToIndex[(r,c)] = ind
            print(r,c)
            break
