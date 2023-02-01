#!/usr/bin/python3

from common import *
import math

def gen_tree(mode):
    eds = []
    depth = [0]
    adj = [[] for _ in range(n)]
    for i in range(1, n):
        while True:
            if mode == 'random':
                pred = random.randrange(i)
            elif mode == 'line':
                pred = i-1
            elif mode in ('binary', 'binary2'):
                pred = (i - 1) // 2
            elif mode == 'shallow':
                pred = int(random.uniform(0, i**0.2) ** 5)
            elif mode == 'shallower':
                pred = int(2**random.uniform(-2, math.log2(i)))
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
    print('depth =', max(depth), file=sys.stderr)
    if mode == 'binary2':
        at = 0
        k = 2
        while at < n:
            layer = eds[at:at+k]
            random.shuffle(layer)
            eds = eds[:at] + layer + eds[at+k:]
            at += k
            k *= 2
    return eds, adj

mode = cmdlinearg('mode')

eds, _ = gen_tree(mode)
output(eds)
