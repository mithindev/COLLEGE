d = {'1':'e', '2':'d', '3':'c', '4':'b', '5':'a'}

items = list(d.items())

print(items)

for i in range(len(items)):
    for j in range(1, len(items)):
        if items[j][1] <= items[j - 1][1]:

            temp = items[j]
            items[j] = items[j - 1]
            items[j - 1] = temp

sorted_dict = dict(items)

print(sorted_dict)