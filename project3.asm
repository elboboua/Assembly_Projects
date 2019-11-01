TITLE AccuMachine  (project3.asm)

; Description: Getting used to loops in assembly

INCLUDE Irvine32.inc

; age limit constant
UPPER_LIMIT = -1
LOWER_LIMIT = -150

.data

; greeting and salutation
greeting	BYTE "Welcome to the AccuMachine by Ahmad El-Bobou", 0
ask_name	BYTE "What's your name? ", 0
hello		BYTE "Hello, ", 0
goodbye		BYTE "", 0

; instructions
instrs		BYTE "Please enter numbers in the range [-150, -1]", 0
enter_num	BYTE "Enter number: ", 0

; errors prompts
num_too_low	BYTE "Ignored this number! Please enter within the range [-150, -1]", 0


; input and arithmetic variables
username	BYTE  25 DUP(0)
input 		DWORD ?
sum 		DWORD 0
avg 		DWORD ?
num_count	DWORD 0

.code
main PROC

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

; greets the user, asks their name, and says hello
greet PROC

	; greet and display title and programmer name
	mov 	edx, offset greeting
	call	WriteString
	call 	CrLf

	; ask for name
	mov		edx, offset ask_name
	call	WriteString
	mov		edx, offset username
	mov		ecx, 25
	call 	ReadString
	mov		username, edx

	; say "Hello, username"
	mov		edx, offset hello
	call	WriteString
	mov		edx, offset username
	call 	WriteString

	ret
greet ENDP

; gives the user instructions
give_instructions PROC

	mov 	edx, offset instrs
	call 	WriteString

	ret
give_instructions ENDP

; loops to get user input
get_input PROC

	; get number
	mov 	edx, offset enter_num
	call 	WriteString
	call 	ReadInt

	; check if in range
	cmp		eax, UPPER_LIMIT
	jg		done

	cmp 	eax, LOWER_LIMIT
	jl		too_low

	; if in range, add to sum and increment number counter
	mov		input, eax
	mov		eax, sum
	add		eax, input
	inc num_count
	jmp 	next

	too_low:
		mov		edx, offset num_too_low
		call	WriteString
		call 	CrLf

	next:
		call	get_input
		
	done:
	
	ret
get_input ENDP


END main
