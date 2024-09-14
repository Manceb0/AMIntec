section .data
    num1 dd 5
    num2 dd 6
    result dd 0

section .text
    global _start

_start:
    mov eax, [num1]      ; move num1 into eax
    imul eax, [num2]     ; multiply eax by num2
    mov [result], eax    ; store the result in result

    mov eax, 1           ; syscall number for sys_exit
    xor ebx, ebx         ; exit code 0
    int 0x80             ; make system call
