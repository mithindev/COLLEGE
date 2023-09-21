def lps (pattern):
  l = len(pattern)

  ans = [0 for i in range(l)]

  for i in range(l):

    prefix = pattern[:i + 1]

    for j in range(i + 1,l):
      if prefix == pattern[j:j + len(prefix)]:
        # ans[j:j + len(prefix)] = [t in range(j:j + len(prefix)]
        ans[j:j + len(prefix)] = list(range(1, len(prefix) + 1))

  return ans
      

print(lps('abcdabaabc'))
        
