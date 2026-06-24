.section .text
    .global scanChar
	.extern flush
scanChar:
	stp x29, x30, [sp, #-16]!
	mov x1, x0
	movz x0, #0
	movz x2, #1
	movz x8, #63
	svc #0
	bl flush
	ldp x29, x30, [sp], #16
	ret
