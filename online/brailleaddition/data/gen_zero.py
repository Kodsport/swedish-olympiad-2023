#!/usr/bin/python3

import sys
import random

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    if default is None:
        print("missing parameter", name)
        sys.exit(1)
    return default


class bnum:
    def __init__(self,top,mid,bot=".."):
        self.top = top
        self.mid = mid
        self.bot = bot
    
    def __str__(self):
        return self.top + "\n" + self.mid + "\n" + self.bot


random.seed(int(cmdlinearg('seed', sys.argv[-1])))
n = int(cmdlinearg('n'))
m = int(cmdlinearg('m'))
flag = int(cmdlinearg('flag',0))
l1 = ".."
l2 = "*."
l3 = ".*"
l4 = "**"
bnums = [
    bnum(l3,l4), # 0
    bnum(l2,l1), # 1
    bnum(l2,l2), # 2
    bnum(l4,l1), # 3
    bnum(l4,l3), # 4
    bnum(l2,l3), # 5
    bnum(l4,l2), # 6
    bnum(l4,l4), # 7
    bnum(l2,l4), # 8
    bnum(l3,l2) # 9
]


'''
for el in nums:
    print(str(el))
    print()
'''

lower = 0
upper = 9
if flag == 1:
    lower = 1
    upper = 1
ar1 = [random.randint(lower, upper) for _ in range(n)]
ar2 = [random.randint(lower, upper) for _ in range(m)]

if ar1 and ar1[0] == 0:
    ar1[0] = 1

if ar2 and ar2[0] == 0:
    ar2[0] = 1 

if n == 0:
    ar1 = [0]
    n = 1
elif m == 0:
    ar2 = [0]
    m = 1

print(n)
#print(*ar1)
print(" ".join([bnums[num].top for num in ar1]))
print(" ".join([bnums[num].mid for num in ar1]))
print(" ".join([bnums[num].bot for num in ar1]))
print(m)
#print(*ar2)
print(" ".join([bnums[num].top for num in ar2]))
print(" ".join([bnums[num].mid for num in ar2]))
print(" ".join([bnums[num].bot for num in ar2]))
