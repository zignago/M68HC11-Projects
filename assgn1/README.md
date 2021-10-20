CS3280/ECE3280
LAB Assignment #1			
Due date: Friday, September 17, before 2:00 pm (no late submission accepted)

Download the Wookie IDE from the Canvas page ("Software" Module). Copy the following assembly language programming example into a text file named ASSGN1.ASM (make sure to maintain the exact layout, including the initial tab before each instruction).


********************************************

* Program Description: This program will add data1 and data3 and subtract data2 


                                Table to be filled out
       Step    |    PC         |   Register A |   Memory $B003 |   NZVC    |
       1       |                  |                     |                              |                  |
       2       |                  |                     |                              |                  |
       3       |                  |                     |                              |                  |
       4       |                  |                     |                              |                  |

********************************************
* data location starts at $B000
		ORG		$B000
DATA1	FCB     	10		declare 1-byte variable DATA1 and initialize it with 10
DATA2	FCB     	15		declare 1-byte variable DATA2 and initialize it with 15
DATA3	FCB     	$1A		declare 1-byte variable DATA3 and initialize it with $1A
RESULT	RMB     	1     		declare 1-byte variable RESULT

* main program starts at $C000
       		ORG     	$C000

		LDAA    	DATA1   	load A with DATA1
       		SUBA    	DATA2   	subtract DATA2 from A
       		ADDA    	DATA3   	add DATA3 to A
 		STAA    	RESULT	store A in RESULT
   		STOP		stops the processor
       	 	END                    	Tells the Assembler that we’re done

 
Expand on documentation in the program header (add your name, student ID#, date, etc, at the beginning). Load it into Wookie, assemble it, and single-step through the program. Complete the table given in the header of this .asm file by filling in the contents of the PC, register A, memory cell $B003, and flags NZVC after the fetch and execution of each instruction. Thus, the table should have 4 rows, one for each instruction (excluding the final STOP instruction). 

For an introduction on how to assemble and simulate a program, please read the "Software Tutorial" in the Canvas “Software” Module.

Notes: 
1.	“ORG $C000” sets the starting address for the block that follows that ORG statement to $C000
2.	“RESULT RMB 1” declares a 1-byte RESULT variable (i.e., int RESULT; )
3.	“ DATA1 FCB 10” declares a 1-bye DATA1 variable and initializes the variable with 10  (i.e., int DATA1 = 10; )
4.	You have to record the values of 4 flags (NZVC) that are all stored in the condition code register (CCR). You already know the C and V flags. The N and the Z flags are new. The N flag signals if a result is negative, while the Z flag signals if a result is zero. 
