TITLE CS271 Assignment 2    (Assignment2.asm)

; Author: Jay Banerji
; CS271 Assignment 2             Date: 10/6/16
; Description: A program that loops and does that italian pasta thing with numbers. Also give me extra credit for my incredibly sarcastic tone.

INCLUDE Irvine32.inc

; (insert constant definitions here)

.data
hi	byte	"Fibonacci Number Thingo",0
myname	byte	"by Jay Banerji",0
prompt1	byte	"If you're gonna make me do arithmetic at least tell me your name first.",0
username	oword	? , 0
greet2	byte	"... That's your name? Lame.",0
prompt2 byte	"Enter a number between 1-46. Why? Don't ask questions.",0
enterhere	byte "Enter number: ",0
input	dword	?
num1	dword	0
num2	dword	1
num3	dword	?
comma	byte	", ",0
doitright	byte	"Wow, I wasn't aware ",0
doitright2	byte	" is between 1-46, genius. Try again.",0
prompt3	byte	"Can I go now? (1=y,0=n)",0
why	byte	"Ughhhhh fine",0
bye	byte	"Cya. Good luck, you'll need it with a name like "


.code
main PROC
;introduce them to the program
introduction:
	mov	edx, offset hi
	call writestring
	call crlf
	mov edx, offset myname
	call writestring
	call crlf
	mov edx, offset prompt1
	call writestring
	call crlf
	mov	edx, offset username ;get their username
	mov	ecx, 32
	call readstring
	call writestring
	mov	edx, offset greet2 ;make fun of their username
	call writestring

;boss them around
userinstructions:
	mov	edx, offset prompt2
	call crlf
	call writestring
	call crlf
;get their input, assuming they even know what a number is
getuserdata:
	mov	edx, offset enterhere
	call writestring
	call readint
;protect the program against when they inevitably cannot follow even the simplest of instructions
	cmp eax, 1
	jl plz
	cmp eax, 46
	jg plz
;set the count to their input and prep comma
	mov ecx, eax
	mov edx, offset comma
;write the extra 1 at the start of the fibonacci sequence
	mov eax, 1
	call writedec
	call writestring

;shoop da whoop da loop
loop1:
	mov eax, num1
	add eax, num2
	call writedec
	call writestring
	mov num3, eax
	mov eax, num2
	mov num1, eax
	mov eax, num3
	mov num2, eax ;uses typical num3=num2+num1 fibonacci formula
	loop loop1
	jmp farewell? 

plz:
	mov	edx, offset doitright ;tell them to not be wrong all the time
	call	writestring
	call writedec
	mov edx, offset doitright2 ;mock their mistakes
	call writestring
	call crlf
	jmp getuserdata ;let them try again and hope they don't break it

farewell?:
	mov edx, offset prompt3
	call writestring
	call crlf
	call readint ;ask if i can finally go home
	cmp eax, 1
	je	farewell
	jne sad
	call crlf

;be sad that i have to sit here and keep dealing with them
sad:
	mov edx, offset why
	call writestring
	call crlf
;reset all the variables for another round
	mov eax, 0
	mov num1, eax
	mov num3, eax
	mov eax, 1
	mov num2, eax
	jmp getuserdata

;be happy i can go home
farewell:
	mov edx, offset bye
	call writestring
	mov	edx, offset username
	call writestring
	call crlf
	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
