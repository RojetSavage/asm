@TIMER - dumb timer
@r2=number of loops

.global TIMER

TIMER:
  wait1$:
    sub r2,#1
    cmp r2,#0
    bne wait1$
bx lr
