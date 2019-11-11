TITLE CompoPrinter (project4.asm)

; Description: A program to practice if, else if, and else in assembly

INCLUDE Irvine32.inc

LOWER_LIMIT = 300
UPPER_LIMIT = 1

.data

; text to be printed to screen
hello       BYTE    "Welcome to the CompoPrinter created by Ahmad El-Bobou!", 0
explanation BYTE    "This program prints up to 300 composite numbers.", 0
instrs      BYTE    "Enter the number of composite numbers you'd like to see in the range [1 .. 300].", 0
prompt      BYTE    "How many numbers [1 ... 300] would you like to see listed?: ", 0
goodbye_msg BYTE    "Thanks for using the CompoPrinter"
spaces      BYTE    "   ", 0

; error messages
out_of_range    BYTE    "You've entered a number out of range! Please try again.", 0


; arithmetic variables
composite_bool  BYTE    0
num_chosen      DWORD   ?
line_num        BYTE    0
current_num     DWORD   4

.code
main PROC
	
    call    introduction
    call    getUserInput
    call    showComposites
    call    goodbye

	exit	; exit to operating system
main ENDP

; introduce the program
introduction PROC

    mov     edx, offset hello
    call    WriteString
    call    CrLf

    mov     edx, offset explanation
    call    WriteString
    call    CrLf

introduction ENDP

; validates user input
validate PROC

validate ENDP

; gets user input
getUserInput PROC

    mov     edx, offset instrs
    call    WriteString
    call    CrLf


    call    validate
getUserInput ENDP

; checks if number is composite
isComposite PROC

isComposite ENDP

; Prints the composite numbers
showComposites PROC

    call    isComposite

showComposites ENDP

; says goodbye
goodbye PROC

    mov     edx, offset goodbye_msg
    call    WriteString
    call    CrLf

goodbye ENDP

END main
