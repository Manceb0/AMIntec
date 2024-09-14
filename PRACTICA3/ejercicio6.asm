section .data
    num dd 123            ; número a mostrar
    msg db "Número: ", 0
    buffer db 10 dup(0)    ; buffer para almacenar el número convertido

section .text
    global _start

_start:
    ; Mostrar el mensaje "Número: "
    mov eax, 4            ; syscall número para sys_write
    mov ebx, 1            ; descriptor de archivo 1 (stdout)
    mov ecx, msg          ; apuntar al mensaje
    mov edx, 8            ; longitud del mensaje
    int 0x80              ; hacer la llamada al sistema

    ; Convertir el número a cadena y almacenarlo en buffer
    mov eax, [num]        ; mover el número a eax
    call int_to_string    ; llamar a la rutina de conversión

    ; Mostrar el número convertido
    mov eax, 4            ; syscall número para sys_write
    mov ebx, 1            ; descriptor de archivo 1 (stdout)
    mov ecx, buffer       ; apuntar al buffer
    mov edx, 10           ; longitud del número (máximo)
    int 0x80              ; hacer la llamada al sistema

    ; Terminar el programa
    mov eax, 1            ; syscall número para sys_exit
    xor ebx, ebx          ; código de salida 0
    int 0x80              ; hacer la llamada al sistema

; Rutina para convertir un número en EAX a cadena en buffer
int_to_string:
    mov esi, buffer       ; apuntar al buffer
    add esi, 9            ; apuntar al final del buffer
    mov byte [esi], 0     ; agregar terminador nulo

convert_loop:
    xor edx, edx          ; limpiar edx
    mov ebx, 10           ; divisor
    div ebx               ; dividir eax por 10
    add dl, '0'           ; convertir el residuo en carácter ASCII
    dec esi               ; mover el puntero del buffer hacia atrás
    mov [esi], dl         ; almacenar el carácter
    test eax, eax         ; comprobar si ya no quedan más dígitos
    jnz convert_loop      ; si no es cero, repetir el ciclo

    ret
