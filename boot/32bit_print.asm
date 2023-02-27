[bits 32]

VIDEO_MEM_LOC equ 0xb8000
WHITE_ON_BLACK equ 0x0f

; Prints string that starts at address ebx
print_string:
    pusha
    mov edx, VIDEO_MEM_LOC

print_string_loop:
    mov al, [ebx]
    mov ah, WHITE_ON_BLACK

    cmp al, 0
    je print_string_done

    mov [edx], ax
    add ebx, 1 ; Next char
    add edx, 2 ; Next display loc

    jmp print_string_loop

print_string_done:
    popa
    ret
