#!/usr/bin/python3

r, c = map(int, input().split())
k, n = map(int, input().split())

water = set()
for _ in range(k):
    water.add(int(input()))

blocks = []
for _ in range(n):
    y, x = map(int, input().split())
    blocks.append((-y, x))
blocks.sort()

for _, x in blocks:
    if x in water:
        water.remove(x)
        water.add(x-1)
        water.add(x+1)
if -1 in water:
    water.remove(-1)
if c in water:
    water.remove(c)
print(len(water))
