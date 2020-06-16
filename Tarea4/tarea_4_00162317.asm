org 	100h

section .text
        call	texto
	mov	dx,sms
	call	strng
	call	kb
	xor 	si, si 	


lupi:	
        call 	kb
	cmp 	si,5d 
	je	promedio
        sub     al, 30h
	mov	[300h+si], al 
	inc 	si
	jmp 	lupi

promedio:
        mov     bx, 0d
        mov     ax, 0d

lupi2:    
        add     al, [300h+bx]
        inc     bx
        cmp     bx, 5d
        jb      lupi2
        mov     [310h], al
        mov     [320h], bl
        mov     cl, bl
        div     cl
        mov     [330h], al

mostrar:
        mov 	dx, nl
	call	strng
	cmp     al, 10d
        je      frase1
        cmp     al, 9d
        je      frase2
        cmp     al, 8d
        je      frase3
        cmp     al, 7d
        je      frase4
        cmp     al, 6d
        je      frase5
        cmp     al, 5d
        je      frase6
        cmp     al, 4d
        je      frase7
        cmp     al, 3d
        je      frase8
        cmp     al, 2d
        je      frase9
        cmp     al, 1d
        je      frase10

frase1:	
        mov 	dx, m1
        jmp     fun

frase2:	
        mov 	dx, m2
        jmp     fun

frase3:	
        mov 	dx, m3
        jmp     fun

frase4:	
        mov 	dx, m4
        jmp     fun

frase5:	
        mov 	dx, m5
        jmp     fun

frase6:	
        mov 	dx, m6
        jmp     fun

frase7:	
        mov 	dx, m7
        jmp     fun

frase8:	
        mov 	dx, m8
        jmp     fun

frase9:	
        mov 	dx, m9
        jmp     fun

frase10:	
        mov 	dx, m
        jmp     fun
	
fun:   
        call 	strng
	call 	kb
	int 	20h

texto:	
        mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb: 	
        mov	ah, 1h
	int 	21h
	ret

strng:
        mov	ah, 09h
	int 	21h
	ret

section .data
	m1 	db 	"Perfecto solo Dios$"
	m2 	db 	"Siempre me esfuerzo$"
	m3 	db 	"Colocho$"
	m4 	db 	"Muy bien$"
	m5 	db 	"Peor es nada$"
	m6 	db 	"En el segundo$"
	m7 	db 	"Me recupero$"
	m8 	db 	"Hay salud$"
	m9 	db 	"Aun se pasa$"
	m 	db 	"Solo necesito el 0$"
	sms	db	"Escriba su carnet (5 digitos plox) y presione E"
	nl	db 	0xA, 0xD, "$"