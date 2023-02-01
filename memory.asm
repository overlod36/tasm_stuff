.model tiny
.code
	MOV AH, 0h
	MOV AL, 3h
	INT 10h
	
	MOV AX, 0B850h ; ад.сегмента
	MOV DS, AX    
	MOV DI,	0h	  ; aд.смещения
	MOV DL,	44h	  
	
	MOV CX, 300		
M1: 
	MOV [DS]:[DI], DL	; заносим данные в ячейку памяти
	INC DI
	LOOP M1

	MOV AX, 00h         
    INT 16h             
	
	MOV AX, 0B840h
	MOV DS, AX    ;адрес сегмента
	MOV DI,	10h	  ;адрес смещения
	MOV DL,	66h	   
	
	MOV CX, 150		
M2: 
	MOV [DS]:[DI], DL	; заносим данные в ячейку памяти
	INC DI
	LOOP M2

	MOV AX, 00h
    INT 16h
	

VIXOD:
	MOV AX, 4C00h
	INT 21h		
end
