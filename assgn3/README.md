# CS/ECE 3280 
## LAB Assignment #3 
### Due date: Friday, October 8, before 2:00 pm. 
*****************************************************
You are to design, write, assemble, and simulate an assembly language program which will calculate the
factorial N! of an unsigned 1-byte number N. 
The factorial of N is defined as: 0! = 1 and N! = 1*2*3* .. * (N-1) * N, for N > 0 
For example, for N=8, N! = 40320 = $9D80. 
One way to calculate N! is iteratively in N steps: 

	1. calculate 1! 
	2. calculate 2! = 1! *2 
	3. calculate 3! = 2! *3 
	4. calculate 4! = 3! *4 
	 …
	N. calculate N! = (N-1)! *N 
	
For this lab, N is a 1 byte number, while the result (N!) is stored as a 2-byte number in NFAC in BIG 
ENDIAN format. 
