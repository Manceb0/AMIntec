section .data
    num1 dd 10
    num2 dd 20
    result dd 0

section .text
    global _start

_start:
    mov eax, [num1]      ; move num1 into eax
    add eax, [num2]      ; add num2 to eax
    mov [result], eax    ; store the result in result

    mov eax, 1           ; syscall number for sys_exit
    xor ebx, ebx         ; exit code 0
    int 0x80             ; make system call
