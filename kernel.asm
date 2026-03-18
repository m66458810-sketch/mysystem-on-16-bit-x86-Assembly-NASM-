[org 0x0000]

mov ax, cs          
mov ds, ax          
mov es, ax          


mov ax, 0x0003
int 0x10

mov si, msg_login
call print_string


get_char:
    mov ah, 0x00
    int 0x16
    mov ah, 0x0E
    int 0x10
    cmp al, 'm'
    je start_paint
    jmp get_char

start_paint:
    mov ax, 0x0013
    int 0x10

    mov ax, 0xa000
    mov es, ax
    xor di, di

    mov al, 7
    mov cx, 320 * 40
    rep stosb

    mov al, 15
    mov cx, 320 * 160
    rep stosb

    mov dx, 100
    mov bx, 160
    mov byte [color], 1
    mov byte [pen_down], 1

main_loop:
    cmp byte [pen_down], 1
    jne draw_cursor_only
    
    push dx
    push bx
    mov cx, 5
.y_brush:
    push cx
    mov cx, 5
.x_brush:
    push dx
    imul di, dx, 320
    add di, bx
    mov al, [color]
    mov [es:di], al
    pop dx
    inc bx
    loop .x_brush
    sub bx, 5
    inc dx
    pop cx
    loop .y_brush
    pop bx
    pop dx
    jmp wait_input

draw_cursor_only:
    push dx
    imul di, dx, 320
    add di, bx
    mov al, 0          
    mov [es:di], al
    pop dx

wait_input:
    mov ah, 0x00
    int 0x16

    cmp al, 'w'
    je move_up
    cmp al, 's'
    je move_down
    cmp al, 'a'
    je move_left
    cmp al, 'd'
    je move_right
    cmp al, ' '
    je toggle_pen
    

    cmp al, '1'
    je set_blue
    cmp al, '2'
    je set_red
    cmp al, '3'
    je set_green
    cmp al, '0'
    je set_eraser
    
    jmp main_loop

print_string:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0E
    int 0x10
    jmp print_string
.done:
    ret

move_up:
    sub dx, 4
    jmp main_loop
move_down:
    add dx, 4
    jmp main_loop
move_left:
    sub bx, 4
    jmp main_loop
move_right:
    add bx, 4
    jmp main_loop

toggle_pen:
    xor byte [pen_down], 1
    jmp main_loop

set_blue:
    mov byte [color], 1
    jmp main_loop
set_red:
    mov byte [color], 4
    jmp main_loop
set_green:
    mov byte [color], 2
    jmp main_loop
set_eraser:
    mov byte [color], 15
    jmp main_loop

msg_login db 'MikhailOS v1.3 Cursor Mode. Password: ', 0
color db 1
pen_down db 
