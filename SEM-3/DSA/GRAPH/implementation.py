from typing import List

class Graph:
  def __init__(self):
    self.graph = {}
    

  def add(self, src, item):
    if src not in self.graph:
      self.graph[src] = []

    self.graph[src].append(item)

  def BFS(self, src):
    visited = {item : False for item in self.graph}

    queue = []

    queue.append(src)
    visited[src] = True
    ans = []

    while queue:
      s = queue.pop(0)
      ans.append(s)

      for i in self.graph[s]:
        if not visited[i]:
          queue.append(i)
          visited[i] = True
    
    return ans
  
  def DFS(self, src):
    visited = {item : False for item in self.graph}

    stack = []

    stack.append(src)
    visited[src] = True
    ans = []

    while stack:
      s = stack.pop()
      ans.append(s)

      for i in self.graph[s]:
        if not visited[i]:
          stack.append(i)
          visited[i] = True
    
    return ans
  
  def shortest_path(self, src, dest):
    visited = {item: False for item in self.graph}
    parent = {}
    parent[src] = -1

    queue = []
    queue.append(src)
    visited[src] = True

    while queue:
      front = queue.pop(0)

      for i in self.graph[front]:
        if not visited[i]:
          visited[i] = True
          parent[i] = front
          queue.append(i)
  
    # return parent

    # temp = parent[dest]
    ans = []
    ans.append(dest)

    while dest != src:
      temp = parent[dest]
      ans.append(temp)
      dest = temp

    print(ans) 

    


if __name__ == '__main__':
  test = Graph()
  test.add(0, 1)
  test.add(0, 2)
  test.add(1, 0)
  test.add(1, 2)
  test.add(1, 3)
  test.add(2, 0)
  test.add(2, 1)
  test.add(2, 4)
  test.add(3, 1)
  test.add(3, 4)
  test.add(4, 2)
  test.add(4, 3)

  print(test.BFS(0))
  print(test.DFS(0))
  print(test.shortest_path(0, 3))