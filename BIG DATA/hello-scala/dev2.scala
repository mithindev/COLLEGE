object StringMethodsDemo {
  def main(args: Array[String]): Unit = {
    // Demonstrate equals method
    def demonstrateEquals(str1: String, str2: String): Unit = {
      if (str1.equals(str2)) {
        println(s""""$str1" equals "$str2"""")
      } else {
        println(s""""$str1" does not equal "$str2"""")
      }
    }

    // Demonstrate compareTo method
    def demonstrateCompareTo(str1: String, str2: String): Unit = {
      val comparison = str1.compareTo(str2)
      if (comparison == 0) {
        println(s""""$str1" is equal to "$str2"""")
      } else if (comparison < 0) {
        println(s""""$str1" comes before "$str2"""")
      } else {
        println(s""""$str1" comes after "$str2"""")
      }
    }

    // Demonstrate concat method
    def demonstrateConcat(str1: String, str2: String): Unit = {
      val concatenatedString = str1.concat(str2)
      println(s"Concatenation of \"$str1\" and \"$str2\" is: \"$concatenatedString\"")
    }

    // Demonstrate substring method
    def demonstrateSubstring(str: String, start: Int, end: Int): Unit = {
      val substring = str.substring(start, end)
      println(s"Substring of \"$str\" from index $start to $end is: \"$substring\"")
    }

    // Test the functions
    val string1 = "Hello"
    val string2 = "World"
    val string3 = "Hello"

    println("Testing equals method:")
    demonstrateEquals(string1, string2)
    demonstrateEquals(string1, string3)

    println("\nTesting compareTo method:")
    demonstrateCompareTo(string1, string2)
    demonstrateCompareTo(string1, string3)

    println("\nTesting concat method:")
    demonstrateConcat(string1, string2)

    println("\nTesting substring method:")
    demonstrateSubstring(string1, 1, 4)
  }
}
