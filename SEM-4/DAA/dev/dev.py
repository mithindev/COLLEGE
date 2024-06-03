class Solution:
    def appendCharacters(self, s: str, t: str) -> int:
        i, j = 0, 0
        n = len(s)
        m = len(t)

        while (i < n):
            if s[i] != t[j]:
                i += 1
            else:
                break

        while (i < n or j < m):
            if i < n and s[i] == t[j]:
                i += 1
                j += 1
            
            else:
                return m - j
            
        return 0

s = Solution()

print(s.appendCharacters("z", "abcde"))