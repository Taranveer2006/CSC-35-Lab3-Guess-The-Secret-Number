#--------------------------------------------------------
# Lab 3: The Secret Number
#--------------------------------------------------------
.intel_syntax noprefix
.data

# Declare Strings
	PromptWelcome: .asciz "I am thinking of a number between 1 and 100\n"
	PromptUserInstr: .asciz "Enter your guess:"
	PromptTooHigh: .asciz "Too High!\n"
	PromptTooLow:  .asciz "Too Low!\n"
	PromptWin: .asciz "You got it! You Win!\n"

.text
.global Program

Program:

# Generate the Secret Number
	mov rcx, 100
	call GetRandom
	add rcx, 1
	mov r8, rcx

#Loop


	lea rcx, PromptWelcome
	call PrintStrZ

Do:
	lea rcx, PromptUserInstr
	call PrintStrZ

	call ScanInt64
	cmp rcx, r8

	jg TooHigh
	jl TooLow
	lea rcx, PromptWin
	call PrintStrZ
	jmp End

TooHigh:

	lea rcx, PromptTooHigh
	call PrintStrZ
	jmp Do
TooLow:
	lea rcx, PromptTooLow
	call PrintStrZ
	jmp Do

End:
	 Call ProgramEnd


