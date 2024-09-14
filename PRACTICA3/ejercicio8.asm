section .data
    num dd 5            ; número inicial
    result dd 0         ; resultado después de invertir los bits
    msg db "Resultado: ", 0
    buffer db 10 dup(0)  ; buffer para almacenar el número convertido

section .text
    global _start

_start:
    ; Invertir los bits del número
    mov eax, [num]      ; mover el número a eax
    not eax             ; invertir todos los bits de eax
    mov [result], eax   ; almacenar el resultado

    ; Mostrar el mensaje "Resultado: "
    mov eax, 4          ; syscall número para sys_write
    mov ebx, 1          ; descriptor de archivo 1 (stdout)
    mov ecx, msg        ; apuntar al mensaje
    mov edx, 11         ; longitud del mensaje
    int 0x80            ; hacer la llamada al sistema

    ; Convertir el número a cadena y almacenarlo en buffer
    mov eax, [result]   ; mover el resultado a eax
    test eax, eax       ; comprobar si es negativo
    jns positive        ; si no es negativo, saltar a 'positive'
    neg eax             ; si es negativo, convertir a positivo
    call int_to_string  ; convertir el número a cadena
    mov byte [esi-1], '-' ; agregar el signo negativo al inicio
    jmp print_result

positive:
    call int_to_string  ; convertir el número a cadena

print_result:
    ; Mostrar el número invertido
    mov eax, 4          ; syscall número para sys_write
    mov ebx, 1          ; descriptor de archivo 1 (stdout)
    mov ecx, buffer     ; apuntar al buffer
    mov edx, 10         ; longitud del número (máximo)
    int 0x80            ; hacer la llamada al sistema

    ; Terminar el programa
    mov eax, 1          ; syscall número para sys_exit
    xor ebx, ebx        ; código de salida 0
    int 0x80            ; hacer la llamada al sistema

; Rutina para convertir un número en EAX a cadena en buffer
int_to_string:
    mov esi, buffer     ; apuntar al buffer
    add esi, 9          ; apuntar al final del buffer
    mov byte [esi], 0   ; agregar terminador nulo

convert_loop:
    xor edx, edx        ; limpiar edx
    mov ebx, 10         ; divisor
    div ebx             ; dividir eax por 10
    add dl, '0'         ; convertir el residuo en carácter ASCII
    dec esi             ; mover el puntero del buffer hacia atrás
    mov [esi], dl       ; almacenar el carácter
    test eax, eax       ; comprobar si ya no quedan más dígitos
    jnz convert_loop    ; si no es cero, repetir el ciclo

    ret
