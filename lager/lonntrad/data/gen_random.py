#!/usr/bin/python3

from common import *
import math

mode = cmdlinearg('mode')
extra = int(cmdlinearg('extra', 0))
extraord = int(cmdlinearg('extraord', 0))

def gen_tree():
    eds = []
    depth = [0]
    adj = [[] for _ in range(n)]
    avail = {0}
    n2 = n
    for i in range(1, n):
        if n - i <= extra * len(avail):
            n2 = i
            break
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
        if len(adj[pred]) == 3:
            avail.remove(pred)
        avail.add(i)
        eds.append((pred, i))
        depth.append(depth[pred] + 1)
    if mode == 'binary2':
        at = 0
        k = 2
        while at < n2:
            layer = eds[at:at+k]
            random.shuffle(layer)
            eds = eds[:at] + layer + eds[at+k:]
            at += k
            k *= 2

    if extra:
        avail = sorted(avail)
        random.shuffle(avail)
        assert n - n2 <= extra * len(avail)
        # i - n2 < extra * len(avail)
        # (i - n2) / extra < len(avail)
        for i in range(n2, n):
            if extraord == 0:
                j = i % len(avail)
            elif extraord == 1:
                j = (i - n2) // extra
            else:
                j = random.randrange(len(avail))
            pred = avail[j]
            eds.append((pred, i))
            depth.append(depth[pred] + 1)
            adj[pred].append(i)
            adj[i].append(pred)
            avail[j] = i
    else:
        assert n == n2

    print('depth =', max(depth), file=sys.stderr)
    return eds, adj

eds, _ = gen_tree()
output(eds)
