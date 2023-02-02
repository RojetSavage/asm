/* Math Methods */
.global Math.isPerfectSquare
.global Math.Modulo
.global Math.Exponent
.global Math.Fibonacci


Math.Fibonacci:
	@param r0 - number in sequence to calculate
	@param r1 - return value
	
	@r3 - store n-2th value
	@r4 - store n-1th value
	@r5 - store n

	mov r3, #1
	mov r4, #1
	
	cmp r0, #1	//if n = 1 or 2- goto basecase
	beq fibBaseCase
	cmp r0, #2	//if n = 1 or 2- goto basecase
	beq fibBaseCase

	sub r0, #2		//set 2nd iteration 	
	sub r0,r0,#1	//minus 1 each iteration e.g 3 by the first time.	
	add r5, r4, r3		

	fibLoop:
		ldr r3, [r4]
		ldr r4, [r5]
		add r5, r3, r4		
		
		sub r0, #1	//decrement count
		cmp r0, #0
		beq fibExit
	b fibloop	

	fibBaseCase:
	mov r1, #1	
	
	fibExit:

br lx 


/* Returns 1 if value is perfect square, 0 if not */
Math.isPerfectSquare:
@r0	- value
@r1	- return value (if value is a perfect square)

    mov r2, #1		//checks for value of 1
    mul r3, r2, r2
    cmp r3, r0
    beq true

    perfectSquareLoop:
        add r2, r2, #1
        mul r3, r2, r2
        cmp r3, r0
        beq true		
        bgt false		//if we exceed the value it's not a perfect square	
    blt perfectSquareLoop			//if we've not exceeded the value

    true:
    mov r1, #1
    b perfectSquareExit

    false:
    mov r1, #0
    b perfectSquareExit

    perfectSquareExit:

bx lr


Math.Modulo:
    @r0	- value     5
    @r1	- divisor   6
    @r2	- remainder after division

    cmp r1, r0			//base case. divisor greater than value
    bgt moduloBaseCase

    moduloLoop:
        sub r0, r0, r1	//subtract divisor from value
        cmp r0, r1
    beq moduloLoop	
    bgt moduloLoop
    
    mov r2, r0      	//return remainder after value is smaller than divisor
    b moduloExit

    moduloBaseCase:
        mov r2, r0		//no division possible. Return value
        b moduloExit

    moduloExit:
bx lr



/* Performs basic exponentiation. Returns value */
Math.Exponent:
    @r0	-	value
    @r1	-	exponent	
    @r2	-	return value

    mul r2, r1, r0
bx lr


/* Performs basic n^2 operation. Returns value */
Math.Square:
    @r0	-	value
    @r1	-	return value

    mul r1, r0, r0
bx lr
