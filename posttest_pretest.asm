TITLE Posttesting & Pretesting with cats  (posttest_pretest.asm)

; Description: Getting used to loops in assembly

INCLUDE Irvine32.inc

; age limit constant
age_limit = 18
minimum_cats = 1

.data

; prompt and results
instructions	BYTE	"Hello, there. Welcome to the clubhouse. How old are you? ", 0
is_adult		BYTE	"Welcome, brother. Your age: ", 0
is_minor		BYTE	"Scram, kid. Come back with an adult! Your age: ", 0
qty_cats		BYTE	"How many cats do you have, brother? ", 0
too_few_cats	BYTE	"You don't have enough cats. Get out of our clubhouse! Come back when you have more", 0
enough_cats		BYTE	"Your request for membership has been granted. ", 0

; age variable
age				BYTE	?
cats			BYTE	?

.code
main PROC
	
; prompt age
	mov		edx, offset instructions
	call	WriteString

	; loop for correct age
	check:
		call	ReadInt
		mov		age, al
		cmp		age, age_limit
		jge		pass

	fail:
		mov		edx, offset is_minor
		call	WriteString
		mov		al, age
		call	WriteDec
		call	CrLf
		call	CrLf
		mov		edx, offset instructions
		call	WriteString
		jmp		check

	pass:
		mov		edx, offset is_adult
		call	WriteString
		mov		al, age
		call	WriteDec
		call	CrLf
		call	CrLf



	; check how many cats someone has
	mov		edx, offset qty_cats
	call	WriteString
	call	ReadInt
	mov		cats, al

	cat_check:
		cmp		cats, minimum_cats
		jl		fail

	cat_pass:
		mov		edx, offset enough_cats
		call	WriteString
		call	CrLf
		call	CrLf
		jmp		done

	cat_fail:
		mov		edx, offset too_few_cats
		call	WriteString
		call	CrLf
		call	CrLf
		mov		edx, offset qty_cats
		call	WriteString
		call	ReadInt
		mov		cats, al
		jmp		check

	done:

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
