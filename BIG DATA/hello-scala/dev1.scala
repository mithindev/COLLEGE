object MatrixOperations {
  def main(args: Array[String]): Unit = {

    val matrix1: Array[Array[Int]] = Array(
      Array(1, 2, 3),
      Array(4, 5, 6),
      Array(7, 8, 9)
    )

    val matrix2: Array[Array[Int]] = Array(
      Array(9, 8, 7),
      Array(6, 5, 4),
      Array(3, 2, 1)
    )

    val matrix3: Array[Array[Int]] = Array(
      Array(1, 1, 1),
      Array(2, 2, 2),
      Array(3, 3, 3)
    )

    def addMatrices(m1: Array[Array[Int]], m2: Array[Array[Int]], m3: Array[Array[Int]]): Array[Array[Int]] = {
      val rows = m1.length
      val cols = m1(0).length
      val result = Array.ofDim[Int](rows, cols)

      for (i <- 0 until rows; j <- 0 until cols) {
        result(i)(j) = m1(i)(j) + m2(i)(j) + m3(i)(j)
      }
      result
    }

    val resultMatrix = addMatrices(matrix1, matrix2, matrix3)

    println("Matrix 1:")
    printMatrix(matrix1)
    println("\nMatrix 2:")
    printMatrix(matrix2)
    println("\nMatrix 3:")
    printMatrix(matrix3)
    println("\nResult of addition:")
    printMatrix(resultMatrix)
  }


  def printMatrix(matrix: Array[Array[Int]]): Unit = {
    matrix.foreach(row => println(row.mkString(" ")))
  }
}
