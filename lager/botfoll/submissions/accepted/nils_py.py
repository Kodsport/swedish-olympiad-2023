#!/usr/bin/python3

big = 10**9+7
MAXN = 201
MAXA = 201
DP = [-big] * (MAXN*MAXA)
sumd = 0
result = ["lose", "draw", "win"]

n = int(input())
DP[0] = 0
for _ in range(n):
    a, d = map(int, input().split())
    sumd += d
    for suma2 in range(0, MAXA*MAXN-a):
        suma = MAXA*MAXN-suma2-1
        DP[suma] = max(DP[suma], DP[suma-a] + a-d)
for suma in reversed(range(0, MAXN*MAXA-1)):
    DP[suma] = max(DP[suma], DP[suma+1])

q = int(input())
for _ in range(q):
    a, d = map(int, input().split())
    ans = 0
    if sumd >= a:
        ans = 1
    if DP[d+1] >= a+d-sumd:
        ans = 1
    if DP[d+1] > a+d-sumd:
        ans = 2
    print(result[ans])
