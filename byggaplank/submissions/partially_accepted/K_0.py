#!/usr/bin/python3


# rewritten from: https://www.geeksforgeeks.org/largest-rectangular-area-in-a-histogram-using-stack/
N, K = map(int, input().split()) # K = 0
h = list(map(int, input().split()))

stack = [-1] # Virtual board with height -∞ and x-coordinate -1
max_area = 0

i = 0
while i < N:
    if len(stack) == 1 or h[i] >= h[stack[-1]]:
        stack.append(i)
        i += 1
    else: # stack[-1] > h[i]
        # area of rectangle with stack[-1] == top as hanging point
        top = stack.pop()
        max_area = max(max_area, h[top] * (i - stack[-1] - 1))

# same as group 2 but with K = 0
while len(stack) > 1:
    top = stack.pop()
    max_area = max(max_area, h[top] * (N - stack[-1] - 1))

print(max_area)
