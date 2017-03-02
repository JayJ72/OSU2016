TITLE Sorting Program     (Sillysort.asm)

; Author: Jay Banerji
; Course / Project ID CS271 Assignment 5                Date: 14/11/2016
; Description: A silly program that silly sorts some silly stuff

INCLUDE Irvine32.inc

; (insert constant definitions here)
max equ <200>
hi	equ <999>
min equ <10>
lo equ <100>

.data
hello byte "Silly Sort some Silly Stuff",0
me	byte	"By Jay Banerji",0
descr	byte	"Hello, today we're gonna sort some silly numbers using a silly sort",0
death	byte	"Please enter a silly number between 10 and 200",0
silly	byte	"Oh that was silly of you, try again to enter a silly number",0
space	byte	" ",0
nums	dword	?
rand	dword	?
usercount	dword	?
array	dword	?


; (insert variable definitions here)

.code
main PROC
call intro
call input
call random
call output
exit
main endp
; (insert executable instructions here)

;Intro and instructions
Intro PROC
	mov edx, offset hello
	call writestring
	call crlf
	mov edx, offset me
	call writestring
	call crlf
	mov edx, offset descr
	call writestring
	call crlf
	ret
Intro ENDP

;Input block
Input PROC
	mov edx, offset death
	call writestring
	call crlf
	call readint
	cmp eax, min ;validate input
	jl screamintothevoid
	cmp eax, max
	jg screamintothevoid
	ret
	;Tell them they messed up 
	screamintothevoid:
		mov edx, offset silly
		call writestring
		call crlf
		jmp input 
Input ENDP

;ready up for randomisation
Random PROC
	mov ecx, nums
	mov esi, 0

loopshoop:
;does the random thing the lectures explain
	mov eax, hi
	sub eax, lo
	inc eax
	call randomrange
	add eax, lo
	call writeint
	mov edx, offset space
	call writestring
	mov array[esi*4], eax ;go up a value in the arraay
	inc esi
	loop loopshoop
ret
Random ENDP

;output the random numbers
Output PROC
	mov esi, 0
	mov ecx, nums ;so it prints out the amount we want [THIS DOES NOT WORK IDK WHY]

	print:
		mov eax, array[esi*4] ;go up each in the array
		call writeint
		mov edx, offset space
		call writestring
		inc esi
		loop print
	ret
Output ENDP

; (insert additional procedures here)

END main
