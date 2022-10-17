#!/usr/bin/env python3
import collections

A = int(input())
N = int(input())
L = list(map(int, input().split()))
counts = collections.defaultdict(int)

big = 0
for l in L: 
    if l > A:
        big += 1
    else:
        counts[l] += 1
L = sorted(counts.keys())

res = 0
while len(L) > 1:
    if counts[L[0]] <= 0:
        L = L[1:]
        continue
    if counts[L[-1]] <= 0:
        L = L[:-1]
        continue

    counts[L[0]] -= 1
    if L[0] * L[-1] >= A:
        res += 1
        counts[L[-1]] -= 1

if L and L[0] * L[0] >= A: res += counts[L[0]] // 2

print(res + (big // 2))
