d = {'1':'e', '3':'c', '2':'d', '4':'b', '5':'a'}

lst = list(d.values())

for i in range(len(lst)):
    for j in range(1, len(lst)):
        if lst[j] <= lst[j - 1]:
            temp = lst[j]
            lst[j] = lst[j - 1]
            lst[j - 1] = temp

k = list(d.keys())
print(k)

temp = 0

for i in k:
    d[i] = lst[temp]
    temp += 1

print(d)

# Qn - 2

# d = {'1':'e', '3':'c', '2':'d', '4':'b', '5':'a'}

# lst = list(d.items())

# print(lst)

# print(lst[0][1])

# for i in range(len(lst)):
#     for j in range(1, len(lst)):
#         if lst[j][1] <= lst[j - 1][1]:

#             temp = lst[j]
#             lst[j] = lst[j - 1]
#             lst[j - 1] = temp

# ans = dict(lst)

# print(ans)
