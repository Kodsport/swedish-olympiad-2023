#!/usr/bin/python3

from common import *
import math
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

def gen_tree(mode,n):
    eds = []
    depth = [0]
    adj = [[] for _ in range(n)]
    if mode== 'line':
        for i in range(0,n-1):
            eds.append((i,i+1))
    elif mode== 'killCubic':
        for i in range(2*(n//3)):
            eds.append((i,i+1))
        eds.append((2*(n//3)+1,n//3))
        for i in range(2*(n//3)+1,n-1):
            eds.append((i,i+1))
    else:
        for i in range(1, n):
            while True:
                if mode == 'random':
                    pred = random.randrange(i)
                elif mode == 'deep':
                    pred = i-1 - int(random.uniform(0, i**0.1) ** 10)
                elif mode == 'deeper':
                    if i < 4:
                        pred = random.randrange(i)
                    else:
                        hi = math.log2(math.log2(i))
                        pred = i - int(2 ** 2 ** min(random.uniform(-3, hi), random.uniform(-3, hi), random.uniform(-3, hi)))
                else:
                    assert False, f"unknown mode {mode}"
                assert 0 <= pred < i
                if len(adj[pred]) < 3:
                    break
            adj[pred].append(i)
            adj[i].append(pred)
            eds.append((pred, i))
            depth.append(depth[pred] + 1)
    return eds, adj

modeTree=cmdlinearg('modeTree','random')
modeWeights=cmdlinearg('modeWeights','random')
modeQueries= cmdlinearg('modeQueries','random')
seed=cmdlinearg('seed')
n=int(cmdlinearg('n'))
q=int(cmdlinearg('q'))
endAtOne=int(cmdlinearg('endAtOne',0))
maxA=int(cmdlinearg('maxA',10**9))
maxX=int(cmdlinearg('maxX',10**9))
random.seed(seed)
print(n,q)
eds, _ = gen_tree(modeTree,n)
weights=[]
part=0 # Used to randmize the branch used with "killCubic"
for i in range(len(eds)):
    a=eds[i]
    print(a[0]+1,a[1]+1)
if modeWeights=='random':
    for i in range(n):
        weights.append(random.randint(1,maxA))
elif modeWeights=='specialLine':
    last=maxA
    nums=[]
    while last>0:
        nums.append(last//2+1)
        last=last%(last//2+1)
    # This is being done so that when you have maxA as a query then 
    # it gets reduced as little as possible (to half) by each step.
    if n>len(nums):
        for i in range(len(nums)-1):
            for j in range(n//(len(nums)-1)):
                weights.append(nums[i+(j%2)])
        for i in range(n%(len(nums)-1)):
            weights.append(2)
    else:
        for i in range(n):
            weights.append(nums[i])
elif modeWeights =='killCubic':
    # This just assigns one of the three lines in the tree weights from nums
    # and the remaining branches get maxA 
    last=maxA-1
    nums=[]
    while last>0:
        nums.append(last//2+1)
        last=last%(last//2+1)
    part=random.randint(0,2)
    if part==0:
        nums=nums[::-1]
    if part>0:
        for i in range(n//3):
            weights.append(maxA)
    if part==2:
        for i in range(n//3):
            weights.append(maxA)
    if n//3 <len(nums):
        for i in range(n//3):
            weights.append(nums[i])
    else:
        for i in range(len(nums)):
            for j in range((n//3)//len(nums)):
                weights.append(nums[i])
    if part<2:
        for i in range(n//3):
            weights.append(maxA)
    if part==0:
        for i in range(n//3):
            weights.append(maxA)
    for i in range(n%3):
        weights.append(maxA)

for i in range(len(weights)):
    print(weights[i],end="")
    if i+1!=len(weights):
        print(end=' ')
print()

queries=[]
used = {}

def getQuery():
    a=[]
    a.append(random.randint(1,n))
    if endAtOne==1:
        a.append(1)
    else: a.append(random.randint(1,n))
    if modeWeights=="specialLine":
        a.append(maxA)
    elif modeWeights=="killCubic":
        a.append(maxA-1)
    else:
        a.append(random.randint(1,maxX))
    return a

for i in range(q):
    if modeQueries=="startToEnd":
        if modeTree=="killCubic":
            if part==0:
                if random.randint(0,1)==1:
                    queries.append((2*(n//3),1,maxA))
                else:
                    queries.append((n,1,maxA))
            if part==1:
                if random.randint(0,1)==1:
                    queries.append((1,2*(n//3),maxA))
                else:
                    queries.append((n,2*(n//3),maxA))
            if part==2:
                if random.randint(0,1)==1:
                    queries.append((2*(n//3),n,maxA))
                else:
                    queries.append((1,n,maxA))
        else:
            queries.append((1,n,maxA))
        continue
    a=getQuery()
    if modeQueries=="distnict":
        while used[a]:
            a=getQuery()
        used[a]=True
    queries.append(a)
for i in range(q):
    a=queries[i]
    print(a[0],a[1],a[2],end='')
    if i+1!=q:
        print()