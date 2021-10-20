**************************************
*
* Name: Gian Zignago
* ID:   12567832
* Date: 9/29/2021
* Lab2
*
* Program description:
*
* multiply two 1-byte numbers, NUM1 and NUM2, 
* by adding NUM1 to itself NUM2 times.
*
* Pseudocode:
*
* int NUM1=255;
* int NUM2=255;
*
* unsigned int result;
* unsigned int count;
*   
*    count=0;
*    result=0;
*    while(count<NUM2){
*    result+=NUM1;
*    count++;
*    }
*
**************************************

	ORG $B000
NUM1	FCB	255		
NUM2	FCB	255

	ORG $B010
RESULT	RMB	2	product of NUM1*NUM2 stored in RESULT at program termination
COUNT		RMB	1	counter cannot be greater than NUM1 or NUM2, so it is 1 byte.

	ORG $C000
	CLR 	COUNT		set counter to $00
	CLR	RESULT	set first byte of RESULT to $00
	CLR	RESULT+1	set second byte of RESULT to $00
WHILE LDAA	COUNT		start of while loop
	CMPA	NUM2		compare counter value with NUM2
	BHS	ENDWHLE	if counter >= NUM2, break loop
	CLRA			clear counter from A to make space for casting 
	LDAB	NUM1		cast NUM1 as 2-byte variable
	ADDD	RESULT	fills D register with RESULT
	STD	RESULT	add NUM1 to RESULT
	INC 	COUNT		increment the loop counter
	BRA 	WHILE		return to while condition at loop body end
ENDWHLE	STOP		terminate program at loop end
