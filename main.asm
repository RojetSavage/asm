
.text
.global	_start

_start:
    @mov sp,#0xFFFFFFFF     //Make Space on The Stack  

    bl TEST_ARRAY_CONTAINS      
    bl TIMER_autoSetup

    bl TEST_ARRAY_SUM          
    bl TIMER_autoSetup

    bl TEST_ARRAY_MAX 
    bl TIMER_autoSetup      

    bl TEST_ARRAY_MIN         
    bl TIMER_autoSetup

    bl TEST_MATH_MODULO        
    bl TIMER_autoSetup

    bl TEST_MATH_ISPERFECTSQUARE
    bl TIMER_autoSetup      

    
    wait:
    b wait

mov	r0, #0		@ return code 
mov	r7, #248	@ exit 
svc	#0