// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(CHECK)
	@i
	M=0
	@24576
	D=M
	@FILL
	D;JGT
	@CLEAR
	0;JMP
(CLEAR)
	@8192 		//Filled?
	D=A
	@i
	A=M
	D=A-D
	@CHECK
	D;JGE
	@i 		//Whiten
	D=M
	@SCREEN
	A=A+D
	M=0
	@i 		//Inc
	M=M+1
	@CLEAR
	0;JMP
(FILL)
	@8192 		//Filled?
	D=A
	@i
	A=M
	D=A-D
	@CHECK
	D;JGE
	@i 		//Blacken
	D=M
	@SCREEN
	A=A+D
	M=-1
	@i 		//Inc
	M=M+1
	@FILL
	0;JMP
