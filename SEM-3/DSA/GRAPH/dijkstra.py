from typing import List
import sys

class Graph:
  def __init__(self):
    self.graph = {}

  def getMin(self, lst):
    min_val = sys.maxsize
    ans = []

    for i in lst:
      if i[0] < min_val:
        min_val = i[0]
        ans = i

    return ans    
  
  def add(self, src, item):
    if src not in self.graph:
      self.graph[src] = []

    self.graph[src].append(item)

  def shortest_path(self, src):
      distance = {item : sys.maxsize for item in self.graph}
      min_set = []

      min_set.append([0, src])

      while min_set:
        top = self.getMin(min_set)
        min_set.remove(top)

        dist = top[0]
        s = top[1]

        for i in self.graph[s]:
          if dist + i[1] < distance[i[0]]:
            if [distance[i[0]], i[0]] in min_set:
              min_set.remove([distance[i[0]], i[0]])
            distance[i[0]] = dist + i[1]
            
            min_set.append([dist + i[1], i[0]])

      distance[src] = 0
      return distance

  def prims(self, src):
    weight = {item : sys.maxsize for item in self.graph}
    msp = {item : False for item in self.graph}
    parent = {item : -1 for item in self.graph}

    weight[src] = 0
    msp[src] = True
    parent[src] = -1

    while False in msp.values():
      s = min(weight, key=weight.get)

      for i in self.graph[s]:
        if not msp[i[0]] and i[1] < weight[i[0]]:
          weight[i[0]] = i[1]
          msp[i[0]] = True
          parent[i[0]] = s
    
    return parent





if __name__ == '__main__':
  test = Graph()
  test.add(0, [1, 7])
  test.add(0, [2, 1])
  test.add(0, [3, 2])
  test.add(1, [0, 7])
  test.add(1, [2, 3])
  test.add(1, [3, 5])
  test.add(1, [4, 1])

  test.add(2, [0, 1])
  test.add(2, [1, 3])

  test.add(3, [0, 2])
  test.add(3, [1, 5])
  test.add(3, [4, 7])

  test.add(4, [1, 1])
  test.add(4, [3, 7])

  # print(test.shortest_path(0))
  print(test.prims(0))