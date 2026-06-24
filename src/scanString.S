.section .text
    .global scanString
    .extern flush
scanString:
    stp x29, x30, [sp, #-48]!
    stp x19, x20, [sp, #16]
    stp x21, x22, [sp, #32]
    mov x19, x0
    mov x20, x1
    mov x21, x2
    mov x22, x3
    cbz x21, scanStringFalse
scanStringTrue:
    mov x0, xzr
    mov x1, x19
    sub x2, x20, #1
    movz x8, #63
    svc #0
    add x19, x19, x0
    mov w9, wzr
    strb w9, [x19]
    b scanStringFlush
scanStringFalse:
    mov x0, xzr
    mov x1, x19
    mov x2, x20
    movz x8, #63
    svc #0
scanStringFlush:
    cbz x22, scanStringEnd
    bl flush
scanStringEnd:
    ldp x29, x30, [sp], #16
    ldp x19, x20, [sp], #16
    ldp x21, x22, [sp], #16
    ret
