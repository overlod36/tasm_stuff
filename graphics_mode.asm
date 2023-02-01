.model tiny
.code

  mov ah,00h
  mov al,13h
  int 10h

  mov ax, 0A000h
  mov es, ax
  mov ax, 00h
  mov di, ax

; фон
  mov ah, 10h
  mov al, 10h ; установка одного регистра цап
  mov bx, 0 
; 6 бит
  mov dh, 52 ; красный
  mov ch, 62 ; зеленый
  mov cl, 42 ; синий
  int 10h

; в начале
  mov ah, 10h
  mov al, 10h 
  mov bx, 1 
  mov dh, 0 
  mov ch, 41 
  mov cl, 0 
  int 10h  
  
  ; после нажатия
  mov ah, 10h
  mov al, 10h 
  mov bx, 2 
  mov dh, 0 
  mov ch, 0 
  mov cl, 50 
  int 10h  

  mov ah, 10h
  mov al, 10h 
  mov bx, 3
  mov dh, 0
  mov ch, 0 
  mov cl, 0 
  int 10h
  

  mov ah, 0
  int 16h

  mov bh, 0
  mov ax, 0
  mov cx, 200
cl_back:
  push cx
  mov cx, 320
  mov di, ax
  sl_back:
    mov [es:di], bh
    inc di
    loop sl_back
  pop cx
  add ax, 320
  loop cl_back

  mov bh, 1
  mov ax, 25670
  mov cx, 90
cl_rec:
  push cx
  mov cx, 120
  mov di, ax
  sl_rec:
    mov [es:di], bh
    inc di
    loop sl_rec
  pop cx
  add ax, 320
  loop cl_rec

  mov ah, 0
  int 16h

  mov bh, 2
  mov ax, 25670
  mov cx, 90
cl_rec2:
  push cx
  mov cx, 120
  mov di, ax
  sl_rec2:
    mov [es:di], bh
    inc di
    loop sl_rec2
  pop cx
  add ax, 320
  loop cl_rec2

  mov ah, 0
  int 16h

  mov ah,00h 
  mov al,03h  
  int 10h


  mov ax,4C00h
  int 21H
end