; Prints 16 bit hex value in dx
print_hex:
    pusha
    mov ah, 0x0e
    mov cl, 16 ; Inital shift amount + counter

print_hex_loop:
    cmp cl, 0
    je print_hex_end
    sub cl, 4 ; Next char

    mov bx, dx ; Use bx as working reg
    ror bx, cl ; Put char in first 4 bits
    and bx, 0x000f ; Isolate last 4 bits
    add bx, 0x30 ; ASCII offset
    cmp bx, 0x39
    jle print_hex_print ; if bx > 0x39 then add 7 for ascii letters
    add bx, 7

print_hex_print:    
    mov al, bl
    int 0x10
    
    jmp print_hex_loop

print_hex_end:
    popa
    ret