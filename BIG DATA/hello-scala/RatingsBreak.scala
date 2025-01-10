import java.io.{BufferedWriter, File, FileWriter}
import scala.util.Random

object DatasetGeneratorAndMapReduce {
  def main(args: Array[String]): Unit = {
    val random = new Random()
    val numRows = 20
    val inputFileName = "random_dataset.txt"
    val outputFileName = "mapreduce_output.txt"

    // Function to generate random data
    def randomRow(): String = {
      val column1 = Seq("A", "B", "C", "D")(random.nextInt(4))
      val column2 = random.nextInt(9) + 1 // Random integer between 1 and 9
      val column3 = Seq("X", "Y", "Z")(random.nextInt(3))
      val column4 = "%.6f".format(random.nextDouble()) // Random float
      s"$column1,$column2,$column3,$column4"
    }

    // Generate the dataset with some overlap
    val dataset = (1 to numRows).map(_ => randomRow()).toArray
    val overlappingIndices = (1 to 5).map(_ => random.nextInt(numRows)).toSet
    overlappingIndices.foreach { idx =>
      dataset(random.nextInt(numRows)) = dataset(idx)
    }

    // Write the dataset to a file
    writeToFile(inputFileName, dataset, Some("Column1,Column2,Column3,Column4"))

    // Perform MapReduce: Count occurrences of unique (Column1, Column3) pairs
    val keyValuePairs = dataset.map { row =>
      val cols = row.split(",")
      ((cols(0), cols(2)), 1) // Key: (Column1, Column3), Value: 1
    }

    // Shuffle and reduce
    val reducedResults = keyValuePairs
      .groupBy(_._1) // Group by key
      .map { case (key, values) =>
        (key, values.map(_._2).sum) // Sum the values
      }

    // Prepare MapReduce output for saving
    val mapReduceOutput = reducedResults.map { case (key, count) =>
      s"${key._1}-${key._2},$count"
    }.toArray

    // Save the MapReduce result to another file
    writeToFile(outputFileName, mapReduceOutput, Some("Key,Count"))

    println(s"Dataset saved to $inputFileName")
    println(s"MapReduce results saved to $outputFileName")
  }

  // Helper function to write data to a file
  def writeToFile(fileName: String, data: Array[String], header: Option[String] = None): Unit = {
    val file = new File(fileName)
    val bw = new BufferedWriter(new FileWriter(file))
    try {
      header.foreach(h => bw.write(h + "\n")) // Write header if present
      data.foreach(line => bw.write(line + "\n"))
    } finally {
      bw.close()
    }
  }
}