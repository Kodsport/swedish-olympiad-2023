#!/usr/bin/env python3
#
# Testing tool for the task Secret Tree.
#
# Usage:
#
#   python3 testing_tool.py [--silent] program... <input.txt
#
# input.txt uses the following format:
#
#   N
#   a_1 b_1 w_1
#   a_2 b_2 w_2
#   ...
#   a_{N-1} b_{N-1} w_{N-1}
#
# where the tree consists of the N-1 edges (a, b) (1 <= a, b <= n) of lengths w (w > 0).
#
# For example, if you have a Python solution that you would run using
# "python3 file.py", you could invoke the testing tool with:
#
#   python3 testing_tool.py python3 file.py < input.txt
#
# where input.txt is a file that contains e.g.
#
#   3
#   1 2 1
#   1 3 2
#
# If --silent is passed, the communication output will not be printed.
#
# The tool is provided as-is, and you should feel free to make
# whatever alterations or augmentations you like to it.
#

import subprocess
import sys

def error(msg):
    print("ERROR:", msg)
    sys.exit(1)

eds = []

def dfs1(at, seen):
    if at in seen:
        return
    seen.add(at)
    for x, _ in eds[at]:
        dfs1(x, seen)

def dfs2(root, at, par, dist, dist_to_ind):
    if dist in dist_to_ind:
        error(f"{at+1} and {dist_to_ind[dist]+1} have the same distance ({dist}) from {root+1}, this is not allowed")
    dist_to_ind[dist] = at
    for x, w in eds[at]:
        if x == par:
            continue
        dfs2(root, x, at, dist + w, dist_to_ind)

def dist_rec(a, b, par):
    if a == b:
        return 0
    for x, w in eds[a]:
        if x == par:
            continue
        d = dist_rec(x, b, a)
        if d != -1:
            return d + w
    return -1

def dist(a, b):
    return dist_rec(a, b, -1)

def main():
    global eds
    sys.setrecursionlimit(10000)
    silent = False
    args = sys.argv[1:]
    if args and args[0] == "--silent":
        args = args[1:]
        silent = True
    if not args or args == ["--help"] or args == ["-h"]:
        print("Usage:", sys.argv[0], "[--silent] program... <input.txt")
        sys.exit(0)

    edset = set()
    try:
        n = int(input())
    except Exception:
        error("bad input format: failed to parse first line as integer")
    eds = [[] for _ in range(n)]
    for i in range(n-1):
        try:
            line = input()
        except Exception:
            error("bad input format: too few lines")
        try:
            a, b, w = map(int, line.split())
        except Exception:
            error(f"bad input format: failed to parse line: {line} as three integers")
        if not 1 <= a <= n:
            error(f"node index {a} out of bounds")
        if not 1 <= b <= n:
            error(f"node index {b} out of bounds")
        if w <= 0:
            error(f"edge lengths must be positive, but {w} is not")
        edset.add((a, b))
        edset.add((b, a))
        a -= 1
        b -= 1
        eds[a].append((b, w))
        eds[b].append((a, w))

    seen = set()
    dfs1(0, seen)
    if len(seen) != n:
        error("graph is not a tree")

    for i in range(n):
        dfs2(i, i, -1, 0, {})

    proc = subprocess.Popen(args, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    proc.stdin.write(f"{n}\n".encode("utf8"))
    proc.stdin.flush()
    if not silent:
        print(f"[*] Running with N = {n}")
    queries = 0

    while True:
        line = proc.stdout.readline().decode("utf8")
        toks = line.split()
        if toks and toks[0] == "?":
            try:
                a, b, c = map(int, toks[1:])
                assert 1 <= a <= n
                assert 1 <= b <= n
                assert 1 <= c <= n
            except Exception:
                error("query node indices out of bounds")
            if a == b:
                print(f"[*] {a} {b} {c} => ERROR")
                error("a = b is not allowed!")
            da = dist(a-1, c-1)
            db = dist(b-1, c-1)
            assert da != db
            res = "A" if da < db else "B"
            if not silent:
                print(f"[*] {a} {b} {c} => {res}")
            proc.stdin.write(f"{res}\n".encode("utf8"))
            proc.stdin.flush()
            queries += 1
        elif toks and toks[0] == "!":
            break
        else:
            error(f"invalid query: {line}")

    for i in range(n-1):
        line = proc.stdout.readline().decode("utf8")
        a, b = map(int, line.split())
        if not 1 <= a <= n or not 1 <= b <= n:
            error("result node indices out of bounds")
        if (a, b) not in edset:
            error(f"Wrong Answer: guessed that the tree contained ({a}, {b}), but it did not")
        edset.remove((a, b))
        edset.remove((b, a))

    print("[*] OK, queries used:", queries)

if __name__ == "__main__":
    main()
