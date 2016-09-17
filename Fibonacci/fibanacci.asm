; Program template



.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
SEED0 = 0
SEED1 = 1
NSEQ = 14
fibArray WORD NSEQ + 2 DUP(?)
previousNum WORD 0d
currentNum WORD 1d

.code
main proc
	mov eax, 0
	mov ebx, 0
	mov esi, 0
	mov ax, SEED0
	mov fibArray[esi], ax
	add esi, TYPE fibArray
	mov ax, SEED1
	mov fibArray[esi], ax
	add esi, TYPE fibArray
	mov ecx, NSEQ
	L1:
		mov ax, previousNum
		mov bx, currentNum
		add ax, bx
		mov previousNum, bx
		mov currentNum, ax
		mov fibArray[esi], ax
		add esi, TYPE fibArray
		loop L1
	invoke ExitProcess,0
main endp
end main