def pattern_search(str, pattern):
  n = len(str)
  m = len(pattern)

  i = 0
  j = m - 1

  while (j < n):
    if (str[i:j + 1] == pattern):
      return True
    else:
      i += 1
      j += 1
  
  return False

print(pattern_search('mithindev', 'dev'))
