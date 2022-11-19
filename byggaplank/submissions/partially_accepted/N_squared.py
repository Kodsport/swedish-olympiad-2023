#!/usr/bin/python3


import heapq

N, K = map(int, input().split())
h = list(map(int, input().split()))

max_area = 0

for i in range(N):
    heap = []
    heapq.heapify(heap)
    sz = 0

    for j in range(i, N):
        heapq.heappush(heap, -h[j])
        sz += 1

        if sz > K + 1:
            heapq.heappop(heap)
            sz -= 1

        last = -heapq.heappop(heap)
        heapq.heappush(heap, -last)

        max_area = max(max_area, (j - i + 1) * last)

print(max_area)
