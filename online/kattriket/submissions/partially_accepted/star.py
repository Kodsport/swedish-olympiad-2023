#!/usr/bin/env python3
import sys
import heapq

N = int(input())

def make_tree():
    G = [[] for _ in range(N)]
    for _ in range(N - 1):
        a, b = map(int, input().split())
        G[a].append(b)
        G[b].append(a)

    children = [[] for _ in range(N)]
    depth = [-1] * N

    def dfs(at, par, d):
        depth[at] = d
        f, fidx = -1, -1
        for adj in G[at]:
            if adj == par: continue
            children[at].append(adj)
            dfs(adj, at, d + 1)

    dfs(0, -1, 0)

    return children, depth

ch, depth = make_tree()

res = []
for c, d in zip(ch, depth):
    if not c: res.append(d)

res.sort(reverse=True)

ans = []
cur = 0
for i, p in enumerate(res):
    for l in range(p):
        ans.append(i + 1)

print(*ans)
