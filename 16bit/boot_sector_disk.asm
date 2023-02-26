; load 'dh' sectors from drive 'dl' 
disk_load:
    pusha
    push dx

    mov ah, 0x02 ; read mode
    mov al, dh ; Set num sectors to read
    mov cl, 0x02 ; Set start sector to first avalible sector
    mov ch, 0x00 ; Set cylinder 0
    mov dh, 0x00 ; Set head number 0

    int 0x13 ; BIOS Hard Drive interrupt
    jc disk_error

    pop dx
    cmp al, dh ; Check if all sectors were read
    jne sectors_error
    popa
    ret

disk_error: 
    mov bx, DISK_ERROR
    call print
    call print_nl
    mov dh, ah
    call print_hex
    jmp disk_loop

sectors_error:
    mov bx, SECTORS_ERROR
    call print

disk_loop:
    jmp $

DISK_ERROR: db "Disk read error", 0
SECTORS_ERROR: db "Incorrect amount of sectors read", 0