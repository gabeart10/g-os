[org 0x7c00]

mov bp, 0x8000 ; Set stack at 0x8000
mov sp, bp

mov bx, 0x9000 ; read to ex:bx = 0x9000
mov dh, 2 ; Read 2 sectors
call disk_load

mov dx, [0x9000] ; First word from loaded sector 2
call print_hex
call print_nl

mov dx, [0x9000 + 512] ; First word from loaded sector 3
call print_hex

jmp $ 

%include "boot_sector_print.asm"
%include "boot_sector_print_hex.asm"
%include "boot_sector_disk.asm"

times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xDEAD ; Sector 2 = 512 bytes
times 256 dw 0xBEEF ; Sector 3 = 512 bytes