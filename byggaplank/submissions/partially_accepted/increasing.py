#!/usr/bin/python3


N, K = map(int, input().split())
h = list(map(int, input().split()))

max_area = 0

for i in range(N):
    max_area = max(max_area, min(N, N + K - i) * h[i])

print(max_area)
