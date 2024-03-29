/* Library of Array Methods */

.global ARRAY_CONTAINS
.global ARRAY_SUM
.global ARRAY_MIN
.global ARRAY_MAX


/* Searches array for value, returns 1 if found, 0 if not */
ARRAY_CONTAINS:	
    @r0	-	pointer to array
    @r1	-	len of array
    @r2	-	search value
    @r3	-	returns 1 if true, 0 if false

    mov r4, #0				//init array offset
    ldr r5, [r0, r4]		//init current value

    cmp r5, r2				//compare current value to search term
    beq found

    cmp r1, #1				//exit if array length is 1
    beq notFound

    add r4, #4				//increment index array
    sub r1, r1, #1	

    containsLoop:
        ldr r5, [r0, r4]	//grab next value
        cmp r5, r2
        beq found
        
        add r4, #4			//increment index array	
        sub r1, r1, #1		//decrement count of loop
        cmp r1, #0
    bne containsLoop
    b notFound

    found:
    mov r3, #1
    b exit

    notFound:
    mov r3, #0
    b exit

    exit:
bx lr



/* Returns the sum of an array */
ARRAY_SUM:
    @r0	-	pointer to array
    @r1	-	length of array
    @r2	-	returns value

    mov r4, #0				//init array offset
    ldr r2, [r0, r4]		//init current sum

    cmp r1, #1				//exit if array length is 1
    beq sumBaseCaseExit

    add r4, #4				//increment index array	
    sub r1, r1, #1
    sumLoop:
        ldr r3, [r0, r4]	//get next value
        add r2, r2, r3		//add 

        add r4, #4			//increment index array	
        sub r1, r1, #1		//decrement count of loop
        cmp r1, #0
    bne sumLoop

    sumBaseCaseExit:
bx lr


/* Returns the minimum number in an array */
ARRAY_MIN:
    @r0	- pointer to array
    @r1	- len of array
    @r2	- return value

    mov r4, #0				//init array offset
    ldr r2, [r0, r4]		//init current smallest value

    cmp r1, #1				//exit if array length is 1
    beq minBaseCaseExit

    sub r1, r1, #1
    add r4, #4
    loop:
        ldr r3, [r0, r4]	//grab current value
        cmp r3, r2			//compare current vs current smallest

        bgt minNextIteration
        
        ldr r2, [r0, r4]	//set new smallest value
                
        minNextIteration:
        add r4, #4			//increment index array	
        sub r1, r1, #1		//decrement count of loop
        cmp r1, #0
    bne loop

    minBaseCaseExit:
bx lr





/* Returns the maximum number in an array */
ARRAY_MAX:
    @r0	- pointer to array
    @r1	- len of array
    @r2	- returns value

    mov r4, #0				//init array offset
    ldr r2, [r0, r4]		//init current largest value

    cmp r1, #1				//exit if array length is 1
    beq maxBaseCaseExit

    sub r1, r1, #1
    add r4, #4
    maxLoop:
        ldr r3, [r0, r4]	//grab current value
        cmp r2, r3			//compare current vs current smallest

        bgt maxNextIteration
        
        ldr r2, [r0, r4]	//set new largest value
                
        maxNextIteration:
        add r4, #4			//increment index array	
        sub r1, r1, #1		//decrement count of loop
        cmp r1, #0
    bne maxLoop

    maxBaseCaseExit:
bx lr


