; alive2.asm
extern printf

section .data
    msg1    db  "Hello, World!",10,0        ; string with NL and null terminator
    msg2    db  "Alive and Kicking!",10,0   ; string with NL and 0
    radius  dq  357                         ; no string, not displayable?
    pi      dq  3.14                        ; no string, not displayable?
    fmtstr  db  "%s",10,0                   ; format for printing a string
    fmtflt  db  "%lf",10,0                  ; format for a float
    fmtint  db  "%d",10,0                   ; format for an integer
section .bss
section .text
    global main
main:
    push    rbp
    mov     rbp, rsp
; print msg1
    mov     rax, 0          ; no floating point
    mov     rdi, fmtstr 
    mov     rsi, msg1
    call    printf
; print msg1
    mov     rax, 0          ; no floating point
    mov     rdi, fmtstr 
    mov     rsi, msg2
    call    printf
; print radius
    mov     rax, 0          ; no floating point
    mov     rdi, fmtint 
    mov     rsi, [radius]
    call    printf
; print pi
    mov     rax, 1          ; 1 xmm register used
    movq    xmm0, [pi]
    mov     rdi, fmtflt
    call    printf

    mov     rsp, rbp
    pop     rbp
ret