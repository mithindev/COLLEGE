def odd_even (lst):
    odd = []
    even = []

    for item in lst:
        if item%2 == 0:
            even.append(item)
        else:
            odd.append(item)