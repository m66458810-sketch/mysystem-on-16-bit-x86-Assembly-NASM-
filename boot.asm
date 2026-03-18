[org 0x7c00]
mov ah, 0x02    
mov al, 15      
mov ch, 0
mov dh, 0
mov cl, 2       
mov bx, 0x1000  
mov es, bx
xor bx, bx
int 0x13

jmp 0x1000:0000 

times 510-($-$$) db 0
dw 0xaa55
