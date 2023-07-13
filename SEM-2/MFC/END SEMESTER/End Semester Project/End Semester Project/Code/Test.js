// Page Rank Algorithm
// Define the link matrix as a 2D array
var linkMatrix = 
[  
  [0, 1, 0, 1, 1],
  [0, 0, 1, 1, 1],
  [0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0],
  [1, 0, 0, 1, 0]
];
// Define the number of pages
var numPages = linkMatrix.length;

// Define the damping factor
var dampingFactor = 0.85;

// Define the PageRank vector
var pageRank = [];

// Initialize the PageRank vector to a uniform distribution
for (var i = 0; i < numPages; i++) {
  pageRank[i] = 1 / numPages;
}

// Iterate the PageRank algorithm until convergence
var convergence = false;
while (!convergence) {
  // Store the previous PageRank vector
  var previousPageRank = pageRank.slice();

  // Update the PageRank vector
  for (var i = 0; i < numPages; i++) {
    pageRank[i] = (1 - dampingFactor) / numPages;
    for (var j = 0; j < numPages; j++) {
      if (linkMatrix[j][i] === 1) {
        pageRank[i] += dampingFactor * previousPageRank[j] /
          numLinks(linkMatrix[j]);
      }
    }
  }

  // Check for convergence
  convergence = isConverged(previousPageRank, pageRank);
}

// Print the PageRank vector
console.log("Page Rank Algorithm");
console.log("Matrix A : ");
console.log(linkMatrix);
console.log("Probabilities :");
console.log(pageRank);
// Printing the  Rank of the Pages using PageRank vector
console.log("Rank :")
console.log(rankArray(pageRank));
// Function to count the number of outgoing links from a page
function numLinks(page) {
  var count = 0;
  for (var i = 0; i < page.length; i++) {
    count += page[i];
  }
  return count;
}

// Function to check for convergence of the PageRank vector
function isConverged(previous, current) {
  var threshold = 0.0001;
  for (var i = 0; i < previous.length; i++) {
    if (Math.abs(previous[i] - current[i]) > threshold) {
      return false;
    }
  }
  return true;
}

function rankArray(arr) {
  let sortedArr = [...arr].sort((a, b) => b-a);
  let ranks = arr.map(val => sortedArr.indexOf(val) + 1);
  return ranks;
}