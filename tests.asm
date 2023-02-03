.global TEST_MATH_MODULO
.global TEST_MATH_ISPERFECTSQUARE
.global TEST_ARRAY_MAX
.global TEST_ARRAY_MIN
.global TEST_ARRAY_SUM
.global TEST_ARRAY_CONTAINS


TEST_ARRAY_CONTAINS:
    ldr r0, =containsTestArray
    ldr r1, =containsTestArrayLength      //length
    ldr r1, [r1]
    ldr r2, =containsTestSearchTerm
    ldr r2, [r2]
    push {lr}
    bl ARRAY_CONTAINS
    pop {lr}
    push {r3, lr}
    bl SETUP_LED
    pop {r1, lr}
    push {lr}
    bleq FLASH
    pop {lr}
bx lr 


TEST_ARRAY_SUM:
    ldr r0, =sumTestArray
    mov r1, #4
    push {lr}    
    bl ARRAY_SUM
    pop {lr}
    push {r2, lr}
    bl SETUP_LED
    pop {r1, lr}
    push {lr}
    bleq FLASH
    pop {lr}
bx lr


TEST_ARRAY_MIN:
    ldr r0, =minTestArray
    mov r1, #4
    push {lr}
    bl ARRAY_MIN
    pop {lr}
    push {r2}
    push {lr}
    bl SETUP_LED
    pop {lr}
    pop {r1}
    push {lr}
    bleq FLASH
    pop {lr}
bx lr


TEST_ARRAY_MAX:
    ldr r0, =maxTestArray
    mov r1, #4
    push {lr}
    bl ARRAY_MAX
    pop {lr}
    push {r2, lr}
    bl SETUP_LED
    pop {r1, lr}
    push {lr}
    bleq FLASH
    pop {lr}
bx lr
    
TEST_MATH_ISPERFECTSQUARE:
    ldr r0, =isPerfectSquareValue
    ldr r0, [r0]
    push {lr}
    bl MATH_ISPERFECTSQUARE
    pop {lr}
    push {r1}
    push {lr}
    bl SETUP_LED
    pop {lr}
    pop {r1}
    push {lr}
    bleq FLASH
    pop {lr}   
bx lr


TEST_MATH_MODULO:
    ldr r0, =moduloTestValue
    ldr r0, [r0]
    ldr r1, =moduloTestDivisor
    ldr r1, [r1]
    push {lr}
    bl MATH_MODULO
    pop {lr}
    push {r2}
    push {lr}
    bl SETUP_LED
    pop {lr}
    pop {r1}
    push {lr}
    bl FLASH
    pop {lr}
bx lr




.data
minTestArray: .int 4,1,5,3

maxTestArray: .int 4,1,5,3

sumTestArray: .int 2,1,3,2

containsTestArray: .int 4,6,2,1
containsTestArrayLength: .word 4
containsTestSearchTerm: .word 4

moduloTestValue: .word 14
moduloTestDivisor: .word 6

isPerfectSquareValue: .word 16