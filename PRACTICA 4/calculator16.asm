section .data
    num dd 5             ; 0101
    result dd 0

section .text
    global _start

_start:
    mov eax, [num]
    bsr ecx, eax         ; find the most significant bit set
    mov [result], ecx

    mov eax, 1           ; syscall for exit
    xor ebx, ebx         ; exit code 0
    int 0x80
