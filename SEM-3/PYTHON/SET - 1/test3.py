from typing import List

# class Solution:
#     def checkValid(self, matrix: List[List[int]]) -> bool:
#         n = len(matrix)
#         checkSet = set(i for i in range(1, n))

#         for row in matrix:
#             if set(row) != checkSet:
#                 return False
        
#         for col in range(n):
#             lst = set()
#             for row in range(n):
#                 lst.insert(matrix[row][col])
            
#             if lst != checkSet:
#                 return False
        
#         return True


class Solution:
    def eliminateMaximum(self, dist: List[int], speed: List[int]) -> int:
        n = len(dist)
        time = [dist[i] / speed[i] for i in range (len(dist))]
        time.sort()

        # count = 1
        
        # for i in range (1, n):
        #     if time[i] == time[i - 1]:
        #         # count += 1
        #         return count
            
        #     else:
        #         count += 1
        
        # return count

        t = 1

        for i in time[1:]:
            if t >= i:
                return t
            
            t += 1
        
        return t

solution = Solution()
print(solution.eliminateMaximum([3,5,7,4,5], [2,3,6,3,2]))