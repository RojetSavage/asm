@TIMER - dumb timer
@r2=number of loops

.global TIMER
.global TIMER_autoSetup

TIMER:
  wait1$:
    sub r2,#1
    cmp r2,#0
    bne wait1$
bx lr


TIMER_autoSetup:
    mov r2,#0xFF00000
    orr r2, #0x00FF00
    orr r2, #0x00000FF
    push {lr}
    bl TIMER
    pop {lr}
bx lr