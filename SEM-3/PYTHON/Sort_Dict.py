d = {'1':'a', '2':'b', '3':'c', '4':'d', '5':'e'}

key = list(d)

for i in range(len(key)):
    for j in range(1,len(key)):
        if (d.get(j) >= d.get(j - 1)):
            temp = d.get(j)
            d.update(j,
