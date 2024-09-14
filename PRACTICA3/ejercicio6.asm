section .data
    num db '123', 0      ; number to display

section .text
    global _start

_start:
    mov eax, 4           ; syscall number for sys_write
    mov ebx, 1           
    mov ecx, num         
    mov edx, 3           
    int 0x80             ; make system call

    mov eax, 1           
    xor ebx, ebx        
    int 0x80             