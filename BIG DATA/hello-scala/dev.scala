object ArrayConversion {
  def main(args: Array[String]): Unit = {
    val singleDimArray = Array(1, 2, 3, 4, 5, 6)

    val rows = 2
    val cols = 3
    val multiDimArray = Array.ofDim[Int](rows, cols)

    for (i <- singleDimArray.indices) {
      multiDimArray(i / cols)(i % cols) = singleDimArray(i)
    }

    println("Multi-dimensional array without function:")
    println(multiDimArray.map(_.mkString(" ")).mkString("\n"))

    def convertToMultiDim(array: Array[Int], rows: Int, cols: Int): Array[Array[Int]] = {
      val multiDimArray = Array.ofDim[Int](rows, cols)
      for (i <- array.indices) {
        multiDimArray(i / cols)(i % cols) = array(i)
      }
      multiDimArray
    }

    val multiDimArrayFunc = convertToMultiDim(singleDimArray, rows, cols)

    println("\nMulti-dimensional array with function:")
    println(multiDimArrayFunc.map(_.mkString(" ")).mkString("\n"))
  }
}


