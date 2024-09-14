section .data
    cadena db 'Hola', 0         ; define la cadena original
    longitud equ $ - cadena     ; calcula la longitud de la cadena
    invertida db 5 dup(0)       ; define un espacio para la cadena invertida

section .text
    global _start

_start:
    mov esi, cadena             ; apunta esi al inicio de la cadena
    mov edi, invertida          ; apunta edi al inicio de la cadena invertida
    add esi, longitud - 1       ; mueve esi al último carácter de la cadena

ciclo_invertir:
    mov al, [esi]               ; carga el carácter de esi
    mov [edi], al               ; almacena el carácter en edi
    dec esi                     ; retrocede en la cadena original
    inc edi                     ; avanza en la cadena invertida
    cmp esi, cadena - 1         ; verifica si llegamos al inicio
    jg ciclo_invertir           ; si no, sigue en el ciclo

    mov eax, 4
    mov ebx, 1
    mov ecx, invertida          ; imprime la cadena invertida
    mov edx, longitud
    int 0x80

    mov eax, 1                  ; syscall para salir
    xor ebx, ebx                ; código de salida 0
    int 0x80
