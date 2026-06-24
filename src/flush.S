.section .bss
data1Byte:
	.skip 1
.section .text
	.global flush
flush:
	stp x29, x30, [sp, #-16]!
	adrp x1, data1Byte
	add x1, x1, #:lo12:data1Byte
	movz w10, #0x000a
loopFlush:
	movz x0, #0
	// x1 = &data1Byte
	movz x2, #1
	movz x8, #63
	svc #0
	ldrb w9, [x1]
	cmp w9, w10
	beq endFlush
	b loopFlush
endFlush:
	ldp x29, x30, [sp], #16
	ret
