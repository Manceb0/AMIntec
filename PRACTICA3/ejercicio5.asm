section .data
    num1 dd 20
    num2 dd 4
    result dd 0
    remainder dd 0

section .text
    global _start

_start:
    mov eax, [num1]      ; move num1 into eax
    mov ebx, [num2]      ; move num2 into ebx
    xor edx, edx         ; clear edx before division
    div ebx              ; divide eax by ebx
    mov [result], eax    ; store the quotient in result
    mov [remainder], edx ; store the remainder in remainder

    mov eax, 1           ; syscall number for sys_exit
    xor ebx, ebx         ; exit code 0
    int 0x80             ; make system call
