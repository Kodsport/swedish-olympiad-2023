#!/usr/bin/env python3
A = int(input())
N = int(input())
L = sorted(list(map(int, input().split())))

res = 0
found = True
while found:
    found = False
    for i in range(len(L)):
        for j in range(i):
            if L[i] * L[j] >= A:
                res += 1
                L.pop(i)
                L.pop(j)
                found = True
                break
        if found:
            break

print(res)
