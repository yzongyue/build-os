; mbr
SECTION MBR vstart=0x7c00
    ; init
    mov ax, cs
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov ss, ax
    mov sp, 0x7c00

    ; clear ah=0x06
    mov ax, 0x0600 ; al=0 全部
    mov bx, 0x0700 ; 行属性？？
    mov cx, 0
    mov dx, 0x184f
    int 0x10

    ; cursor
    mov ah, 3
    mov bh, 0
    int 0x10

    ; print str
    mov ax, message
    mov bp, ax
    mov cx, 5
    mov ax, 0x1301
    mov bx, 0x2
    int 0x10
    
    jmp $
    message db "1 MBR"
    times 510-($-$$) db 0 
    db 0x55, 0xaa
