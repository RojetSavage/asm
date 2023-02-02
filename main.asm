
.text
.global	_start

_start:
    @mov sp,#0xFFFFFFFF     //Make Space on The Stack
    //ldr r1, =myArray
    //ldr r8, [r1, #20]

    

    //Test Array.Contains
    //ldr r0, =myArray
    //mov r1, #6
    //mov r2, #3
    //bl Array.Contains
    //push {r3}
    //bl _SETUP_LED
    //pop {r1}
    //bleq _FLASH

    //Test Array.Sum
    //ldr r0, =myArray
    //mov r1, #3
    //bl Array.Sum
    //push {r2}
    //bl _SETUP_LED
    //pop {r1}
    //bleq _FLASH

    //Test Array.Min
    //ldr r0, =myArray
    //mov r1, #3
    //bl Array.Min
    //push {r2}
    //bl _SETUP_LED
    //pop {r1}
    //bleq _FLASH

    //Test Array.Max
    //ldr r0, =myArray
    //mov r1, #3
    //bl Array.Max
    //push {r2}
    //bl _SETUP_LED
    //pop {r1}
    //bleq _FLASH

    //Test Math.isPerfectSquare
    //mov r0, #16
    //bl Math.isPerfectSquare
    //push {r1}
    //bl _SETUP_LED
    //pop {r1}
    //bleq _FLASH   //bleq?? bl?

    //Test Math.Modulo
    //mov r0, #14
    //mov r1, #6
    //bl Math.Modulo
    //push {r2}
    //bl _SETUP_LED
    //pop {r1}
    //bl _FLASH

    wait:
    b wait
    


mov	r0, #0		@ return code 
mov	r7, #248	@ exit 
svc	#0


.data
myArray: .int 8,7,9
