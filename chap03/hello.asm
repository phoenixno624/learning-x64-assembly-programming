; hello.asm
section .data
    msg     db      "hello, world",0
    NL      db      0xa                 ; ascii code for new line
section .bss
section .text
    global main
main:
    mov     rax, 1      ; 1 = write
    mov     rdi, 1      ; 1 = to stdout
    mov     rsi, msg    ; string to display
    mov     rdx, 12     ; length of string less null terminator
    syscall             ; write string
    mov     rax, 1      ; 1 = write
    mov     rdi, 1      ; 1 = to stdout
    mov     rsi, NL     ; newline
    mov     rdx, 1      ; length of newline char
    syscall             ; write newline
    mov     rax, 60     ; 60 = exit
    mov     rdi, 0      ; return code
    syscall             ; exit