TITLE MemeMachine     (mememachine.asm)

; Author: Jay Banerji
; Course / Project ID  CS271 Program 6                Date: 3/12/2016
; Description: Meme machine built in honour of keku

INCLUDE Irvine32.inc
MAXCHAR equ <10>
asciilow equ <48>
asciihi	equ <57>
tard equ <655360>
; (insert constant definitions here)

.data
hello byte "Meme machine to display some creme",0
me	byte	"By Jay Banerji",0
greet	byte	"Greetings Imperial Citizens",0
descr	byte	"In the name of the Emperor, you must provide 10 unsigned decimal integers",0
descr2	byte	"And let these values not exceed the size of a 32 bit register (below 4294967295)",0
descr3	byte	"By His wisdom, we will demonstrate a list of those integers, their sum, and their average value",0
prompt	byte	"Speak now!: ",0
error	byte	"HERESY! THAT IS NOT AN UNSIGNED INTEGER IN THE APPROPRIATE RANGE! PURGE THE HERETIC!",0
again	byte	"NAME MORE INTEGERS!: ",0
response	byte	"The following integers were uttered: ",0
thesum	byte	"The sum of these integers is: ",0
theavg	byte	"The average of these integers is: ",0
rem	byte	"remainder: ",0
bye	byte	"ALL HAIL THE GOD-EMPEROR KEKU, GOODBYE!",0
space byte	", ",0
remtemp dword ?
count	dword	?
inputchar	dword	?
input	dword	MAXCHAR DUP(?)
sum	dword	?
tempcount dword ?
intval dword ?


; (insert variable definitions here)
writewords macro words
mov edx, offset words
call writestring
call crlf
endm

preparray macro
mov esi, 0
mov ecx, 10
xor eax,eax
endm

writenumblock macro
call writedec
call crlf
endm

getString macro stringOffset, size
push ecx
push edx
writewords prompt
mov edx, stringOffset
mov ecx, size -1
call ReadString
mov count, eax
pop edx
pop ecx
endm





.code
main PROC
call intro

;Get the input
preparray

shooploop:
call getinput
loop shooploop

;Sum the input
preparray
loopshoop:
call sums
loop loopshoop
mov sum, eax

;Output vals entered
writewords response
preparray
wooploop:
call display
loop wooploop

;Output sum
writewords thesum
mov eax, sum
writenumblock

;Output avg
writewords theavg
mov ebx, 10
cdq
div ebx
mov remtemp, edx ;save remainder
writenumblock
writewords rem
mov eax, remtemp
writenumblock

;Bye
writewords bye
exit
main ENDP

intro proc
	writewords hello
	writewords me
	writewords greet
	writewords descr
	writewords descr2
	writewords descr3
	ret
intro endp

getinput proc
	call readVal
	mov eax, intval
	jo	no  ;validate
	mov input[esi*4], eax
	inc esi
	ret

	no:
		writewords error
		writewords again
		jmp getinput
getinput endp

sums proc
	add eax, input[esi*4]
	inc esi
	ret
sums endp

display proc
	mov eax, input[esi*4]
	call writeint
	writewords space
	inc esi
	ret
display endp

readVal proc
	push ebp
	push ecx
	push esi
	mov ecx, MAXCHAR
	getString offset input, (sizeof input) ;Maybe store input as single variable first?
	mov esi, offset input
	mov ecx, count
	cld
	xor ebx, ebx
convert:
	xor eax, eax
	lodsb
	cmp eax, 0
	je nope
	cmp eax, asciilow ;validate
	jle nope
	cmp eax, asciihi
	jge nope
	sub eax, 48
	;cbw
	;cwde
	mov inputchar, eax
;	push ecx
;	mov ecx, count-2
	push ecx
	mov eax, count
	mov tempcount, eax
	mov ebx, 10
	mov eax, 10
	sub tempcount, 2 ;for place value appropriate
	mov ecx, tempcount
	factloop:
	mul ebx
	loop factloop
	pop ecx
	mov ebx, inputchar
	mul ebx
	add intval, eax
	add esi, 16
	loop convert
	;mov eax, input
	;mov eax, input[esi*4]
;	mov eax, intval
	nope:
	pop esi
	pop ecx
	pop ebp
	ret
readVal endp


; (insert additional procedures here)

END main
