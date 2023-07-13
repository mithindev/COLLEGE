const dampingFactor = 0.85;

function pageRank(graph) {
  const numPages = graph.length;
  const initialPR = Array(numPages).fill(1 / numPages);
  let currentPR = [...initialPR];
  let nextPR = [...initialPR];

  for (let i = 0; i < 10; i++) {
    for (let j = 0; j < numPages; j++) {
      nextPR[j] = (1 - dampingFactor) / numPages;
      for (let k = 0; k < numPages; k++) {
        if (graph[k][j]) {
          nextPR[j] += dampingFactor * currentPR[k] / graph[k].reduce((a, b) => a + b, 0);
        }
      }
    }
    currentPR = [...nextPR];
  }

  return currentPR;
}

const graph = [  [0, 1, 1, 0],
  [1, 0, 1, 1],
  [1, 1, 0, 1],
  [0, 1, 1, 0],
];

const pageRanks = pageRank(graph);
console.log(pageRanks);
