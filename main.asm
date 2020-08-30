mov ah, 0x0e
mov al, 65
mov dh, 1
int 0x10

add32:
    inc al
    add al, 32
    cmp al , 'Z' + 1
    je exit
    mov dh, 0
    int 0x10
    jmp loop

sub32:
    inc al
    sub al, 32
    cmp al , 'Z' + 1
    je exit
    mov dh, 1
    int 0x10
    jmp loop

loop:
    cmp dh, 1
    je add32
    jmp sub32
   

exit:
    jmp $

times 510- ($ - $$) db 0
db 0x55, 0xaa