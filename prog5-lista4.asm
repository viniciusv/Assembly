TITLE Maior ou iguais
; Faça um programa que crie um array de 10 posições, inicializado pelo próprio programa, e apresente o maior e o menor elementos. 
; Utilize procedimentos, se possível.

.386
.model flat,stdcall
include c:\masm32\include\kernel32.inc
include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\kernel32.lib
includelib c:\masm32\lib\Irvine32.lib

.data						
array DWORD 10,20,30,40,50,60,70,80,90,100
msg1 BYTE "Maior: ",0
msg2 BYTE "Menor: ",0

.code
principal PROC
	mov edi,OFFSET array
	mov ecx,LENGTHOF array
	call comparaMaior
	call comparaMenor
	INVOKE ExitProcess,0
principal ENDP

comparaMaior PROC
	push edi
	push ecx
	mov eax,[edi]
inicio
	add edi,TYPE array
	.IF ([edi] > eax)
		mov eax,[edi]
	.ENDIF
	loop inicio
	mov edx,OFFSET msg1
	call WriteString
	call WriteDec
	pop ecx
	pop edi
	ret
comparaMaior ENDP

comparaMenor PROC
	push edi
	push ecx
	mov eax,[edi]
inicio
	add edi,TYPE array
	.IF ([edi] < eax)
		mov eax,[edi]
	.ENDIF
	loop inicio
	mov edx,OFFSET msg2
	call WriteString
	call WriteDec
	pop ecx
	pop edi
	ret
comparaMenor ENDP
END principal
