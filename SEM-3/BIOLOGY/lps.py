def lps (pattern):
  l = len(pattern)
  ans = [0 for i in range(l)]

  for i in range(l):
    length = 0

    prefix = pattern[i]

    for i in pattern[i:]:
      if i == prefix:
        
