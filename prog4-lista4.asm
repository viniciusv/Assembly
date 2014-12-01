TITLE Maior ou iguais
;  Faça um programa que some as posições de um array de seis posições, inicializado pelo próprio programa, e apresente se o resultado é maior que 200.
; Utilize um procedimento para a soma do array e outro para a comparação.

.386
.model flat,stdcall
include c:\masm32\include\kernel32.inc
include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\kernel32.lib
includelib c:\masm32\lib\Irvine32.lib

.data						
array DWORD 10,20,30,40,50,60
msg1 BYTE "E maior que 200: ",0
msg2 BYTE "E menor que 200: ",0

.code
principal PROC
	call somaArray
	call compara
	INVOKE ExitProcess,0
principal ENDP

somaArray PROC
	mov edi,OFFSET array
	mov ecx,LENGTHOF array
	mov eax,0
soma:
	add eax,[edi]
	add edi,TYPE array[
	loop soma	
	ret
somaArray ENDP

compara PROC
	.IF (eax > 200)
		mov edx,OFFSET msg1
		call WriteString
		call WriteDec
	.ELSE
		mov edx,OFFSET msg2
		call WriteString
		call WriteDec
	.ENDIF
	ret
compara ENDP
END principal
