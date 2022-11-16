#!/usr/bin/env python3
N, K = map(int, input().split())
R = input()
R = [-1 if x == 'F' else 1 for x in R]

def rec(at, segsLeft, inseg):
    if at == N:
        return 0
    res = -N
    if not inseg:
        # extend non-seg
        res = max(res, rec(at + 1, segsLeft, False))
        # start new seg
        if segsLeft:
            res = max(res, rec(at + 1, segsLeft - 1, True) + R[at])
    else:
        # extend seg
        res = max(res, rec(at + 1, segsLeft, True) + R[at])
        # end seg
        res = max(res, rec(at + 1, segsLeft, False))
    return res

print(rec(0, K, False))
