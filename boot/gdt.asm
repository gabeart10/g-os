gdt_start:
    dd 0x0
    dd 0x0

; GDT for code segment
gdt_code:
    dw 0xffff ; segment length, bits 0-15
    dw 0x0 ; segment base, bits 0-15
    db 0x0 ; segment base, bits 16-23
    db 10011010b ; flags (8 bits)
    db 11001111b ; flags (4 bits) + segment length, bits 16-19
    db 0x0 ; segment base, bits 24-31

; GDT for data segment
gdt_data:
    dw 0xffff ; segment length, bits 0-15
    dw 0x0 ; segment base, bits 0-15
    db 0x0 ; segment base, bits 16-23
    db 10010010b ; flags (8 bits)
    db 11001111b ; flags (4 bits) + segment length, bits 16-19
    db 0x0 ; segment base, bits 24-31

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1 ; Size (16 bits) one less than true size
    dd gdt_start ; address (32bit)

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start