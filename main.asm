mov ah, 0x0e
mov al, 65
mov dh, 1
int 0x10

add32:
    inc al ; adding 1 to al so loop can move forward
    add al, 32 ; adding 32 to make lowercase
    cmp al , 'Z' + 1 ; make sure we in bounds
    je exit ; if we not exit
    mov dh, 0 ; set case toggle
    jmp jumpLoop ; jump back to loop

sub32: 
    inc al ; adding 1 to al so loop can move forward
    sub al, 32 ; subtract 32 to make uppercase
    cmp al , 'Z' + 1 ; bounds check
    je exit ; leaves if out of bounds 
    mov dh, 1 ; set case toogle
    jmp jumpLoop

loop:
    cmp dh, 1 ; check if upper or lower
    je add32 ; make lower
    jmp sub32 ; make upper

jumpLoop:
    int 0x10
    jmp loop


exit:
    jmp $

times 510- ($ - $$) db 0
db 0x55, 0xaa