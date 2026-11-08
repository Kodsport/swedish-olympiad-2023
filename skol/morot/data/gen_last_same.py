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

random.seed(int(cmdlinearg('seed', sys.argv[-1])))
hi = int(cmdlinearg('hi', 100))

while True:
    a = random.randint(1, 100)
    b = random.randint(1, 100)
    
    works = False
    t = 1
    left = 38
    while left > 0:
        if t%a==0 and t%b==0 and left == 1:
            works = True
            break
        
        if t%a==0 or t%b==0:
            left -= 1
        t+=1
    
    if works:
        print(a,b)
        break
    