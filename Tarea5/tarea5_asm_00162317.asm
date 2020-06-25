org 	100h

section .text

	call 	grafico	

	xor 	si, si
	xor 	di, di

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    mov 	si, 15d 
	mov 	di, 30d 
    mov     bx, 120d
	call 	linea_v


    mov 	si, 90d 
	mov 	di, 30d 
    mov     bx, 120d
	call 	linea_v



 	mov 	si, 30d 
	mov 	di, 50d 
    mov     bx, 70d
	call 	linea_v


 	mov 	si, 75d 
	mov 	di, 50d 
    mov     bx, 70d
	call 	linea_v



 	mov 	si, 30d 
	mov 	di, 90d 
    mov     bx, 120d
	call 	linea_v
	

 	mov 	si, 75d 
	mov 	di, 90d 
    mov     bx, 120d
	call 	linea_v

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    mov 	si, 15d 
	mov 	di, 30d 
    mov     bx, 90d
	call 	linea_h




	mov 	si, 30d 
	mov 	di, 50d 
    mov     bx, 75d
	call 	linea_h


	mov 	si, 30d 
	mov 	di, 70d 
    mov     bx, 76d
	call 	linea_h


	mov 	si, 30d 
	mov 	di, 90d 
    mov     bx, 75d
	call 	linea_h


	mov 	si, 15d 
	mov 	di, 120d 
    mov     bx, 31d
	call 	linea_h


	mov 	si, 75d 
	mov 	di, 120d 
    mov     bx, 91d
	call 	linea_h

	call 	kb		

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 0001b
	int 	10h
	ret

pixel1:	mov	ah, 0Ch
	mov	al, 0010b
	int 	10h
	ret

linea_h: 
lupi_h:	mov 	cx, 0d 
	add 	cx, si
	mov	    dx, di 
	call 	pixel
	inc 	si
	cmp 	si, bx
	jne 	lupi_h
	ret

linea_v:
lupi_v:	mov 	cx, si 
	mov	dx, 0d 
	add 	dx, di
	call 	pixel1
	inc 	di
	cmp 	di, bx
	jne 	lupi_v
	ret


kb: 	mov	ah, 00h
	int 	16h
	ret

section .data