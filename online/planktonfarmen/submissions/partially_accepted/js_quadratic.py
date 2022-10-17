#!/usr/bin/env python3
A = int(input())
N = int(input())
L = sorted(map(int, input().split()))

res = 0
while len(L) > 1:
    if L[0] * L[-1] >= A:
        L = L[1:-1]
        res += 1
    else:
        L = L[1:]

print(res)
