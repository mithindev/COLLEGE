import math

def LCM2 (a, b):
  ans = a*b // math.gcd(a, b)
  return ans

def LCM3 (a, b, c):
  return LCM2(a, b) * c // math.gcd(LCM2(a, b) , c)

print(LCM3(2, 3, 6))








