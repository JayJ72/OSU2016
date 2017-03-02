TITLE Politically Correct Accumulator     (Politically Correct Accumulator.asm)

; Author: Jay Banerji
; Course / Project ID      CS271 Program 3            Date: 23/10/16
; Description: An accumulator program written in MASM that won't offend anyone ever, hopefully

INCLUDE Irvine32.inc

lowerlim equ <-100>
upperlim equ <0>

.data
hi	 byte	"All-user-inclusive Accumulator",0
myname	byte	"by Jay Banerji",0
trigger	byte	"*Trigger Warning: Numbers, Logic. EC = GIVE ME XTRA CRED FOR NUMBERED LINES AND CREATIVITY*",0
hello	byte	"Non-denominatinational/gendered greetings to you, user",0
consent	byte	"Do you consent to being asked a question? (Y=1, N=0) *Trigger Warning: Question*",0
hiagain	byte	"Hello, ",0
no	byte	"That is your right, apologies for asking",0
askname	byte	"May I please know your preferred name/title/spirit identifier/bird-call?",0
username	oword	?,0
instruction	byte	"Please non-discriminatively enter numbers between -100 and -1",0
instruction2	byte	"Please multiculturally enter a non-negative number to finish the program",0
enternum	byte	"Enter number: ",0
num		dword	?
space	byte	": ",0
count	dword	1 ;is 1 to make sure never divided by 0
entered	byte	"You entered ",0
valid	byte	" uniquely valid and special numbers",0
resultis	byte	"The personal spiritual identiy of these numbers sums to ",0
avgis	byte	"The empowered collective of these numbers averages to ",0
avg	dword	?
bye	byte	"Good-or-otherwise-culturally-inclusive bye to you, ",0
gratz	byte	"You go, standing up the man/society/patriarchy/capitalism! How progressive and politically correct!",0

.code
main PROC
;Introductions
mov edx, offset hi
call writestring
call crlf
mov edx, offset myname
call writestring
call crlf
mov edx, offset trigger
call writestring
call crlf
mov edx, offset hello
call writestring
call crlf

;Ask consent to ask a question
mov edx, offset consent
call writestring
call crlf
call	readint
cmp	eax, 1
jne	notconsent
call crlf

;Get the username
mov	edx, offset askname
call	writestring
call crlf
mov edx, offset username
mov	ecx, 32
call	readstring
call crlf
mov	edx, offset hiagain
call writestring
mov	edx, offset username
call writestring
call crlf

;Ask consent again
mov edx, offset consent
call writestring
call crlf
call readint
cmp	eax, 1
jne	notconsent
call crlf

;Instructions
mov edx, offset instruction
call writestring
call crlf
mov edx, offset instruction2
call writestring
call crlf

inputprocess:
	mov eax, count
	call writedec
	mov edx, offset space
	call writestring
	mov edx, offset enternum
	call writestring
	call readint
	;verify input
	cmp eax, upperlim
	jge output
	cmp eax, lowerlim
	jle congrats
	inc count ;only inc if not an exception
	add num, eax
	jmp inputprocess

output:
	mov edx, offset entered
	call writestring
	dec count ;to make sure not inaccurate
	mov eax, count
	inc count
	call writedec
	mov edx, offset valid
	call writestring
	call crlf
	mov edx, offset resultis
	call writestring
	mov eax, num
	call writeint
	call crlf
	mov edx, offset avgis
	call writestring
	xor edx, edx ;clear register
	mov eax, num
	cdq
	dec count
	idiv count ;divide
	call writeint
	inc count
	call crlf
	jmp byebyebye

congrats:
	mov edx, offset gratz
	call writestring
	call crlf
	jmp inputprocess
	
notconsent:
	mov	edx, offset no
	call writestring
	call crlf
	jmp byebyebye

byebyebye:
	mov edx, offset bye
	call writestring
	mov edx, offset username
	call writestring
	call crlf

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
