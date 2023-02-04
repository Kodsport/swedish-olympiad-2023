n = int(input())
print("graph \"\" {")
for _ in range(n-1):
    a,b,w = map(int, input().split())
    print(f"{a} -- {b}")
print("}")
