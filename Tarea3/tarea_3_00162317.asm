	org 	100h

section .text

        ;Parrafo 1
        call 	texto
        call 	cursor
        call 	phrase
        call	kbwait

        int 	20h

;----------------------------------------------------------
;----------------------------------------------------------
texto:	mov 	ah, 00h
	    mov	    al, 03h ; 80 columnas por 25 filas
        int 	10h
        call 	texto1	
        ret

cursor: mov	ah, 01h
        mov 	ch, 00000000b
        mov 	cl, 00001110b
            ;   IRGB
        int 	10h
        call 	cursor1
        ret

w_char:	mov 	ah, 09h
        mov 	al, cl
        mov 	bh, 0h
        mov 	bl, 00001111b
        mov 	cx, 1h
        int 	10h
        ret

kbwait: mov 	ax, 0000h
        int 	16h
        ret

m_cursr:mov 	ah, 02h
        mov 	dx, di  ; columna
        mov 	dh, 0d ; fila
        mov 	bh, 0h
        int 	10h
        ret

phrase:	mov 	di, 29d
lupi:	mov 	cl, [msg+di-29d]
        call    m_cursr
        call 	w_char
        inc	di
        cmp 	di, len
        jb	    lupi
        call 	phrase1
        ret
;----------------------------------------------------------

texto1:	mov 	ah, 00h
	    mov	    al, 03h ; 80 columnas por 25 filas
        int 	10h
        call    texto2
        ret

cursor1: mov	ah, 01h
        mov 	ch, 00000000b
        mov 	cl, 00001110b
            ;   IRGB
        int 	10h
        call    cursor2
        ret

w_char1:	mov 	ah, 09h
        mov 	al, cl
        mov 	bh, 0h
        mov 	bl, 00001111b
        mov 	cx, 1h
        int 	10h
        ret

m_cursr1:mov 	ah, 02h
        mov 	dx, di  ; columna
        mov 	dh, 10d ; fila
        mov 	bh, 0h
        int 	10h
        ret

phrase1:	mov 	di, 1d
lupi1:	mov 	cl, [msg1+di-1d]
        call    m_cursr1
        call 	w_char1
        inc	di
        cmp 	di, len1
        jb	lupi1
        call    phrase2
        ret        
;----------------------------------------------------------
section .data
        msg	    db  "Roberto Ernesto"
        len 	    equ	$-msg+29d

        msg1	   db 	"Hernandez Contreras"
        len1 	   equ	$-msg1+1d

        msg2	   db 	"00162317"
        len2 	   equ	$-msg2+55d