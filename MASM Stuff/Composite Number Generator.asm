TITLE Spoopy Composite Number Generator     (SpoopyScerrySkellingtons.asm)

; Author: Jay Banerji (Dr. Frankenstein)
; Course / Project ID Assignment 4 CS271                Date: 30/10/2016 (Mischief Night)
; Description: A haunted number generator that spookily looks to test for the curse of primality and print out the spooky undead composite numbers. Give me EC for aligning columns
INCLUDE Irvine32.inc

; (insert constant definitions here)

.data
limup equ <400>
limlo equ <1>
spooky	byte	"Spoopy Composite Number Generator",0
scary	byte	"by Jay Banerji",0
skeleton	byte	"WoooOOOOOooooOOOOOoooOOOoOO, give me EC for aligning colummnnnnsss",0
hi	byte	"Who dares awaken the spooky scary skeletons?",0
username	dword	?,0
so	byte	", you foolish mortal. So you wish to see our power?",0
instructions	byte	"Then behold! Merely state how many composite numbers you would like to see, and witness true terror!",0
limits	byte	"But be warned, should you state a number beyond 400 or below 1, things may become... ghoulish..",0
enterhere	byte	"State how many now, or you will hold your peace.. eternally",0
space	byte	"   ",0 ;To space out the output appropriately
nums	dword	? ;To hold the user's input
counter	dword	2 ;Starts at 2 to avoid providing a false positive for division by 1
line	dword	10 ;To have 10 outputs per line
testy	dword	2 ;Starts at 2 similar to counter
outofrange	byte	"YOU INSOLENT MORTAL! YOU DARE IGNORE THE WARNINGS OF THE UNDEAD? FOR THIS YOU SHALL BE PUNISHED DEARLY. SUFFER OUR TERRIBLE CURSE FOREVERMORE, ",0
lol	byte	"MWAHAHAHHAHAHAHAHAHAHAHAHAHAAAAAAAAAAAAAA! Now try again.",0
results	byte	"It is done! Behold! Are you not impressed and terrified by the power of the spookiest scariest skelingtons? Goodbye, ",0
; (insert variable definitions here)

.code
main PROC
call intro
call input
call process
exit	; exit to operating system
main ENDP


intro PROC
	;introduce you to the spooky skery skellingtones
	mov edx, offset spooky					;Do you the spook
	call writestring
	call crlf
	mov edx, offset scary					;Continue doing you a significant spook
	call writestring
	call crlf
	call crlf
	mov edx, offset skeleton				;Spoopy for days
	call writestring
	call crlf
	call crlf
	mov edx, offset hi						;Introduce and be cordial and friendly 
	call writestring
	call crlf

askname:
	;get username
	mov edx, offset username
	mov ecx, 32
	call readstring
	call crlf
	call crlf
	call writestring
	mov edx, offset so
	call writestring
	call crlf
	mov edx, offset instructions			;Provide program instructions
	call writestring
	call crlf
	mov edx, offset limits					;Explain constraints
	call writestring
	call crlf
	ret
intro ENDP

input PROC
	;GET THE SPOOKY INPUT
	mov edx, offset enterhere
	call writestring
	call crlf
	call readint		
	mov nums, eax			;Save user input to nums for later
	;Validating the input to ensure it's in scope
	cmp nums, limlo			
	jl fool
	cmp nums, limup
	jg fool
	ret

;Error message which is also spooky
fool:
	mov edx, offset outofrange
	call writestring
	mov edx, offset username
	call writestring
	call crlf
	mov edx, offset lol
	call crlf
	jmp input
input ENDP

;Time to do the spookiest part of all, maths
process PROC 
	mov	eax, counter		;implement the count
	mov ebx, testy			;implement the other testing variable
	cmp eax, ebx			;check if they are equal, if so, process has completed and the number is not composite
	je	loopsshoopdawhoop
	xor edx, edx			;prep for division
	div testy
	cmp edx, 0				;check for 0 remainder
	je keep					;keep the composite and print
	inc testy				;increment the test variable
	jmp process				;reset if not a factor
	
loopsshoopdawhoop:			;This is a prime
	inc counter				;increment the counter to find more composites
	mov	testy, 2			;reset test variable
	jmp	process

keep:
	mov	eax, counter		;write out the composite number
	call writedec
	mov	edx, offset space	;space it out appropriately
	call writestring
	jmp memes				;check out some dank memes

memes:
	inc	counter				;increment the counter to find more composites
	dec line				;decrement the line output to see how many more you can fit
	dec nums				;decrement the amount needed left to find
	cmp nums, 0				;check if you need to find more
	je endy
	cmp line, 0				;reset if you cant fit more
	je	reset
	jmp kenny

reset:
	mov line, 10			;CANT FIT HINT HINT
	call crlf

kenny:
	jmp process				;random thing to jump back because why not

endy:
	call crlf
	mov edx, offset results	;finish the program and say goodbye (in a spooky way of course)
	call writestring
	mov edx, offset username
	call writestring
	call crlf
	ret
process ENDP

; (insert executable instructions here)


; (insert additional procedures here)

END main
