TITLE Maior ou iguais
; Faça um programa que leia três números inteiros e mostre o maior.

.386
.model flat,stdcall
include c:\masm32\include\kernel32.inc
include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\kernel32.lib
includelib c:\masm32\lib\Irvine32.lib

.data						
msg1 BYTE "n1 maior",0
msg2 BYTE "n2 maior",0
msg3 BYTE "n3 maior",0
msg4 BYTE "Entre com um numero: ",0

.code
principal PROC
	call leNum
	mov ebx,eax
	call leNum
	mov ecx,eax
	call leNum
	.IF (ebx > ecx) && (ebx > eax)
		mov edx,OFFSET msg1
		call WriteString
	.ELSEIF (ecx > ebx) && (ecx > eax)
		mov edx,OFFSET msg2
		call WriteString
	.ELSE
		mov edx,OFFSET msg3
		call WriteString
	.ENDIF
	INVOKE ExitProcess,0
principal ENDP

leNum PROC
	mov edx,OFFSET msg4 		
	call WriteString			
	call ReadInt 				
	ret
leNum ENDP
END principal
