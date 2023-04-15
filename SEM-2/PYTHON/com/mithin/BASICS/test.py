def push(list, element):
    list.append(element)

list = [1, 2, 3, 4]

push(list, 5)

print(list)

def update_dict (dictionary, key, value):
    dictionary[key] = value

dictionary = {
    'a' : 1,
    'b' : 2,
    'c' : 3
}

update_dict(dictionary, 'b', 10)
print(dictionary)