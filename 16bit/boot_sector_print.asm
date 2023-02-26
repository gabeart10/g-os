; Prints string stored in memory location bx
print:
    pusha
    mov ah, 0x0e ; Set tty print with bios

print_while:
    mov al, [bx]
    cmp al, 0
    je print_done ; Jump done if null char is found

    int 0x10

    add bx, 1 ; Next char in string
    jmp print_while

print_done:
    popa
    ret

print_nl:
    pusha
    
    mov ah, 0x0e
    mov al, 0x0a ; newline
    int 0x10
    mov al, 0x0d ; carriage return
    int 0x10

    popa
    ret