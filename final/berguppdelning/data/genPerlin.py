

import sys
from perlin_noise import PerlinNoise
import random
import math

import matplotlib.pyplot as plt

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    assert default is not None, name
    return default

seed = int(cmdlinearg('seed', sys.argv[-1]))
random.seed(seed)

rows = int(cmdlinearg("r"))
cols = int(cmdlinearg("c"))
nsize = int(cmdlinearg("nsize"))
t = int(cmdlinearg("tc"))
maxv = int(cmdlinearg("maxv", 1000))

n = nsize
#n = math.ceil(rows*cols / nsize)

class NoiseData:
    i = 0

    def __init__(self, octavesPer100: int, mul: float) -> None:
        global rows
        global cols

        self.mul = mul

        sz = (rows + cols) / 2 # type: float
        octaves = sz / 100 * octavesPer100
        self.noise = PerlinNoise(octaves=octaves, seed=seed+NoiseData.i)
        NoiseData.i += 1

base_noise = eval(cmdlinearg("base_noise")) # type: tuple[int, list[NoiseData]]

print(t)
print(rows, cols, n)

# TODO: scale noise
def query_noise(r: int, c: int) -> int:
    global base_noise

    val = 0
    for noise in base_noise[1]:
        z = noise.noise([r / rows, c / cols])
        z = z / (math.sqrt(2) / 2)
        z = z / 2 + 0.5

        val += z * noise.mul
    val *= base_noise[0]

    #print(base)
    return round(val)


heights = [[query_noise(r, c) for c in range(cols)] for r in range(rows)]
for row in heights:
    for j in row:
        print(j,end=" ")
    print("")

plt.imshow(heights, cmap='gray')
plt.savefig(f"../noise/{t}noise.png")