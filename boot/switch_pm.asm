[bits 16]
switch_to_pm:
    cli ; Disable interrupts
    lgdt [gdt_descriptor] ; Load GDT discriptor
    mov eax, cr0
    or eax, 0x1 ; Set 32-bit proc mode
    mov cr0, eax
    jmp CODE_SEG:init_pm ; Far jump to diffrent segment

[bits 32]
init_pm:
    mov ax, DATA_SEG ; Update segment regs
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000 ; Update stack to top of free space
    mov esp, ebp

    call BEGIN_PM ; Call useful code