section .data
    num1 dd 20           ; primer número (dividendo)
    num2 dd 4            ; segundo número (divisor)
    quotient dd 0        ; cociente
    remainder dd 0       ; residuo
    msg1 db "Cociente: ", 0
    msg2 db "Residuo: ", 0
    buffer dd 10 dup(0)  ; buffer para almacenar el número convertido

section .text
    global _start

_start:
    ; Dividir num1 por num2
    mov eax, [num1]      ; mover num1 (dividendo) a eax
    mov ebx, [num2]      ; mover num2 (divisor) a ebx
    xor edx, edx         ; limpiar edx antes de dividir
    div ebx              ; dividir eax por ebx, cociente en eax, residuo en edx
    mov [quotient], eax  ; almacenar el cociente
    mov [remainder], edx ; almacenar el residuo

    ; Mostrar el mensaje "Cociente: "
    mov eax, 4           ; syscall número para sys_write
    mov ebx, 1           ; descriptor de archivo 1 (stdout)
    mov ecx, msg1        ; apuntar al mensaje
    mov edx, 10          ; longitud del mensaje
    int 0x80             ; hacer la llamada al sistema

    ; Convertir el cociente a cadena y mostrarlo
    mov eax, [quotient]  ; mover el cociente a eax
    call int_to_string   ; convertir el cociente a cadena
    mov eax, 4           ; syscall número para sys_write
    mov ebx, 1           ; descriptor de archivo 1 (stdout)
    mov ecx, buffer      ; apuntar al buffer
    mov edx, 10          ; longitud del número convertido
    int 0x80             ; hacer la llamada al sistema

    ; Mostrar el mensaje "Residuo: "
    mov eax, 4           ; syscall número para sys_write
    mov ebx, 1           ; descriptor de archivo 1 (stdout)
    mov ecx, msg2        ; apuntar al mensaje
    mov edx, 9           ; longitud del mensaje
    int 0x80             ; hacer la llamada al sistema

    ; Convertir el residuo a cadena y mostrarlo
    mov eax, [remainder] ; mover el residuo a eax
    call int_to_string   ; convertir el residuo a cadena
    mov eax, 4           ; syscall número para sys_write
    mov ebx, 1           ; descriptor de archivo 1 (stdout)
    mov ecx, buffer      ; apuntar al buffer
    mov edx, 10          ; longitud del número convertido
    int 0x80             ; hacer la llamada al sistema

    ; Terminar el programa
    mov eax, 1           ; syscall número para sys_exit
    xor ebx, ebx         ; código de salida 0
    int 0x80             ; hacer la llamada al sistema

; Rutina para convertir un número en EAX a cadena en buffer
int_to_string:
    mov esi, buffer      ; apuntar al buffer
    add esi, 9           ; apuntar al final del buffer
    mov byte [esi], 0    ; agregar terminador nulo

convert_loop:
    xor edx, edx         ; limpiar edx
    mov ebx, 10          ; divisor
    div ebx              ; dividir eax por 10
    add dl, '0'          ; convertir el residuo en carácter ASCII
    dec esi              ; mover el puntero del buffer hacia atrás
    mov [esi], dl        ; almacenar el carácter
    test eax, eax        ; comprobar si ya no quedan más dígitos
    jnz convert_loop     ; si no es cero, repetir el ciclo

    ret
