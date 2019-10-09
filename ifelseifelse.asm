TITLE Program Template     (template.asm)

; Author:
; Last Modified:
; OSU email address: 
; Course number/section:
; Project Number:                 Due Date:
; Description:

INCLUDE Irvine32.inc

; constants for ages
adult = 18
driver = 16

.data

; prompt and responses
prompt		BYTE	"Tell me your age and I will tell you something about you: ", 0
is_adult	BYTE	"You are an adult. Congratulations. ", 0
is_driver	BYTE	"You can drive! Wow. ", 0
is_baby		BYTE	"You are just a mere baby. Go home and grow up! ", 0
bye			BYTE	"Thanks for trying me out. Take care of yourself!", 0

; age variable
age			BYTE	?

.code
main PROC
	
	; prompt and get int
	mov		edx, offset prompt
	call	WriteString
	call	ReadInt
	mov		age, al

	cmp		al, adult
	jge		adult_message
	cmp		al, driver
	jge		driver_message
	jmp		baby_message

	adult_message:
			mov		edx, offset is_adult
			call	WriteString
			jmp		driver_message

	driver_message:
			mov		edx, offset is_driver
			call	WriteString
			jmp		done

	baby_message:
			mov		edx, offset	is_baby
			call	WriteString
			

	done:
			call	CrLf
			call	CrLf
			mov		edx, offset bye
			call	WriteString
			call	CrLf

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
