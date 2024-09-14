section .data
    num dd 5
    result dd 0

section .text
    global _start

_start:
    mov eax, [num]       ; move num into eax
    not eax              ; invert all the bits
    mov [result], eax    ; store the result

    mov eax, 1           ; syscall for exit
    xor ebx, ebx         ; exit code 0
    int 0x80
