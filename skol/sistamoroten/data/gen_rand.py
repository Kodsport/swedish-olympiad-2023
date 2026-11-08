#!/usr/bin/python3

import sys
import random
import math

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    if default is None:
        print("missing parameter", name)
        sys.exit(1)
    return default


def find_k(n,m,eps):
    dp = [0] * (n*m+1)
    dp[0] = 1
    newdp = [0] * (n*m+1)
    ops=0
    for j in range(n):
        pf = [0] * (n*m+1)
        pf[0] = dp[0]
        for i in range(1, len(dp)): pf[i]=pf[i-1]+dp[i]


        for i in range(len(dp)):
            ops+=1
            pf_hi = 0
            if i > 0: pf_hi = pf[i-1]
            pf_lo = 0
            if i-m-1>=0: pf_lo = pf[max(0, i-m-1)]

            newdp[i] = (pf_hi-pf_lo)/m
        dp = newdp
        newdp = [0] * (n*m+1)

    dp = sorted(dp, reverse=True)
    ans = 0
    k = 0
    while ans < eps:
        ans += dp[k]
        k+=1
    return k



random.seed(int(cmdlinearg('seed', sys.argv[-1])))
n = int(cmdlinearg('n'))
m = int(cmdlinearg('m'))
eps = float(cmdlinearg('eps',1e-4))
k = find_k(n,m,eps)

print(n,m,k)