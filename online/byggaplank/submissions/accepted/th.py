#!/usr/bin/env python3

""" Time O(N**2), still pretty fast in Python. """

import bisect

N, K = map(int, input().split())
shorterplanks = [-1] * (K + 1) + [N] * (K + 1) # indices of shorter planks than current
areas = set()
for h, hidx in sorted((h, i) for i, h in enumerate(map(int, input().split()))):
    i = bisect.bisect(shorterplanks, hidx)
    shorterplanks.insert(i, hidx)
    areas.add(
        max(
            h * (shorterplanks[i - j + K + 1] - shorterplanks[i - j - 1] - 1)
            for j in range(K + 1)
        )
    )
print(max(areas))
