**************************************
*
* Name: Gian Zignago
* ID: 12567832
* Date: 10/8/2021
* Lab3
*
* Program description:
*
*   calculate the factorial of a 1-byte integer N using 
*   the multiplication algorithm implemented in Lab2.
*
* Pseudocode:
*
*   unsigned int N = 8;
*   int NFAC;
*   int count;
*
*   count = 1;
*   NFAC = 1;
*
*   while(count <= N) {
*       NFAC = NFAC * count;
*       count++;
*   }
*
**************************************

* start of data section

	ORG $B000
N	FCB	8		the number to take the factorial of


	ORG $B010
NFAC	RMB	2		Holds end factorial result at program termination (NFAC = N!)
COUNT RMB	1		Counter for factorial loop
ML_COUNT	RMB	1	Counter for multiplication loop
ML_RESULT	RMB	2	Carries result in multiplication loop

* start of program section

	ORG $C000
	CLR	COUNT		set counter to $00
	INC	COUNT		set counter to $01 to prevent multiplication by 0 in factorial loop
	CLR	NFAC		set first byte of NFAC to $00
	CLR	NFAC+1	set second byte of NFAC to $00
	INC	NFAC+1	set second byte of NFAC to $01 (If first byte were to be incremented instead, factorial equation would start at $0100 instead of $0001, leading to incorrect result)

WHILE	LDAA	COUNT		-- FACTORIAL (outer) LOOP -- 
	CMPA	N		compare current value of COUNT with N
	BHI	ENDWHLE	if count > N, break loop, ending factorial equation
	CLR	ML_COUNT		set ML_COUNT to $00
	CLR	ML_RESULT		set first byte of ML_RESULT to $00
	CLR	ML_RESULT+1		set second byte og ML_RESULT to $00

ML_WHILE	LDAA	ML_COUNT	-- MULTIPLICATION (inner) LOOP --
	CMPA	COUNT			compare current value of multiplication counter to factorial counter
	BHS	ML_ENDWHLE		if ML_COUNT >= Count, end multiplication
	LDD	ML_RESULT		load value of ML_RESULT into D register 
	ADDD	NFAC			add value of NFAC to D (value of NFAC not changed during ML loop)
	STD	ML_RESULT		store the value in D register in ML_RESULT variable
	INC	ML_COUNT		increment multiplication loop counter by 1
	BRA	ML_WHILE		return program execution to ML loop condition
ML_ENDWHLE

	CLR	NFAC			set NFAC to $0000
	CLR	NFAC+1
	LDD	ML_RESULT		load resulting value of above multiplication loop in D register 
	STD	NFAC			set NFAC equal to the value in D register
	INC	COUNT			increment factorial loop counter by 1
	BRA	WHILE			return to factorial loop condition case
ENDWHLE	STOP			terminate program at end of factorial loop

