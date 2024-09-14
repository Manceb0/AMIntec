section .data
    num1 dd 5            ; 0101
    num2 dd 3            ; 0011
    result dd 0

section .text
    global _start

_start:
    mov eax, [num1]
    or eax, [num2]       ; OR operation
    mov [result], eax

    mov eax, 1           ; syscall for exit
    xor ebx, ebx         ; exit code 0
    int 0x80
