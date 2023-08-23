def add_lists(lst1, lst2):
    ans = []

    i = 0

    while i < len(lst1) and i < len(lst2):
        word = lst1[i] + lst2[i]

        ans.append(word)
        i += 1

    while i < len(lst1):
        ans.append(lst1[i])
        i += 1

    while i < len(lst2):
        ans.append(lst2[i])
        i += 1

    return ans

l1 = ["M", "na", "i", "Ke", "1"]
l2 = ["y", "me", "s", "lly"]

result = add_lists(l1, l2)
print(result)
