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
          nextPR[j] += dampingFactor * currentPR[k] / graph[k].filter(link => link).length;
        }
      }
    }
    currentPR = [...nextPR];
  }

  return currentPR;
}

const numPages = parseInt(prompt("Enter the number of pages:"));
const graph = [];

for (let i = 0; i < numPages; i++) {
  const outgoingLinks = [];
  const incomingLinks = parseInt(prompt(`Enter the number of incoming links for page ${i + 1}:`));
  for (let j = 0; j < numPages; j++) {
    outgoingLinks.push(j < incomingLinks ? 1 : 0);
  }
  graph.push(outgoingLinks);
}

const pageRanks = pageRank(graph);
console.log(pageRanks);
