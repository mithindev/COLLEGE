def isPresent(lst, target):
    for item in lst:
        if (item == target):
            return True

    return False

lst = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

print(lst)

ans = isPresent(lst)

print (ans)

    