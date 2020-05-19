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
section .data
        msg	    db  "Roberto Ernesto"
        len 	    equ	$-msg+29d

        msg1	   db 	"Hernandez Contreras"
        len1 	   equ	$-msg1+1d

        msg2	   db 	"00162317"
        len2 	   equ	$-msg2+55d