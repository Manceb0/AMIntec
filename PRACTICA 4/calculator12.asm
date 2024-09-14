section .data
    num dd 5             ; 0101
    result dd 0

section .text
    global _start

_start:
    mov eax, [num]
    shl eax, 1           ; shift left by 1
    mov [result], eax

    mov eax, 1           ; syscall for exit
    xor ebx, ebx         ; exit code 0
    int 0x80
