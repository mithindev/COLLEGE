def distribute(n):
    count = 0

    for x in range(n + 1):
        for y in range(n + 1):
            z = n - x - y
            if z >= 0:
                count += 1
                print(f"{x} + {y} + {z} == {n}")

    return count

print(distribute(10))
