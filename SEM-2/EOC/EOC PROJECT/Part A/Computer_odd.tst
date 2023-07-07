// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/05/ComputerAdd-external.tst

load Computer.hdl,
output-file Computerevenodd.out,
compare-to Computerevenodd.cmp,
output-list time%S1.4.1 reset%B2.1.2 RAM16K[0]%D1.7.1 RAM16K[1]%D1.7.1;

// Load a program written in the Hack machine language.
// The program adds the two constants 2 and 3 and writes the result in RAM[0]. 
ROM32K load evenodd.hack,
output;
set RAM16K[0] 5,

// First run (at the beginning PC=0)
repeat 25 {
    tick, tock, output;
}

// Reset the PC
set reset 1,
set RAM16K[0] 0,
set RAM16K[1] 0,
tick, tock, output;

