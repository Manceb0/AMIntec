section .data
    prompt db "Seleccione una operacion:", 0xA
    menu db "1. Suma", 0xA, "2. Resta", 0xA, "3. Multiplicacion", 0xA, "4. Division", 0xA, 0
    selectOp db "Su eleccion: ", 0
    enterFirstNum db "Ingrese el primer numero: ", 0
    enterSecondNum db "Ingrese el segundo numero: ", 0
    resultMsg db "El resultado es: ", 0
    zeroDivideMsg db "Error: Division por cero!", 0xA, 0

section .bss
    num1 resb 10
    num2 resb 10
    result resb 10
    op resb 1

section .text
    global _start

_start:
    ; Mostrar el menú
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 25
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, menu
    mov edx, 52
    int 0x80

    ; Seleccionar operación
    mov eax, 4
    mov ebx, 1
    mov ecx, selectOp
    mov edx, 16
    int 0x80

    ; Leer la operacion
    mov eax, 3
    mov ebx, 0
    mov ecx, op
    mov edx, 1
    int 0x80

    ; Ingresar primer número
    mov eax, 4
    mov ebx, 1
    mov ecx, enterFirstNum
    mov edx, 27
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 10
    int 0x80
    call str2int
    mov esi, eax          ; Guardar el primer número en esi

    ; Ingresar segundo número
    mov eax, 4
    mov ebx, 1
    mov ecx, enterSecondNum
    mov edx, 28
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 10
    int 0x80
    call str2int
    mov edi, eax          ; Guardar el segundo número en edi

    ; Realizar operación
    mov al, [op]
    sub al, '0'
    cmp al, 1
    je add
    cmp al, 2
    je subtract
    cmp al, 3
    je multiply
    cmp al, 4
    je divide
    jmp exit

add:
    add esi, edi
    jmp print_result

subtract:
    sub esi, edi
    jmp print_result

multiply:
    imul esi, edi
    jmp print_result

divide:
    cmp edi, 0
    je div_by_zero
    xor edx, edx
    div edi
    jmp print_result

div_by_zero:
    mov eax, 4
    mov ebx, 1
    mov ecx, zeroDivideMsg
    mov edx, 29
    int 0x80
    jmp exit

print_result:
    mov eax, esi
    call int2str
    mov eax, 4
    mov ebx, 1
    mov ecx, resultMsg
    mov edx, 17
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 10
    int 0x80
    jmp exit

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Convertir cadena ASCII a número
str2int:
    xor eax, eax
    xor ecx, ecx
convert_loop:
    mov bl, [ecx]
    cmp bl, 0xA
    je end_str2int
    sub bl, '0'
    imul eax, eax, 10
    add eax, ebx
    inc ecx
    jmp convert_loop
end_str2int:
    ret

; Convertir número a cadena ASCII
int2str:
    xor ecx, ecx
    mov edi, 10
convert_to_ascii:
    xor edx, edx
    div edi
    add dl, '0'
    mov [result + ecx], dl
    inc ecx
    cmp eax, 0
    jne convert_to_ascii
    ret
