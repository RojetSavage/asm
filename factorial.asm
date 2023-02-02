.global FACTORIAL

FACTORIAL:
sub r1,r1,#1
cmp r1,#1
beq EXIT
mul r0,r1,r0
push {r1,lr}
 @push onto the stack without changing the stack pointer
bl FACTORIAL	  @call FACTORIAL
EXIT:
pop {r1,pc}  @pop off the stack
bx lr	@RETURN
