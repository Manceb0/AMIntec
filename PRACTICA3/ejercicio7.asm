section .data
    num1 dd 5           ; primer número
    num2 dd 10          ; segundo número
    msg_equal db "Los numeros son iguales.", 0
    msg_greater db "El primer numero es mayor.", 0
    msg_less db "El segundo numero es mayor.", 0

section .text
    global _start

_start:
    ; Comparar num1 y num2
    mov eax, [num1]      ; mover num1 a eax
    cmp eax, [num2]      ; comparar num1 con num2
    je equal             ; si son iguales, saltar a 'equal'
    jl less              ; si num1 es menor, saltar a 'less'
    jmp greater          ; si num1 es mayor, saltar a 'greater'

equal:
    ; Mostrar el mensaje de igualdad
    mov eax, 4           ; syscall número para sys_write
    mov ebx, 1           ; descriptor de archivo 1 (stdout)
    mov ecx, msg_equal   ; apuntar al mensaje de igualdad
    mov edx, 24          ; longitud del mensaje
    int 0x80             ; hacer la llamada al sistema
    jmp exit

less:
    ; Mostrar el mensaje de menor
    mov eax, 4           ; syscall número para sys_write
    mov ebx, 1           ; descriptor de archivo 1 (stdout)
    mov ecx, msg_less    ; apuntar al mensaje de menor
    mov edx, 27          ; longitud del mensaje
    int 0x80             ; hacer la llamada al sistema
    jmp exit

greater:
    ; Mostrar el mensaje de mayor
    mov eax, 4           ; syscall número para sys_write
    mov ebx, 1           ; descriptor de archivo 1 (stdout)
    mov ecx, msg_greater ; apuntar al mensaje de mayor
    mov edx, 27          ; longitud del mensaje
    int 0x80             ; hacer la llamada al sistema

exit:
    ; Terminar el programa
    mov eax, 1           ; syscall número para sys_exit
    xor ebx, ebx         ; código de salida 0
    int 0x80             ; hacer la llamada al sistema
