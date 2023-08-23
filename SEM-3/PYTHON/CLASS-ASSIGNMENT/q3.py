import sys

def minimum(lst):
    ans = sys.maxsize
    for item in lst:
        if (item < ans):
            ans = item          

    return ans

lst = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

print(lst)

ans = minimum(lst)

print (ans)