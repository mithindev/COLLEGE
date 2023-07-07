@R0
D=M          // Store the input integer in the D register

// Check if the integer is even or odd
@1
D=D&A        // Perform bitwise AND with 1 to check the least significant bit

@IS_EVEN     // Jump to the IS_EVEN label if the result is equal to 0
D;JEQ

// If the code reaches this point, the integer is odd
@R1
M=1          // Store 1 in R1 to indicate odd

@END         // Jump to the END label to terminate the program
0;JMP

(IS_EVEN)
// If the code reaches this point, the integer is even
@R1
M=0          // Store 0 in R1 to indicate even

(END)
@END
0;JMP
// Program terminatione