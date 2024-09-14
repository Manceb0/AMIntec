section .data
    num1 dd 5
    num2 dd 10
    result db 'Equal', 0

section .text
    global _start

_start:
    mov eax, [num1]      ; move num1 into eax
    cmp eax, [num2]      ; compare num1 and num2
    je equal             ; if equal, jump to 'equal'
    jl less              ; if less, jump to 'less'
    jmp greater          ; otherwise, jump to 'greater'

equal:
    mov eax, 4
    mov ebx, 1
    mov ecx, result      ; show 'Equal' message
    mov edx, 5
    int 0x80
    jmp exit

less:
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 5
    int 0x80
    jmp exit

greater:
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 5
    int 0x80

exit:
    mov eax, 1           ; syscall for exit
    xor ebx, ebx         ; exit code 0
    int 0x80
