

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

seed = int(cmdlinearg('seed', cmdlinearg("tc")))
random.seed(seed)

rows = int(cmdlinearg("r"))
cols = int(cmdlinearg("c"))
t = int(cmdlinearg("tc"))
maxv = int(cmdlinearg("maxv", 1000))
n = int(cmdlinearg("n"))
round_thresh = float(cmdlinearg("roundthresh", 0.5))
bandsz = float(cmdlinearg("bandsz", 0))

class NoiseData:
    i = 0

    def __init__(self, scale: float, mul: float) -> None:
        global rows
        global cols

        self.mul = mul
        self.scale = scale / 100.0

        self.noise = PerlinNoise(octaves=1, seed=seed+NoiseData.i)
        NoiseData.i += 1

noise_dict = {
    "smooth": (maxv,[NoiseData(8,0.55),NoiseData(15, 0.3),NoiseData(30,0.15)]),
    "spikey": (maxv,[NoiseData(5,0.15),NoiseData(20, 0.2),NoiseData(70,0.65)]),
    "binary": (1, [NoiseData(4, 0.6), NoiseData(7, 0.4)]),
    "olle": (maxv, [])
}

base_noise = noise_dict[cmdlinearg("noise")] # type: tuple[int, list[NoiseData]]

print(t)
print(rows, cols, n)

def query_noise(r: int, c: int) -> int:
    global base_noise

    if cmdlinearg("noise")=="olle":
        return 0

    val = 0
    for noise in base_noise[1]:
        val += noise.noise([r * noise.scale, c * noise.scale]) * noise.mul

    val = val / (math.sqrt(2) / 2)
    val = val / 2 + 0.5

    band_dir = -1 if val <= 0.5 else 1
    val = bandsz / 2 + val * (1 - bandsz)
    val += band_dir * bandsz / 2

    val *= base_noise[0]

    #print(base)
    return min(math.floor(val + round_thresh), maxv)


heights = [[query_noise(r, c) for c in range(cols)] for r in range(rows)]
if cmdlinearg("noise") == "olle":
    f = open("olletc.txt")

    olles = [r.split(" ") for r in f.readlines()]
    for r, row in enumerate(olles):
        for c, val in enumerate(row[:-1]):
            heights[r][c] += int(val)


for row in heights:
    for i in row:
        print(i, end=" ")
    print("")

plt.imshow(heights, cmap='gray')
plt.savefig(f"../noise/{t}noise.png")