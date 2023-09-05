def compliment (DNA):
  DNA_base = {
    "A":"T",
    "T": "A",
    "C": "G",
    "G": "C"
  }

  ans = " "

  for n in DNA:
    ans += DNA_base[n]

  return ans

if __name__ == "__main__":
  f = open("DNA_primary_strand.txt")
  DNA = f.read()

  print(compliment(DNA)[::-1])

  f.close()


  