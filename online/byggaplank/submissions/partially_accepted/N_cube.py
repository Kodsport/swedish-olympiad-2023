#!/usr/bin/python3


N, K = map(int, input().split())
h = list(map(int, input().split()))

max_area = 0

for l in range(N):
    for r in range(l, N):
        nums = [h[i] for i in range(l, r + 1)]
        nums.sort()
        max_area = max(max_area, (1 + r - l) * nums[min(len(nums) - 1, K)])

print(max_area)
