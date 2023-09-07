def dict_sum (dict):
    ans = 0

    for (key, val) in dict.items():
        ans += val + key

    return ans