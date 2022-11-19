#!/usr/bin/python3


import sys
import random
import math
from bisect import bisect_left


def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    if default is None:
        print("missing parameter", name)
        exit(1)
    return default

random.seed(int(cmdlinearg('seed', sys.argv[-1])))
n = int(cmdlinearg('n'))
k = int(cmdlinearg('k'))
min_height = int(cmdlinearg('min_height'))
max_height = int(cmdlinearg('max_height'))
mode = cmdlinearg('mode')

print(n, k)
heights = []

if mode == 'increasing-even-rect-distribution':
    added = set()
    while len(heights) < n:
        new = round( (k * max_height) / ( (random.random() * n) + k) )
        if not new in added:
            heights.append(new)
            added.add(new)
    heights.sort()
    heights = list(map(str, heights))

elif mode == 'increasing' or mode == 'unique':
    prev = 0
    for i in range(n):
        heights.append(str(random.randint(prev + 1, random.randint(prev + 1, max_height - (n - i - 1)))))
        prev = int(heights[-1])

    if mode == 'unique':
        random.shuffle(heights)

elif mode == 'derivative': # good for large n ≥ 10000
    interval = max_height - min_height

    period = random.randint(6, 10)
    
    down = random.randint(1, round( (interval ** 0.5) / period))
    up = round( (random.random() ** 2) * down)

    # get normal distribution form avg
    avg = 0
    for i in range(n):
        avg += random.random()
    avg = round( min_height + ( (avg / n) * interval) )

    derivative = random.randint(- down * period, down * period)
    heights.append(min(max_height, max(min_height, avg + random.randint(- round(down ** 3), round(down ** 3)))))

    # generate curve
    for i in range(1, n):
        if heights[-1] > avg:
            derivative += random.randint(-down, up)
        else:
            derivative += random.randint(-up, down)
        new = heights[-1] + derivative
        new = min(max_height, max(min_height, new))
        heights.append(new)
    
    # add exceptions
    for i in range(round(k * (n ** 0.33) * (random.randint(10, 20) / period))):
        heights[random.randint(0, n - 1)] = round( min_height + ((random.random() ** 2 ) * interval))
    
    # add shifting noise
    delta = round(interval / period)
    for i in range(n):
        delta2 = round( (random.random() ** 2) * delta)
        heights[i] = min(max_height, max(min_height, heights[i] + random.randint(-delta2, delta2)))
    
    heights = list(map(str, heights))
        
else:
    for i in range(n):
        heights.append(str(random.randint(min_height, max_height)))

"""
# modifier
same = True
if same:
    heights_prime = heights.copy()
    h = [random.randint(min_height, max_height) for _ in range(round(n ** 0.5))]
    h.append(max_height + 1)
    h.sort()

    for i in range(n):
        heights[i] = str(h[bisect_left(h, int(heights[i]))])        
"""
print(' '.join(heights))
