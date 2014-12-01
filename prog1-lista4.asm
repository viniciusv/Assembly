TITLE Maior
; Faça um programa que leia dois números inteiros e mostre o maior.

.386
.model flat,stdcall
include c:\masm32\include\kernel32.inc
include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\kernel32.lib
includelib c:\masm32\lib\Irvine32.lib

.data
n1 SDWORD ?						
msg1 BYTE "Num1 maior ",0
msg2 BYTE "Num2 maior ",0
msg3 BYTE "Entre com um numero: ",0

.code
principal PROC
	call leNum
	mov n1,eax
	call leNum
	.IF (n1 > eax)
		mov edx,OFFSET msg1
		call WriteString
	.ELSE 
		mov edx,OFFSET msg2
		call WriteString
	.ENDIF
	INVOKE ExitProcess,0
principal ENDP

leNum PROC
	mov edx,OFFSET msg3 		
	call WriteString			
	call ReadInt 				
	ret
leNum ENDP
END principal
