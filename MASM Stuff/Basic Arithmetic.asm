TITLE  Assignment 1    (Assignment 1.asm)

; Author: Jay Banerji
; CS271 Assignment 1             Date: 2/10/16
; Description: A program to do arithmetic in assembly language

INCLUDE Irvine32.inc

; (insert constant definitions here)

.data
introduction	byte	"Jay Banerji - CS271 Assignment 1",0
instructions1	byte	"This is a program to do basic arithmetic with two numbers",0
instructions2	byte	"Please enter two numbers",0
firstPrompt		byte	"First number: ",0
num1		    dword	?
secondPrompt	byte	"Second number: ",0
num2			dword	?
rmult			dword	?
radd			dword	?
rsub			dword	?
rdiv			dword	?
remainder		byte	" remainder ",0
rrem			dword	?
mults			byte	" x ",0
adds			byte	" + ",0
subs			byte	" - ",0
divs			byte	" / ",0
equals			byte	" = ",0
again			byte	"FUCK YEAH LETS GO AGAIN",0
lessThan		byte	"The second number must be less than the first!",0
byeyes			byte	"Do you want to keep going? (1,0)",0
byeno			dword	?
goodBye			byte	"GGWP, get rekt scrub",0


; (insert variable definitions here)

.code
main PROC
;TELL THEM WHAT THE FUCK TO DO
	mov		edx, offset introduction
	call	writestring
	call	crlf
	mov		edx, offset	instructions1
	call	writestring
	call	crlf
	mov		edx, offset instructions2
	call	writestring
	call	crlf

jumpstart:
;GET THE FUCKING INPUT
	mov		edx, offset	firstPrompt
	call	crlf
	call	writestring
	call	readint
	mov		num1, eax
	call	crlf
	mov		edx, offset	secondPrompt
	call	writestring
	call	readint
	mov		num2, eax
	cmp		eax, num1
	jg		doitright
	jle		calculate

doitright:
	mov		edx, offset lessthan
	call	crlf
	call	writestring
	call	crlf
	jmp		jumpstart

calculate:
;DO THE FUCKING CALCULATIONS
	;MULTIPLY THE FUCK OUT OF IT
	mov		eax, num1
	mov		ebx, num2
	mul		ebx
	mov		rmult, eax
	;ADD THE FUCK OUT OF IT
	mov		eax, num1
	add		eax, num2
	mov		radd, eax
	;SUBTRACT THE FUCK OUT OF IT
	mov		eax, num1
	sub		eax, num2
	mov		rsub, eax
	;DIVIDE THE FUCK OUT OF IT
	mov		eax, num1
	mov		ebx, num2
	div		ebx
	mov		rdiv, eax
	mov		rrem, edx
;DISPLAY THE FUCK OUT OF IT
	;DISPLAY THE FUCK OUT OF MULTIPLICATION
	mov		eax, num1  
	call	writedec
	mov		edx, offset mults
	call	writestring
	mov		eax, num2
	call	writedec
	mov		edx, offset	equals
	call	writestring
	mov		eax, rmult
	call	writedec
	call	crlf
	;DISPLAY THE FUCK OUT OF ADDITION
	mov		eax, num1
	call	writedec
	mov		edx, offset adds
	call	writestring
	mov		eax, num2
	call	writedec
	mov		edx, offset equals
	call	writestring
	mov		eax, radd
	call	writedec
	call	crlf
	;DISPLAY THE FUCK OUT OF SUBTRACTION
	mov		eax, num1
	call	writedec
	mov		edx, offset subs
	call	writestring
	mov		eax, num2
	call	writedec
	mov		edx, offset equals
	call	writestring
	mov		eax, rsub
	call	writedec
	call	crlf
	;DISPLAY THE FUCK OUT OF DIVISION
	mov		eax, num1
	call	writedec
	mov		edx, offset divs
	call	writestring
	mov		eax, num2
	call	writedec
	mov		edx, offset equals
	call	writestring
	mov		eax, rdiv
	call	writedec
	mov		edx, offset remainder
	call	writestring
	mov		eax, rrem
	call	writedec
	call	crlf

;ASK THEM TO FUCKING REPEAT
	mov		edx ,offset byeyes
	call	writestring
	call	crlf
	call	readint
	mov		byeno, eax
	mov		eax, 0
	call	crlf
	cmp		byeno, eax
	jle		enditall

startthatshit:
;START IT AGAIN FUCK YEAH
	mov		edx, offset again
	call	writestring
	call	crlf
	jmp		jumpstart

enditall:
;SAY FUCKING GOODBYE
	call	crlf
	mov		edx, offset goodbye
	call	writestring
	call	crlf

; (insert executable instructions here)

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
