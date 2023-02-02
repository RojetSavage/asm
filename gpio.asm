.global _SETUP_LED
.global _FLASH

_SETUP_LED:
	ldr	r0, =mem
	ldr	r1, =0x101002	/* O_RDWR | O_SYNC */
	mov	r7, #5		/* open */
	svc	#0
	mov	r4, r0		/* file descriptor */

	mov	r0, #0		/* kernel chooses address */
	mov	r1, #4096	/* map size */
	mov	r2, #3		/* PROT_READ | PROT_WRITE */
	mov	r3, #1		/* MAP_SHARED */
    ldr	r5, =0x3F200	/* offset GPIO */ 
	
	mov	r7, #192	/* mmap2 */
	svc	#0

    mov r1,#1
    lsl r1,#24
    str r1,[r0,#4]     @set GPIO18 to output
bx lr


_FLASH:
@parameter r1 - number of flashes

    loop$:
    push {r1}
    mov r1,#1
    lsl r1,#18
    str r1,[r0,#28]  @turn LED on
    mov r2,#0xF000000  @not using r2 for anything else so no need to push/pop
    
    push {lr}
    bl TIMER
    pop {lr}
    mov r1,#1
    lsl r1,#18
    str r1,[r0,#40]  @turn LED off
    mov r2,#0xF000000
    push {lr}
    bl TIMER
    pop {lr}
    pop {r1}
    sub r1,#1
    cmp r1,#0
    bne  loop$  @end of outer loop. Runs r8 times
bx lr


.data
mem: .asciz "/dev/mem"
