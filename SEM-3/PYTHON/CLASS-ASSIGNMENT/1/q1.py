def interchange(lst):
    temp = lst[0]
    lst[0] = lst[len(lst) - 1]
    lst[len(lst) - 1] = temp

    return lst

lst = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

print(lst)

ans = interchange(lst)

print (ans)

    