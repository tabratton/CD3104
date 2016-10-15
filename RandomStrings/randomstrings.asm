INCLUDE Irvine32.inc

.data
maxStringLength DWORD 120d
arrayB BYTE 50d DUP(?)

.code
main proc
	call Randomize					; Initialize seed value for random number generations
	mov esi, OFFSET arrayB          ; Get the offset of the string array
	mov ecx, 20d					; Loop 20 times
	L1:
		mov eax, maxStringLength	; Defines the maximum length of our random strings
		call RandomRange			; Gets a random length in the range 0-(maxStringLength-1)
		add eax, 1d					; Makes the range 1-maxStringLength
		call RandomString			; Creates a random string of the random length that we generated
		mov edx, esi				; WriteString requires the OFFSET of the string to be in EDX
		call WriteString			; Writes the string to the console window
		call Crlf					; Writes the newline characters so that the next string is on a new line
		loop L1
	call WaitMsg					; Displays the Press any key to contine... message
	invoke ExitProcess,0
main endp

;---------------------------------------------------------------;
; RandomString                                                  ;
;                                                               ;
; Generates a random, null terminated string                    ;
; Receives: EAX = the length of the string to generate          ;
;			ESI = the offset of the array to store the string   ;
;---------------------------------------------------------------;

RandomString proc uses eax ecx esi	; uses automatically pushes and pops the registers used in the procedure
	mov ecx, eax					; move required string length to loop counter
	L2:
		mov eax, 26d				; Make range of the generated number 0-25
		call RandomRange			; Generate the number
		add eax, 65d				; Shift the range of possible values to the capital letters in ASCII
		mov [esi], al				; Store the character (number) at the current array position
		add esi, TYPE arrayB		; Move to the next position in the array
	loop L2
	mov BYTE PTR [esi], 0d			; Put 0 at the end of the string so that it is null terminated
	ret								; Return program execution to where the procedure was called
RandomString endp

end main

