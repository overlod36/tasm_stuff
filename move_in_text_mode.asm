.model tiny
.code

  mov ah,00h ;очистка экрана
  mov al,03h ;установка текстового режима 
  int 10h

  mov ax, 0B800h
  mov es, ax
  mov ax, 00h
  mov di, ax

  mov ah, 0
  int 16h 

  mov cx, 2000

fillback:
  mov [es]:[di], 5544h ; цвет 101, символ D
  inc di
  inc di
  loop fillback

  mov ax, 00h
  mov di, ax
  mov ah, 0  
  int 16h 
  mov cx, 40

firstL:
  mov [es]:[di], 5544h
  mov [es]:[di+2], 5D44h ; выделяем на фоне
  inc di
  inc di

  push cx
  mov cx, 0h
  mov dx, 9350h
  mov ah, 086h
  int 15h	

  pop cx
  loop firstL

  mov cx, 10

secL:
  mov [es]:[di], 5544h
  mov [es]:[di + 160], 5D44h
  add di, 160 

  push cx
  mov cx, 0h
  mov dx, 9350h
  mov ah, 086h
  int 15h	

  pop cx
  loop secL

  mov cx, 40

th_L:
  mov [es]:[di], 5544h
  mov [es]:[di-2], 5D44h ; выделяем на фоне
  dec di
  dec di

  push cx
  mov cx, 0h
  mov dx, 9350h
  mov ah, 086h
  int 15h	

  pop cx
  loop th_L

mov cx, 10
last_L:
  mov [es]:[di], 5544h
  mov [es]:[di-160], 5D44h
  sub di, 160

  push cx
  mov cx, 0h
  mov dx, 9350h
  mov ah, 086h
  int 15h	

  pop cx
  loop last_L

  mov ax, 00h
  mov di, ax

  mov ah, 0
  int 16h
  mov cx, 2000


clear:
  mov [es]:[di], 0700h
  inc di
  inc di
  loop clear

  mov ax,4C00h
  int 21H
end 

